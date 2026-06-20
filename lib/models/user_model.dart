class UserModel {
  final int id;
  final String? accessToken;
  final String? refreshToken;

  UserModel({
    required this.id,
    required this.accessToken,
   required this.refreshToken,
  });

  // Convert JSON → User
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
     accessToken: json['access_token'],
      refreshToken: json['refresh_token']
    );
  }

  // Convert User → JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
     'access_token': accessToken,
      'refresh_token': refreshToken
    };
  }
}