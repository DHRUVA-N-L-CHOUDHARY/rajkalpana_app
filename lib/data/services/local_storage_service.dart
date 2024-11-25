import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../models/user_model.dart';
import 'local_storage_keys.dart';

class LocalStorageService {
  static late SharedPreferences _preferences;

  static Future<void> init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  static Future<void> saveData(String key, String value) async {
    await _preferences.setString(key, value);
  }

  static String? getData(String key) {
    return _preferences.getString(key);
  }

  static Future<void> clearData(String key) async {
    await _preferences.remove(key);
  }

  static Future<void> saveUser(UserModel user) async {
    final userJson = json.encode(user.toJson());
    await _preferences.setString(LocalStorageKeys.userId, userJson);
  }

  static UserModel? getUser() {
    final userJson = _preferences.getString(LocalStorageKeys.userId);
    if (userJson != null) {
      final userMap = Map<String, String>.from(json.decode(userJson));
      return UserModel.fromJson(userMap);
    }
    return null;
  }

  static Future<void> saveToken(String token) async {
    await _preferences.setString('token', token);
  }

  static String? getToken() {
    return _preferences.getString('token');
  }

  static Future<void> clearUser() async {
    await _preferences.remove(LocalStorageKeys.userId);
  }
}
