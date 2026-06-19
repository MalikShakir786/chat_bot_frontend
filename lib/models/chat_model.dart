class SourceModel {
  SourceModel({
    required this.source,
    required this.fileType,
    required this.page,
    required this.similarityScore,
    required this.preview,
  });

  final String? source;
  final String? fileType;
  final int? page;
  final double? similarityScore;
  final String? preview;

  factory SourceModel.fromJson(Map<String, dynamic> json) {
    return SourceModel(
      source: json["source"],
      fileType: json["file_type"],
      page: json["page"],
      similarityScore: (json["similarity_score"] as num?)?.toDouble(),
      preview: json["preview"],
    );
  }

  Map<String, dynamic> toJson() => {
    "source": source,
    "file_type": fileType,
    "page": page,
    "similarity_score": similarityScore,
    "preview": preview,
  };
}

class ChatModel {
  ChatModel({
    required this.query,
    required this.answer,
    required this.sources,
    required this.confidence,
    required this.hasContext,
  });

  final String? query;
  final String? answer;
  final List<SourceModel> sources;
  final double? confidence;
  final bool? hasContext;

  factory ChatModel.fromJson(Map<String, dynamic> json) {
    return ChatModel(
      query: json["query"],
      answer: json["answer"],
      sources: json["sources"] == null
          ? []
          : List<SourceModel>.from(
        (json["sources"] as List).map((s) => SourceModel.fromJson(s)),
      ),
      confidence: (json["confidence"] as num?)?.toDouble(),
      hasContext: json["has_context"],
    );
  }

  Map<String, dynamic> toJson() => {
    "query": query,
    "answer": answer,
    "sources": sources.map((s) => s.toJson()).toList(),
    "confidence": confidence,
    "has_context": hasContext,
  };
}

// ============ UI-level chat message (one bubble in the list) ============

enum ChatMessageSender { user, agent }

class ChatMessageModel {
  ChatMessageModel({
    required this.sender,
    required this.text,
    required this.time,
    this.isLoading = false,
    this.sources = const [],
  });

  final ChatMessageSender sender;
  final String text;
  final String time;
  final bool isLoading;
  final List<SourceModel> sources;

  ChatMessageModel copyWith({
    String? text,
    bool? isLoading,
    List<SourceModel>? sources,
  }) {
    return ChatMessageModel(
      sender: sender,
      text: text ?? this.text,
      time: time,
      isLoading: isLoading ?? this.isLoading,
      sources: sources ?? this.sources,
    );
  }
}