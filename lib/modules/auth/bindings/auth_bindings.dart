import 'package:chat_bot_frontend/modules/auth/controllers/signup_controller.dart';

import '../../../constants/app_imports.dart';
import '../controllers/login_controller.dart';

class LoginBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(() => LoginController());
    Get.lazyPut<SignupController>(() => SignupController());
  }
}
