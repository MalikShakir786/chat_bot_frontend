import '../../constants/app_imports.dart';

class CustomAppButton extends StatelessWidget {
  final String? text;
  final double textSize;
  final double height;
  final double width;
  final double borderRadius;
  final Color backgroundColor;
  final Color textColor;
  final Color? borderColor;
  final VoidCallback? onTap;
  final Widget? icon;
  final bool isDisabled;
  final bool isLoading;
  final bool isOutlined;
  final bool isGradient;

  const CustomAppButton({
    super.key,
    this.text,
    this.textSize = 15,
    this.height = 50,
    this.width = double.infinity,
    this.borderRadius = 10,
    this.backgroundColor = AppColors.primary,
    this.textColor = Colors.white,
    this.borderColor,
    this.onTap,
    this.icon,
    this.isDisabled = false,
    this.isLoading = false,
    this.isOutlined = false,
    this.isGradient = true,
  });

  @override
  Widget build(BuildContext context) {
    return Ink(
      height: height.h,
      width: width.w,
      padding: EdgeInsets.symmetric(horizontal: 14.w),
      decoration: BoxDecoration(
        color: isOutlined
            ? Colors.transparent
            : isDisabled
            ? backgroundColor.withAlpha(80)
            : backgroundColor,
        borderRadius: BorderRadius.circular(borderRadius.r),
        border: borderColor != null
            ? Border.all(width: 1, color: borderColor!)
            : isOutlined
            ? Border.all(
                color: isDisabled
                    ? backgroundColor.withAlpha(80)
                    : AppColors.grey,
                width: 1,
              )
            : null,
        gradient: isGradient? AppColors.primaryGradient: null
      ),
      child: isLoading
          ? Utils.apiLoader
          : Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                if (icon != null) ...[
                  icon!,
                  text != null ? SizedBox(width: 8.w) : SizedBox.shrink(),
                ],
                ReuseText(
                  title: text ?? '',
                  color: isOutlined
                      ? AppColors.grey
                      : isDisabled
                      ? Colors.black12
                      : textColor,
                  size: textSize.sp,
                  weight: FontWeight.w600,
                ),
              ],
            ),
    ).withInkTap(onTap: isDisabled ? null : onTap, borderRadius: borderRadius);
  }
}
