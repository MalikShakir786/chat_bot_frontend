import '../../../constants/app_imports.dart';
import '../controllers/login_controller.dart';

class LoginView extends StatelessWidget {
  LoginView({super.key});

  final loginCon = Get.find<LoginController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(color: Colors.red,),
      ),
    );
  }
}
