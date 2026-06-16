import 'package:chat_bot_frontend/models/document_model.dart';

import '../../../constants/app_imports.dart';

class HomeController extends GetxController {
  final _api = HomeRepository();

  // ================= Variables ================
  var loadingDocs = false.obs;
  var documents = <DocumentModel>[].obs;

  // ================ Methods ===================
  Future<void> fetchAllDocuments() async{
    try{
      loadingDocs(true);
      var response = await _api.getAllDocumentsApi();
      if(response.isNotEmpty){
        documents.value = response;
      } else {
        documents.clear();
      }
    } catch (e){
      print(e);
    } finally {
      loadingDocs(false);
    }
  }

}
