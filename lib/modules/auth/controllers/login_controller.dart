import '../../../constants/app_imports.dart';

class LoginController extends GetxController {
  final _api = AuthRepository();

  // ================= Variables ========================
  final emailTEC = TextEditingController();
  final passwordTEC = TextEditingController();

  final emailError = false.obs;
  final passwordError = false.obs;
  // ====================== Methods ==========================

  bool validateFields() {
    bool isValid = true;

    emailError.value = false;
    passwordError.value = false;

    // ========== EMAIL ==========
    if (emailTEC.text.trim().isEmpty) {
      emailError.value = true;
      Utils.toastMessage("Email is required");
      return false;
    }

    if (!GetUtils.isEmail(emailTEC.text.trim())) {
      emailError.value = true;
      Utils.toastMessage("Enter a valid email address");
      return false;
    }

    // ========== PASSWORD ==========
    if (passwordTEC.text.isEmpty) {
      passwordError.value = true;
      Utils.toastMessage("Password is required");
      return false;
    }

    if (passwordTEC.text.length < 6) {
      passwordError.value = true;
      Utils.toastMessage("Password must be at least 6 characters");
      return false;
    }

    return isValid;
  }


  Future<void> login() async {

    if(!validateFields()) return;

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

      Utils.toastMessage('Login Successfully!');
      PrefManager.saveUser(loginResponse);
      PrefManager.setUserId(loginResponse.id.toString());
      Get.offAllNamed(Routes.HOME);

    } catch (e) {
      print("Login Exception: $e");
    } finally {
      Utils.hideLoader();
    }
  }

}
