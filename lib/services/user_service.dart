import 'dart:convert';
import 'dart:io';

import 'package:blog/models/auth_models.dart';
import 'package:blog/models/commons/user_profile.dart';
import 'package:blog/models/user_request.dart';
import 'package:blog/services/storage_service.dart';
import 'package:blog/utils/constants.dart';
import 'package:dio/dio.dart';

class UserService {
  static register(RegisterRequest payload) async {
    var res = await Dio().post('${Constants.baseUrl}users', data: {
      'email': payload.email,
      'username': payload.username,
      'password': payload.password
    });
    return res;
  }

  static Future<LoginResponse> signin(LoginRequest request) async {
    var res = await Dio().post(
      '${Constants.baseUrl}authentication',
      data: request.toJson(),
    );
    LoginResponse response = LoginResponse.fromJson(res.data);
    StorageService.saveUserInfos(UserProfile(response.userId, response.username, response.accessToken));

    return response;
  }
}
