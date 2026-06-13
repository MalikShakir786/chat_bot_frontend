import 'package:chat_bot_frontend/global/widgets/reuse_text.dart';

import '../../../constants/app_imports.dart';
import '../controllers/login_controller.dart';

class LoginView extends StatelessWidget {
  LoginView({super.key});

  final loginCon = Get.find<LoginController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Positioned.fill(
            child: Image.asset(AppAssets.loginBg, fit: BoxFit.cover),
          ),
          Padding(
            padding: EdgeInsets.only(top: 130.h),
            child: Column(
              children: [
                Image.asset(AppAssets.appLogo, width: 90.w),
                SizedBox(height: 10.h),
                ReuseText(
                  title: 'InnovaChat',
                  color: AppColors.primary,
                  size: 24.sp,
                  weight: FontWeight.w700,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
