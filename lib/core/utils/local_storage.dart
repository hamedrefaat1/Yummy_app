import 'dart:core';

import 'package:shared_preferences/shared_preferences.dart';

class PrefStorage {
  static const String _tokenKey = "auth_Token";

  static Future<void> setToken(String token) async {
    final pref = await SharedPreferences.getInstance();
    await pref.setString(_tokenKey, token);
  }

  static Future<String?> getToken() async {
    final pref = await SharedPreferences.getInstance();
    return pref.getString(_tokenKey);
  }

  static Future<void> removeToken() async {
    final pref = await SharedPreferences.getInstance();
    await pref.remove(_tokenKey);
  }
}
