import 'package:blog/models/task.dart';
import 'package:blog/services/storage_service.dart';
import 'package:dio/dio.dart';

import '../utils/constants.dart';

class TaskService {
  static final String token = StorageService.getToken();

  static Future<List<Task>> getAll() async {
    List<Task> tasks = [];
    try {
      Response<List<dynamic>> res = await Dio().get('${Constants.baseUrl}todos',
          options: Options(
            headers: {
              'Authorization': 'Bearer $token',
            },
          ));
      res.data?.forEach((element) {
        tasks.add(Task.fromJson(element));
      });
    } catch (e) {
      print(e);
    }

    return tasks;
  }

  static Future<Task?> getById(String id) async {
    Task task;
    try {
      Response<dynamic> res = await Dio().get('${Constants.baseUrl}todos/$id',
          options: Options(
            headers: {
              'Authorization': 'Bearer $token',
            },
          ));
      task = Task.fromJson(res.data);
      return task;
    } on DioError catch (e) {
      print(e.response?.data);
    }
    return null;
  }
}
