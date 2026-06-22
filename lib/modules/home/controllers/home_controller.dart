import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:chat_bot_frontend/models/document_model.dart';
import 'package:chat_bot_frontend/models/chat_model.dart';
import 'package:intl/intl.dart';

import '../../../constants/app_imports.dart' hide FileType;

class HomeController extends GetxController {
  final _api = HomeRepository();

  // ================= Document Variables ================
  var loadingDocs = false.obs;
  var uploadingFile = false.obs;

  var documents = <DocumentModel>[].obs;

  File? selectedFile;
  var selectedFileName = ''.obs;

  // ================ Fetch Documents ===================
  Future<void> fetchAllDocuments() async {
    try {
      loadingDocs(true);

      var response = await _api.getAllDocumentsApi();

      if (response.isNotEmpty) {
        documents.value = response;
      } else {
        documents.clear();
      }
    } catch (e) {
      print(e);
    } finally {
      loadingDocs(false);
    }
  }

  // ================ Pick File ===================
  Future<void> pickFile() async {
    FilePickerResult? result = await FilePicker.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf', 'docx', 'doc', 'txt'],
    );

    if (result != null) {
      selectedFile = File(result.files.single.path!);
      selectedFileName.value = result.files.single.name;
    }
  }

  // ================ Upload File ===================
  Future<void> uploadFile() async {
    if (selectedFile == null) {
      Utils.toastMessage("Please select a file first");
      return;
    }

    try {
      uploadingFile(true);

      FormData formData = FormData.fromMap({
        "file": await MultipartFile.fromFile(
          selectedFile!.path,
          filename: selectedFileName.value,
        ),
      });

      var response = await _api.uploadFileApi(formData: formData);

      if (response != null) {
        documents.insert(0, response);

        selectedFile = null;
        selectedFileName.value = '';

        Utils.toastMessage("File uploaded successfully");
      }
    } catch (e) {
      print(e);
    } finally {
      uploadingFile(false);
    }
  }

  Future<void> deleteDocument(int id) async {
    try {
      var success = await _api.deleteFileApi(params: {'id': id});

      if (success) {
        documents.removeWhere((doc) => doc.id == id);
        Utils.toastMessage("Deleted successfully");
      }
    } catch (e) {
      print(e);
    }
  }
}