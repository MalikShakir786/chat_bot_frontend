import '../../constants/app_imports.dart';

class CustomIconButton extends StatelessWidget {
  final String iconPath;
  final VoidCallback? onTap;
  final double size;
  final bool showBadge;
  final bool isBackground;
  final bool isGradient;
  final EdgeInsets? padding;
  final Color? iconColor;
  final Color? bgColor;

  const CustomIconButton({
    super.key,
    required this.iconPath,
    this.onTap,
    this.size = 20.0,
    this.showBadge = false,
    this.isBackground = true,
    this.isGradient = false,
    this.padding,
    this.iconColor,
    this.bgColor,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Ink(
          padding: padding ?? EdgeInsets.all(10.sp),
          decoration: BoxDecoration(
            color: isBackground ? bgColor ?? Colors.grey.shade200 :  Colors.transparent,
            shape: BoxShape.circle,
            gradient: isGradient
                ? AppColors.primaryGradient
                : null,
          ),
          child: Image.asset(iconPath, height: size.h, width: size.h, color: isGradient? Colors.white: iconColor,),
        ).withInkTap(onTap: onTap, borderRadius: size.r),
        if (showBadge)
          Positioned(
            right: 2.w,
            child: CircleAvatar(radius: 5.r, backgroundColor: Colors.red),
          ),
      ],
    );
  }
}
