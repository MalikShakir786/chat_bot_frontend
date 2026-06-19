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
            padding: EdgeInsets.only(top: 80.h, left: 16.w, right: 16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Column(
                    children: [
                      Hero(
                          tag: 'logo',
                          child: Image.asset(AppAssets.appLogo, width: 90.w)),
                      SizedBox(height: 7.h),
                      ReuseText(
                        title: 'InnovaChat',
                        color: AppColors.primary,
                        size: 24.sp,
                        weight: FontWeight.w700,
                      ),
                      ReuseText(
                        title: 'Your Intelligent Al Assistant',
                        color: AppColors.textSecondary,
                        size: 12.sp,
                        weight: FontWeight.w500,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 30.h,),
                ReuseText(title: 'Welcome Back!',
                color: AppColors.textPrimary,
                  weight: FontWeight.w600,
                  size: 18.sp,
                ),
                SizedBox(height: 5.h,),
                ReuseText(title: 'Login to continue to your account',
                color: AppColors.textSecondary,
                  weight: FontWeight.w500,
                  size: 12.sp,
                ),
                SizedBox(height: 20.h,),
                CustomTextField(
                  prefixIcon: AppAssets.email,
                  borderColor: Colors.grey,
                  hint: "Email address",
                ),
                SizedBox(height: 15.h,),
                CustomTextField(
                  prefixIcon: AppAssets.lock,
                  borderColor: Colors.grey,
                  hint: "Password",
                  suffixIcon: AppAssets.eyeShow,
                  isPassword: true,
                ),
                SizedBox(height: 25.h,),
                CustomAppButton(
                  text: 'Login',
                  onTap: () async{
                    Utils.showDottedLoader();
                    await Future.delayed(Duration(seconds: 3));
                    Utils.hideLoader();
                    Get.toNamed(Routes.HOME);
                  },
                ),
                SizedBox(height: 40.h,),
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Center(
                      child: Container(
                        width: (Get.width-100).w,
                        height: 1.h,
                        color: AppColors.grey.withAlpha(80),
                      ),
                    ),
                    Center(
                      child: Container(
                        color: Colors.white,
                          width: 120.w,
                          child: Center(
                            child: ReuseText(title: 'or continue with',
                            color: AppColors.grey,
                              size: 11.sp,
                              weight: FontWeight.w600,
                            ),
                          )),
                    )
                  ],
                ),
                SizedBox(height: 30.h,),
                Row(
                  children: [
                    Expanded(child: CustomAppButton(
                      height: 45,
                      icon: Image.asset(AppAssets.google, height: 23.h,),
                      text: 'Google',
                      textSize: 13,
                      isGradient: false,
                      isOutlined: true,
                    )),
                    SizedBox(width: 10.w,),
                    Expanded(child: CustomAppButton(
                      height: 45,
                      icon: Image.asset(AppAssets.microsoft, height: 22.h,),
                      text: 'Microsoft',
                      textSize: 13,
                      isGradient: false,
                      isOutlined: true,
                    )),
                  ],
                ),
                SizedBox(height: 30.h,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ReuseText(title: "Don't have an account?  ",
                    size: 12.sp,
                      color: AppColors.textSecondary,
                    ),
                    ReuseText(title: "Signup",
                      size: 12.sp,
                      weight: FontWeight.w700,
                      color: AppColors.primary,
                      decoration: TextDecoration.underline,
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
