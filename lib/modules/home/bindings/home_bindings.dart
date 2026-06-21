import 'package:chat_bot_frontend/modules/home/controllers/chat_controller.dart';

import '../../../constants/app_imports.dart';
import '../controllers/home_controller.dart';

class HomeBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<ChatController>(() => ChatController());
  }
}
