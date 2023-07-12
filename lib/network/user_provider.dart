import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

import 'package:surat_meyurat/model/user_model.dart';
import 'package:surat_meyurat/network/login_service.dart';

class UserProvider with ChangeNotifier {
  User? _user;

  User? get user => _user;

  final String _userKey = 'user';

  bool get isLoggedIn => _user != null;

  void setUser(User user) {
    _user = user;
    notifyListeners();
  }

  Future<void> logout() async {
    _user = null;
    notifyListeners();

    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(_userKey);
    await prefs.setBool('isLoggedIn', false);
  }

  Future<void> fetchUser() async {
    final apiService = ApiService();
    final user = await apiService.getUser();
    _user = user;
    notifyListeners();

    if (user != null) {
      _user = user;
      notifyListeners();

      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString(_userKey, user.toJson());
      prefs.setBool('isLoggedIn', true);
    }
  }

  Future<void> restoreUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final userJson = prefs.getString('userData');

    if (userJson != null) {
      final user = User.fromJson(jsonDecode(userJson));
      _user = user;
    } else {
      await fetchUser();
    }
    notifyListeners();
  }

  Future<bool> checkLoggedInStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isLoggedIn = prefs.getBool('isLoggedIn') ?? false;
    if (isLoggedIn) {
      String userData = prefs.getString('userData') ?? '';
      if (userData.isNotEmpty) {
        User user = User.fromJson(jsonDecode(userData));
        _user = user;
      }
    }
    return isLoggedIn;
  }
}
