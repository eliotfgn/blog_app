import 'package:blog/models/commons/user_profile.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StorageService {
  static late SharedPreferences _pref;

  static void _init() async {
    _pref = await SharedPreferences.getInstance();
  }

  static saveUserInfos(UserProfile profileInfos) async {
    await _pref.setString("userId", profileInfos.userId);
    await _pref.setString("username", profileInfos.username);
    await _pref.setString("token", profileInfos.token);
    await _pref.setBool("isAuthenticated", true);
  }

  static String getId() {
    String? id = _pref.getString("userId");
    return id ?? "";
  }

  static String getUsername() {
    String? username = _pref.getString("username");
    return username ?? "";
  }

  static String getToken() {
    String? token = _pref.getString("token");
    return token ?? "";
  }

  static bool isAuthenticated() {
    bool? authenticated = _pref.getBool('isAuthenticated');

    return authenticated ?? false;
  }
}
