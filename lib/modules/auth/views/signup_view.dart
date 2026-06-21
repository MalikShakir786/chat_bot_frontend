import 'package:chat_bot_frontend/modules/auth/controllers/signup_controller.dart';

import '../../../constants/app_imports.dart';
import '../controllers/login_controller.dart';

class SignupView extends StatelessWidget {
  SignupView({super.key});

  final signupCon = Get.find<SignupController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Stack(
        fit: StackFit.expand,
        children: [
          Positioned.fill(
            child: Image.asset(AppAssets.loginBg, fit: BoxFit.cover),
          ),

          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(top: 80.h, left: 16.w, right: 16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
            
                  /// Logo
                  Center(
                    child: Column(
                      children: [
                        Image.asset(
                          AppAssets.appLogo,
                          width: 90.w,
                        ),
                        SizedBox(height: 7.h),
                        ReuseText(
                          title: 'InnovaChat',
                          color: AppColors.primary,
                          size: 24.sp,
                          weight: FontWeight.w700,
                        ),
                        ReuseText(
                          title: 'Create your new account',
                          color: AppColors.textSecondary,
                          size: 12.sp,
                          weight: FontWeight.w500,
                        ),
                      ],
                    ),
                  ),
            
                  SizedBox(height: 30.h),
            
                  ReuseText(
                    title: 'Create Account',
                    color: AppColors.textPrimary,
                    weight: FontWeight.w600,
                    size: 18.sp,
                  ),
            
                  SizedBox(height: 5.h),
            
                  ReuseText(
                    title: 'Sign up to get started',
                    color: AppColors.textSecondary,
                    weight: FontWeight.w500,
                    size: 12.sp,
                  ),
            
                  SizedBox(height: 20.h),
            
                  /// Full Name
                  Obx(() {
                    return CustomTextField(
                      prefixIcon: AppAssets.user,
                      borderColor: Colors.grey,
                      hint: "Full Name",
                      controller: signupCon.nameTEC,
                      isError: signupCon.nameError.value,
                    );
                  }),
            
                  SizedBox(height: 15.h),
            
                  /// Email
                  Obx(() {
                    return CustomTextField(
                      prefixIcon: AppAssets.email,
                      borderColor: Colors.grey,
                      hint: "Email address",
                      controller: signupCon.emailTEC,
                      isError: signupCon.emailError.value,
                    );
                  }),
            
                  SizedBox(height: 15.h),
            
                  /// Password
                  Obx(() {
                    return CustomTextField(
                      prefixIcon: AppAssets.lock,
                      borderColor: Colors.grey,
                      hint: "Password",
                      suffixIcon: AppAssets.eyeShow,
                      isPassword: true,
                      controller: signupCon.passwordTEC,
                      isError: signupCon.passwordError.value,
                    );
                  }),
            
                  SizedBox(height: 15.h),
            
                  /// Confirm Password
                  Obx(() {
                    return CustomTextField(
                      prefixIcon: AppAssets.lock,
                      borderColor: Colors.grey,
                      hint: "Confirm Password",
                      suffixIcon: AppAssets.eyeShow,
                      isPassword: true,
                      controller: signupCon.conPassTEC,
                      isError: signupCon.confirmPassError.value,
                    );
                  }),
            
                  SizedBox(height: 25.h),
            
                  CustomAppButton(
                    text: 'Sign Up',
                    onTap: () async {
                      signupCon.signup();
                    },
                  ),
            
                  SizedBox(height: 35.h),
            
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Center(
                        child: Container(
                          width: (Get.width - 100).w,
                          height: 1.h,
                          color: AppColors.grey.withAlpha(80),
                        ),
                      ),
                      Center(
                        child: Container(
                          color: Colors.white,
                          width: 120.w,
                          child: Center(
                            child: ReuseText(
                              title: 'or continue with',
                              color: AppColors.grey,
                              size: 11.sp,
                              weight: FontWeight.w600,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
            
                  SizedBox(height: 25.h),
            
                  /// Social Buttons
                  Row(
                    children: [
                      Expanded(
                        child: CustomAppButton(
                          height: 45,
                          backgroundColor: AppColors.primary,
                          icon: Image.asset(
                            AppAssets.google,
                            height: 23.h,
                          ),
                          text: 'Google',
                          textSize: 13,
                          isGradient: false,
                        ),
                      ),
                      SizedBox(width: 10.w),
                      Expanded(
                        child: CustomAppButton(
                          height: 45,
                          backgroundColor: AppColors.primary,
                          icon: Image.asset(
                            AppAssets.microsoft,
                            height: 22.h,
                          ),
                          text: 'Microsoft',
                          textSize: 13,
                          isGradient: false,
                        ),
                      ),
                    ],
                  ),
            
                  SizedBox(height: 25.h),
            
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ReuseText(
                        title: "Already have an account?  ",
                        size: 12.sp,
                        color: AppColors.textSecondary,
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.offAllNamed(Routes.LOGIN);
                        },
                        child: ReuseText(
                          title: "Login",
                          size: 12.sp,
                          weight: FontWeight.w700,
                          color: AppColors.primary,
                          decoration: TextDecoration.underline,
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}