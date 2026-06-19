import '../../../constants/app_imports.dart';

class TypingLoaderBox extends StatefulWidget {
  const TypingLoaderBox({super.key});

  @override
  State<TypingLoaderBox> createState() => _TypingLoaderBoxState();
}

class _TypingLoaderBoxState extends State<TypingLoaderBox>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        margin: EdgeInsets.only(bottom: 12.h),
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
        decoration: BoxDecoration(
          color: AppColors.primary.withOpacity(0.08),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(4.r),
            topRight: Radius.circular(16.r),
            bottomLeft: Radius.circular(16.r),
            bottomRight: Radius.circular(16.r),
          ),
        ),
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, _) {
            return Row(
              mainAxisSize: MainAxisSize.min,
              children: List.generate(3, (index) {
                final delay = index * 0.2;
                final t = ((_controller.value - delay) % 1.0).clamp(0.0, 1.0);
                // bounce curve: up then down
                final bounce = (t < 0.5)
                    ? Curves.easeOut.transform(t / 0.5)
                    : 1 - Curves.easeIn.transform((t - 0.5) / 0.5);

                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 3.w),
                  child: Transform.translate(
                    offset: Offset(0, -4.h * bounce),
                    child: Container(
                      width: 7.w,
                      height: 7.w,
                      decoration: BoxDecoration(
                        color: AppColors.primary.withOpacity(0.5 + 0.5 * bounce),
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                );
              }),
            );
          },
        ),
      ),
    );
  }
}