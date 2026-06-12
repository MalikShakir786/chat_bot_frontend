class UserModel {
  final int? id;
  final String email;
  final String password;
  final String? name;
  final String? token;

  UserModel({
    this.id,
    required this.email,
    required this.password,
    this.name,
    this.token,
  });

  // Convert JSON → User
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      email: json['email'],
      password: json['password'],
      name: json['name'],
      token: json['token'],
    );
  }

  // Convert User → JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'password': password,
      'name': name,
      'token': token,
    };
  }

  // CopyWith (useful for updates)
  UserModel copyWith({
    int? id,
    String? email,
    String? password,
    String? name,
    String? token,
  }) {
    return UserModel(
      id: id ?? this.id,
      email: email ?? this.email,
      password: password ?? this.password,
      name: name ?? this.name,
      token: token ?? this.token,
    );
  }
}