import '../../../constants/app_imports.dart';

class DocumentBox extends StatelessWidget {
  const DocumentBox({
    super.key,
    required this.title,
    required this.fileSize,
    required this.uploadedTime,
    required this.fileType,
  });

  final String title;
  final double fileSize;
  final DateTime? uploadedTime;
  final FileType fileType;

  @override
  Widget build(BuildContext context) {
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
          Image.asset(fileType.icon, height: 35.h),
          SizedBox(width: 10.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ReuseText(
                  title: title,
                  size: 14.sp,
                  weight: FontWeight.w500,
                  maxLines: 2,
                ),
                SizedBox(height: 3.h),
                ReuseText(
                  title: '$fileSize MB · Uploaded ${uploadedTime?.timeAgoOrDate ?? ''}',
                  size: 11.sp,
                  weight: FontWeight.w500,
                  color: AppColors.textSecondary,
                ),
              ],
            ),
          ),
          SizedBox(width: 10.w),
          Icon(Icons.more_vert, color: Colors.black),
        ],
      ),
    );
  }
}
