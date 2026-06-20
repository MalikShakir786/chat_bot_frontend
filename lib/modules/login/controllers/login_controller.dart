import '../../../constants/app_imports.dart';

class LoginController extends GetxController {
  final _api = LoginRepository();

  // ================= Variables ========================
  final emailTEC = TextEditingController();
  final passwordTEC = TextEditingController();

  var isLoggingIn = false.obs;

  // ====================== Methods ==========================

  Future<void> login() async {
    Utils.showDottedLoader();
    try {

      if(emailTEC.text.isEmpty || passwordTEC.text.isEmpty){
        Utils.toastMessage('Please fill all the fields');
        return;
      }

      final loginResponse = await _api.loginApi(body: {
        "email": emailTEC.text,
        "password": passwordTEC.text,
      });

      if (loginResponse == null) {
        Utils.hideLoader();
        return;
      }

      PrefManager.setUserId(loginResponse.id.toString());
      PrefManager.setEncryptedToken(loginResponse.accessToken ?? '');
      PrefManager.setRefreshToken(loginResponse.refreshToken ?? '');
      Get.offAllNamed(Routes.HOME);

    } catch (e) {
      print("Login Exception: $e");
    } finally {
      Utils.hideLoader();
    }
  }

  Future<void> signup() async {
    Utils.showDottedLoader();
    try {
      final response = await _api.signupApi({
        "userNameOrEmailAddress": emailTEC.text,
        "password": passwordTEC.text,
      });

      if (!response) {
        Utils.hideLoader();
        return;
      }

      Get.offAllNamed(Routes.LOGIN);

    } catch (e) {
      print("Login Exception: $e");
    } finally {
      Utils.hideLoader();
    }
  }

}
