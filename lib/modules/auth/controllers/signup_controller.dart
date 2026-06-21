import '../../../constants/app_imports.dart';

class SignupController extends GetxController {
  final _api = AuthRepository();

  // ================= Text Controllers =================
  final nameTEC = TextEditingController();
  final emailTEC = TextEditingController();
  final passwordTEC = TextEditingController();
  final conPassTEC = TextEditingController();

  // ================= Error Flags =================
  RxBool nameError = false.obs;
  RxBool emailError = false.obs;
  RxBool passwordError = false.obs;
  RxBool confirmPassError = false.obs;

  // ================= Validation =================
  bool validateFields() {
    bool isValid = true;

    // reset errors
    nameError.value = false;
    emailError.value = false;
    passwordError.value = false;
    confirmPassError.value = false;

    // ========== NAME ==========
    if (nameTEC.text.trim().isEmpty) {
      nameError.value = true;
      Utils.toastMessage("Full name is required");
      return false;
    }

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

    // ========== CONFIRM PASSWORD ==========
    if (conPassTEC.text.isEmpty) {
      confirmPassError.value = true;
      Utils.toastMessage("Confirm password is required");
      return false;
    }

    if (passwordTEC.text != conPassTEC.text) {
      confirmPassError.value = true;
      Utils.toastMessage("Passwords do not match");
      return false;
    }

    return isValid;
  }
  // ================= Signup =================
  Future<void> signup() async {
    if (!validateFields()) {
      return;
    }

    Utils.showDottedLoader();

    try {
      final response = await _api.signupApi(body: {
        'name': nameTEC.text.trim(),
        "email": emailTEC.text.trim(),
        "password": passwordTEC.text,
      });

      if (response) {
        Utils.toastMessage("Account Created Successfully!");
        Get.offAllNamed(Routes.LOGIN);
      }


    } catch (e) {
      print("Signup Exception: $e");
    } finally {
      Utils.hideLoader();
    }
  }

  @override
  void onClose() {
    nameTEC.dispose();
    emailTEC.dispose();
    passwordTEC.dispose();
    conPassTEC.dispose();
    super.onClose();
  }
}