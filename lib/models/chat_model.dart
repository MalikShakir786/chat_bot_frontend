class ChatModel {
  ChatModel({
    required this.id,
    required this.userId,
    required this.query,
    required this.answer,
    required this.sources,
    required this.confidence,
    required this.hasContext,
    required this.createdAt,
  });

  final int? id;
  final int? userId;
  final String? query;
  final String? answer;
  final List<Source> sources;
  final double? confidence;
  final dynamic hasContext;
  final DateTime? createdAt;

  ChatModel copyWith({
    int? id,
    int? userId,
    String? query,
    String? answer,
    List<Source>? sources,
    double? confidence,
    dynamic? hasContext,
    DateTime? createdAt,
  }) {
    return ChatModel(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      query: query ?? this.query,
      answer: answer ?? this.answer,
      sources: sources ?? this.sources,
      confidence: confidence ?? this.confidence,
      hasContext: hasContext ?? this.hasContext,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  factory ChatModel.fromJson(Map<String, dynamic> json){
    return ChatModel(
      id: json["id"],
      userId: json["user_id"],
      query: json["query"],
      answer: json["answer"],
      sources: json["sources"] == null ? [] : List<Source>.from(json["sources"]!.map((x) => Source.fromJson(x))),
      confidence: json["confidence"],
      hasContext: json["has_context"],
      createdAt: DateTime.tryParse(json["created_at"] ?? ""),
    );
  }

  Map<String, dynamic> toJson() => {
    "id": id,
    "user_id": userId,
    "query": query,
    "answer": answer,
    "sources": sources.map((x) => x?.toJson()).toList(),
    "confidence": confidence,
    "has_context": hasContext,
    "created_at": createdAt?.toIso8601String(),
  };

}

class Source {
  Source({
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

  Source copyWith({
    String? source,
    String? fileType,
    int? page,
    double? similarityScore,
    String? preview,
  }) {
    return Source(
      source: source ?? this.source,
      fileType: fileType ?? this.fileType,
      page: page ?? this.page,
      similarityScore: similarityScore ?? this.similarityScore,
      preview: preview ?? this.preview,
    );
  }

  factory Source.fromJson(Map<String, dynamic> json){
    return Source(
      source: json["source"],
      fileType: json["file_type"],
      page: json["page"],
      similarityScore: json["similarity_score"],
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
