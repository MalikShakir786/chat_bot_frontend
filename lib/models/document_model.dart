class DocumentModel {
  DocumentModel({
    required this.id,
    required this.filename,
    required this.fileType,
    required this.filePath,
    required this.fileSize,
    required this.uploadedAt,
  });

  final int? id;
  final String? filename;
  final String? fileType;
  final String? filePath;
  final String? fileSize;
  final DateTime? uploadedAt;

  factory DocumentModel.fromJson(Map<String, dynamic> json){
    return DocumentModel(
      id: json["id"],
      filename: json["filename"],
      fileType: json["file_type"],
      filePath: json["file_path"],
      fileSize: json["file_size"],
      uploadedAt: DateTime.tryParse(json["uploaded_at"] ?? ""),
    );
  }

  Map<String, dynamic> toJson() => {
    "id": id,
    "filename": filename,
    "file_type": fileType,
    "file_path": filePath,
    "file_size": fileSize,
    "uploaded_at": uploadedAt?.toIso8601String(),
  };

}
