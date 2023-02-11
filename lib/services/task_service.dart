import 'package:blog/models/task.dart';
import 'package:blog/services/storage_service.dart';
import 'package:dio/dio.dart';

import '../utils/constants.dart';

class TaskService {
  static Future<List<Task>> getAll() async {
    var token = StorageService.getToken();
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
}
