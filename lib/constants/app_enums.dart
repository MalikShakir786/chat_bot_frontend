import 'package:chat_bot_frontend/constants/app_assets.dart';

enum FileType {
  pdf(1, "pdf", AppAssets.pdf),
  docx(2, "docx", AppAssets.docs),
  txt(3, "txt", AppAssets.txt);

  final int id;
  final String label;
  final String icon;

  const FileType(this.id, this.label, this.icon);
}