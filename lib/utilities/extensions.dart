import '../constants/app_imports.dart';

extension InkTapExtension on Widget {
  Widget withInkTap({
    required VoidCallback? onTap,
    double borderRadius = 0,
    Color splashColor = Colors.black12,
    Color highlightColor = Colors.transparent,
    final int delay = 100,
  }) {
    return Material(
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(borderRadius.r),
      child: InkWell(
        onTap: onTap == null
            ? null
            : () {
          Future.delayed(Duration(milliseconds: delay), onTap);
        },
        borderRadius: BorderRadius.circular(borderRadius.r),
        splashColor: splashColor,
        highlightColor: highlightColor,
        child: this,
      ),
    );
  }
}