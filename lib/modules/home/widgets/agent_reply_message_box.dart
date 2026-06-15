import '../../../../constants/app_imports.dart';

class AgentReplyMessageBox extends StatelessWidget {
  final String text;
  final String time;
  final String? replyText;
  final VoidCallback? onReplyTap;

  const AgentReplyMessageBox({
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomIconButton(iconPath: AppAssets.appLogo, padding: EdgeInsets.all(9.sp),),
          Container(
            constraints: BoxConstraints(maxWidth: Get.width / 1.5 ),
            margin: EdgeInsets.symmetric(vertical: 3.h, horizontal: 12.w),
            padding: EdgeInsets.all(12.sp),
            decoration: BoxDecoration(
              color: AppColors.primary.withAlpha(30),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(15.r),
                topRight: Radius.circular(15.r),
                bottomRight: Radius.circular(15.r),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ReuseText(title: text, size: 12.sp),
                SizedBox(height: 5.h,),
                ReuseText(title: time, color: AppColors.textSecondary, size: 10.sp)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
