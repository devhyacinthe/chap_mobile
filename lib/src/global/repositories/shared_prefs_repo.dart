import 'dart:convert';
import 'dart:developer';

import 'package:chap_mobile/src/core/core.dart';
import 'package:chap_mobile/src/models/user.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sharedPrefsRepositoryProvider =
    Provider<SharedPrefsRepository>((ref) => SharedPrefsRepository());

class SharedPrefsRepository {
  final String _tokenKey = "COOKIE_TOKEN";
  final String _currentUserKey = "CURRENT_USER";
  final _name = "SHARED_PREFS_REPO";

  Future<String?> getCookie() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final token = prefs.getString(_tokenKey);

    log("Reading token", name: _name);
    log("Data : $token", name: _name);
    return token;
  }

  Future<User?> getCurrentUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final data = prefs.getString(_currentUserKey);

    log("Reading user", name: _name);
    log("Data : $data", name: _name);

    final user = data != null ? User.fromJson(jsonDecode(data)) : null;
    return user;
  }

  FutureVoid setCurrentUser(User user) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    log("Saving user", name: _name);
    log("Data : ${user.toJson()}", name: _name);

    prefs.setString(_currentUserKey, jsonEncode(user.toJson()));
  }

  FutureVoid setToken(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    log("Saving token", name: _name);
    log("Data : $token", name: _name);

    prefs.setString(_tokenKey, token);
  }

  FutureVoid clear() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }
}
