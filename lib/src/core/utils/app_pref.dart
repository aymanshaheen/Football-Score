import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

const String keylang = "keylang";
const String prefsKey = "prefsKey";
const String prefsLoggedIn = "prefsLoggedIn";

class AppPreferences {
  final SharedPreferences _sharedPreferences;

  AppPreferences(this._sharedPreferences);


  Future<bool> saveData({
    required String key,
    required dynamic value,
  }) async {
    if (value is String) return await _sharedPreferences.setString(key, value);
    if (value is int) return await _sharedPreferences.setInt(key, value);
    if (value is bool) return await _sharedPreferences.setBool(key, value);
    if (value is double) return await _sharedPreferences.setDouble(key, value);

    return await _sharedPreferences.setString(key, jsonEncode(value));
  }

  dynamic getData({
    required String key,
  }) {
    final value = _sharedPreferences.get(key);
    if (value is String) {
      try {
        return jsonDecode(value);
      } catch (_) {
        return value;
      }
    }
    return null;
  }

  Future<bool> removeData({
    required String key,
  }) async {
    return await _sharedPreferences.remove(key);
  }

  Future<void> clearAllData() async {
    await _sharedPreferences.clear();
  }
}