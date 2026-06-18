import 'package:chat_bot_frontend/models/document_model.dart';
import 'package:chat_bot_frontend/modules/home/controllers/home_controller.dart';

import '../../../constants/app_imports.dart';

class DocumentBox extends StatelessWidget {
  DocumentBox({
    super.key,
    required this.document
  });

  final DocumentModel document;

  final homeCon = Get.find<HomeController>();

  final GlobalKey menuKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    var type = FileType.fromExtension(document.fileType ?? 'pdf') ??
        FileType.pdf;
    return Container(
      padding: EdgeInsets.all(15.sp),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.r),
        color: Colors.white,
        boxShadow: [
          BoxShadow(blurRadius: 10, color: Colors.black12, spreadRadius: 1),
        ],
      ),
      child: Row(
        children: [
          Image.asset(type.icon, height: 35.h),
          SizedBox(width: 10.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ReuseText(
                  title: document.filename ?? '',
                  size: 14.sp,
                  weight: FontWeight.w500,
                  maxLines: 2,
                ),
                SizedBox(height: 3.h),
                ReuseText(
                  title: '${document.fileSize} · Uploaded ${document.uploadedAt?.timeAgoOrDate ?? ''}',
                  size: 11.sp,
                  weight: FontWeight.w500,
                  color: AppColors.textSecondary,
                ),
              ],
            ),
          ),
          SizedBox(width: 10.w),
          GestureDetector(
            key: menuKey,
            onTap: () {
              AppAnchoredMenu.show(
                context: context,
                key: menuKey,
                items: [
                  MenuItemData(
                    title: "Delete",
                    icon: Icons.delete,
                    color: Colors.red,
                    onTap: () {
                      homeCon.deleteDocument(document.id ?? 0);
                    },
                  ),
                ],
              );
            },
            child: Icon(Icons.more_vert, color: Colors.black,size: 25,),
          ),
        ],
      ),
    );
  }
}
