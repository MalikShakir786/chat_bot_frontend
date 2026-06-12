import 'package:chat_bot_frontend/models/user_model.dart';
import '../constants/app_imports.dart';

class HomeRepository {
  final _apiService = NetworkManager();

  // Get Token
  Future<UserModel?> loginApi(var data) async {
    try {
      final response = await _apiService.callApi(
        urlEndPoint: AppUrls.login,
        body: data,
        method: HttpMethod.Post,
        withoutLoader: true,
      );

      if (response != null &&
          response.statusCode == 200 &&
          response.data != null) {
        return await compute<Map<String, dynamic>, UserModel>(parseUserModel, response.data['result']);
      }

      Utils.toastMessage(response?.data['error']['message']);
    } catch (e) {
      print("Error in api: $e");
      Utils.toastMessage(AppStrings.errorApiOccurred);
    }
    return null;
  }
}
