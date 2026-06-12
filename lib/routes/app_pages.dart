import '../constants/app_imports.dart';
import '../modules/home/bindings/home_bindings.dart';
import '../modules/home/views/home_view.dart';
import '../modules/login/bindings/login_bindings.dart';
import '../modules/login/views/login_view.dart';
import '../modules/login/views/splash_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static final INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(name: _Paths.SPLASH, page: () => SplashView(), binding: LoginBindings()),
    GetPage(name: _Paths.LOGIN, page: () => LoginView(), binding: LoginBindings()),
    GetPage(name: _Paths.HOME, page: () => HomeView(), binding: HomeBindings()),

  ];
}
