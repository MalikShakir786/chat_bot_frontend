import '../../../constants/app_imports.dart';

class LoginController extends GetxController {
  final _api = LoginRepository();

  // ================= Variables ========================
  final emailTEC = TextEditingController();
  final passwordTEC = TextEditingController();

  var isLoggingIn = false.obs;

  // ====================== Methods ==========================

  Future<void> login() async {
    Utils.showLoader();
    try {
      final loginResponse = await _api.loginApi({
        "userNameOrEmailAddress": emailTEC.text,
        "password": passwordTEC.text,
      });

      if (loginResponse == null) {
        Utils.hideLoader();
        return;
      }

      PrefManager.setUserId(loginResponse.id.toString());

    } catch (e) {
      print("Login Exception: $e");
    }
  }

}
