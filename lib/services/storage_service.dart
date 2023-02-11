import 'package:blog/models/commons/user_profile.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StorageService {
  static late SharedPreferences _pref;

  static void _init() async {
    _pref = await SharedPreferences.getInstance();
  }

  static saveUserInfos(UserProfile profileInfos) async {
    _init();
    await _pref.setString("userId", profileInfos.userId);
    await _pref.setString("username", profileInfos.username);
    await _pref.setString("token", profileInfos.token);
  }

  static String getId() {
    _init();
    String? id = _pref.getString("userId");
    return id ?? "";
  }

  static String getUsername() {
    _init();
    String? username = _pref.getString("username");
    return username ?? "";
  }

  static String getToken() {
    _init();
    String? token = _pref.getString("token");
    return token ?? "";
  }
}