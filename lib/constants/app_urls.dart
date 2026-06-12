class AppUrls {

  static const baseUrl = 'http://localhost:5432';
  static const routeUrl = '/api/v1';

  // Auth
  static const login = '/auth/login';
  static const signup = '/auth/signup';

  // Documents
  static const documentUpload = '/documents/upload';
  static const documentGetAll = '/documents/getall';
  static const documentDelete = '/documents/delete';

  // Chat
  static const sendMessage = '/chat/send';
  static const chatHistory = '/chat/history';
}