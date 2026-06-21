import 'package:chat_bot_frontend/modules/auth/views/signup_view.dart';
import 'package:chat_bot_frontend/modules/home/views/main_navigation_view.dart';

import '../constants/app_imports.dart';
import '../modules/home/bindings/home_bindings.dart';
import '../modules/auth/bindings/auth_bindings.dart';
import '../modules/auth/views/login_view.dart';
import '../modules/auth/views/splash_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static final INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(name: _Paths.SPLASH, page: () => SplashView(), binding: LoginBindings(), transition: Transition.fade),
    GetPage(name: _Paths.LOGIN, page: () => LoginView(), binding: LoginBindings(),transition: Transition.fade, transitionDuration: Duration(milliseconds: 1000)),
    GetPage(name: _Paths.SIGNUP, page: () => SignupView(), binding: LoginBindings(),transition: Transition.fade, transitionDuration: Duration(milliseconds: 1000)),
    GetPage(name: _Paths.HOME, page: () => MainNavigationView(), binding: HomeBindings(), transition: Transition.fade, transitionDuration: Duration(milliseconds: 1000)),

  ];
}
