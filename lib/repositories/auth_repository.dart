import 'dart:developer';

import 'package:chat_bot_frontend/models/user_model.dart';
import '../constants/app_imports.dart';

UserModel parseUserModel(Map<String, dynamic> json) {
  return UserModel.fromJson(json);
}

class AuthRepository {
  final _apiService = NetworkManager();

  // Get Token
  Future<UserModel?> loginApi({var body}) async {
    try {
      final response = await _apiService.callApi(
        urlEndPoint: AppUrls.login,
        body: body,
        method: HttpMethod.Post,
        withoutLoader: true,
      );

      if (response != null &&
          response.statusCode == 200 &&
          response.data != null) {
        return await compute<Map<String, dynamic>, UserModel>(parseUserModel, response.data['data']);
      }

      Utils.toastMessage(response?.data['detail']['message']);
    } catch (e, stk) {
      print(stk);
      print("Error in api: $e");
      Utils.toastMessage(AppStrings.errorApiOccurred);
    }
    return null;
  }

  // Sign Up Api
  Future<bool> signupApi({var body}) async {
    try {
      final response = await _apiService.callApi(
        urlEndPoint: AppUrls.signup,
        body: body,
        method: HttpMethod.Post,
        withoutLoader: true,
      );
      if (response != null &&
          response.statusCode == 200 &&
          response.data != null) {
        return true;
      }

      Utils.toastMessage(response?.data['detail']['message']);
    } catch (e, stk) {
      print(stk);
      print("Error in api: $e");
      Utils.toastMessage(AppStrings.errorApiOccurred);
    }
    return false;
  }
}
