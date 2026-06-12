
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  static const FlutterSecureStorage _storage = FlutterSecureStorage();

  static const String accessTokenKey = "token";
  static const String refreshTokenKey = "refresh";
  static const String fullName = "fullName";

  static const String userIdKey = "user_id";
  static const String fullNameKey = "full_name";
  static const String phoneKey = "phone";

  static Future<void> saveAccessToken(String token) async {
    await _storage.write(key: accessTokenKey, value: token);
  }

  static Future<void> saveRefreshToken(String refreshToken) async {
    await _storage.write(key: refreshTokenKey, value: refreshToken);
  }

  static Future<String?> getAccessToken() async {
    return await _storage.read(key: accessTokenKey);
  }

  static Future<String?> getRefreshToken() async {
    return await _storage.read(key: refreshTokenKey);
  }

  static Future<void> clearAll() async {
    await _storage.deleteAll();
  }

  static Future<void> saveFullName(String name) async {
    return await _storage.write(key: fullName, value: name);
  }

  static Future<String?> getFullName() async {
    return await _storage.read(key: fullName);
  }

  static Future<String?> getUserId() async {
    return await _storage.read(key: userIdKey);
  }

  static Future<String?> getPhone() async {
    return await _storage.read(key: phoneKey);
  }

  static Future<void> saveUser({required int id, required String fullName, required String phone}) async {
    await _storage.write(key: userIdKey, value: id.toString());
    await _storage.write(key: fullNameKey, value: fullName);
    await _storage.write(key: phoneKey, value: phone);
  }
}