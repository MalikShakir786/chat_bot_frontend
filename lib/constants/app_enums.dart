import 'package:chat_bot_frontend/constants/app_assets.dart';

enum FileType {
  pdf(1, "pdf", AppAssets.pdf),
  docx(2, "docx", AppAssets.docs),
  txt(3, "txt", AppAssets.txt);

  final int id;
  final String label;
  final String icon;

  const FileType(this.id, this.label, this.icon);

  static FileType? fromExtension(String ext) {
    switch (ext.toLowerCase()) {
      case 'pdf':
        return FileType.pdf;

      case 'docx':
      case 'doc':
        return FileType.docx;

      case 'txt':
      case 'text':
        return FileType.txt;

      default:
        return null;
    }
  }
}