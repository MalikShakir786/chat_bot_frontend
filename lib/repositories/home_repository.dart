import 'package:chat_bot_frontend/models/document_model.dart';
import '../constants/app_imports.dart';

List<DocumentModel> parseDocumentModelList(List<dynamic> json) {
  return json.map((j)=> DocumentModel.fromJson(j)).toList();
}

DocumentModel parseDocumentModel(Map<String, dynamic> json) {
  return DocumentModel.fromJson(json);
}

class HomeRepository {
  final _apiService = NetworkManager();

  // Get All Documents
  Future<List<DocumentModel>> getAllDocumentsApi({var params}) async {
    try {
      final response = await _apiService.callApi(
        urlEndPoint: AppUrls.documentGetAll,
        queryParameters: params,
        method: HttpMethod.Get,
        withoutLoader: true,
      );

      if (response != null &&
          response.statusCode == 200 &&
          response.data != null) {
        return await compute<List<dynamic>, List<DocumentModel>>(parseDocumentModelList, response.data['data']);
      }

      Utils.toastMessage(response?.data['error_code']);
    } catch (e, stk) {
      print(stk);
      print("Error in api: $e");
      Utils.toastMessage(AppStrings.errorApiOccurred);
    }
    return [];
  }

  // Upload File Api
  Future<DocumentModel?> uploadFileApi({FormData? params}) async {
    try {
      final response = await _apiService.callApi(
        urlEndPoint: AppUrls.documentUpload,
        method: HttpMethod.Post,
        isFormDataRequest: true,
        formData: params,
        withoutLoader: false,
      );

      if (response != null &&
          response.statusCode == 200 &&
          response.data != null) {
        return await compute<Map<String, dynamic>, DocumentModel>(
          parseDocumentModel,
          response.data['data'],
        );
      }

      Utils.toastMessage(response?.data['error_code']);
    } catch (e, stk) {
      print(stk);
      print("Error in api: $e");
      Utils.toastMessage(AppStrings.errorApiOccurred);
    }

    return null;
  }

  // Delete File Api
  Future<bool> deleteFileApi({var params}) async {
    try {
      final response = await _apiService.callApi(
        urlEndPoint: AppUrls.documentDelete,
        method: HttpMethod.Delete,
        queryParameters: params,
        withoutLoader: false,
      );

      if (response != null &&
          response.statusCode == 200 &&
          response.data != null) {
        return true;
      }

      Utils.toastMessage(response?.data['error_code']);
    } catch (e, stk) {
      print(stk);
      print("Error in api: $e");
      Utils.toastMessage(AppStrings.errorApiOccurred);
    }

    return false;
  }
}
