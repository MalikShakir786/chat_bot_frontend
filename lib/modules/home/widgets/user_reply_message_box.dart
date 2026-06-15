import '../../../../constants/app_imports.dart';

class UserReplyMessageBox extends StatelessWidget {
  final String text;
  final String time;
  final String? replyText;
  final VoidCallback? onReplyTap;

  const UserReplyMessageBox({
    super.key,
    required this.text,
    required this.time,
    this.replyText,
    this.onReplyTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            constraints: BoxConstraints(
              maxWidth: Get.width / 1.5,
            ),
            margin: EdgeInsets.symmetric(vertical: 3.h, horizontal: 12.w),
            padding: EdgeInsets.all(12.sp),
            decoration: BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12.r),
                topRight: Radius.circular(12.r),
                bottomLeft: Radius.circular(12.r),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ReuseText(
                  title: text,
                  color: Colors.white,
                  size: 12.sp,
                  weight: FontWeight.w500,
                ),
                SizedBox(height: 5.h,),
                Align(
                  alignment: Alignment.centerRight,
                  child: ReuseText(
                    title: time,
                    color: Colors.white70,
                    size: 10.sp,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
