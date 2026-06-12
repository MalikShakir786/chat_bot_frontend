import '../constants/app_imports.dart';
import '../models/user_model.dart';

// Isolate Functions
String _encodeUserProfile(UserModel user) {
  return json.encode(user.toJson());
}

class PrefManager {
  static final PrefManager _singleton = PrefManager._internal();
  static late final SharedPreferences _prefsInstance;


  static UserModel? userData;

  static bool isLoggedIn = false;

  factory PrefManager() {
    return _singleton;
  }

  PrefManager._internal();

  static Future<void> init() async {
    _prefsInstance = await SharedPreferences.getInstance();
    getUser();
  }

  static Future<void> initAndLoadLocals() async {
    await init();
    isLoggedIn = isLogin();
    if (isLoggedIn) {
      userData = getUser();
    }
  }

  static dynamic read(String key) {
    return json.decode(_prefsInstance.getString(key)!);
  }

  static String getToken() {
    return _prefsInstance.getString('Token') ?? '';
  }

  static void setToken(String value) {
    try {
      _prefsInstance.setString('Token', value);
    } catch (ex) {
      print(ex);
    }
  }

  static String getRefreshToken() {
    return _prefsInstance.getString('RefreshToken') ?? '';
  }

  static void setRefreshToken(String value) {
    try {
      _prefsInstance.setString('RefreshToken', value);
    } catch (ex) {
      print(ex);
    }
  }

  static String getEncryptedToken() {
    return _prefsInstance.getString('EncryptedToken') ?? '';
  }

  static void setEncryptedToken(String value) {
    try {
      _prefsInstance.setString('EncryptedToken', value);
    } catch (ex) {
      print(ex);
    }
  }

  static String getUserId() {
    return _prefsInstance.getString('userId') ?? '';
  }

  static void setUserId(String value) {
    try {
      _prefsInstance.setString('userId', value);
    } catch (ex) {
      print(ex);
    }
  }

  static Future<void> saveUser(UserModel userProfile) async {
    try {
      final encoded = await compute(_encodeUserProfile, userProfile);
      await _prefsInstance.setString('user', encoded);
      userData = getUser();
    } catch (e) {
      print('Failed to save user: $e');
    }
  }

  static UserModel? getUser() {
    final userJson = _prefsInstance.getString('user');
    if (userJson != null) {
      userData = UserModel.fromJson(
        json.decode(userJson) as Map<String, dynamic>,
      );
      return UserModel.fromJson(json.decode(userJson) as Map<String, dynamic>);
    }
    return null;
  }

  static void setIsLogin(bool value) {
    try {
      _prefsInstance.setBool('isLogin', value);
    } catch (ex) {
      print(ex);
    }
  }

  static bool isLogin() {
    return _prefsInstance.getBool('isLogin') ?? false;
  }

  static void save(String key, dynamic value) {
    try {
      _prefsInstance.setString(key, json.encode(value));
    } catch (ex) {
      print(ex);
    }
  }

  static void remove(String key) {
    _prefsInstance.remove(key);
  }

  static void clearAll() {
    _prefsInstance.clear();
    userData = null;
  }
}