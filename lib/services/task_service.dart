import 'package:blog/models/new_task.dart';
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

  static Future<bool> create(NewTask task) async {
    bool created = false;

    try {
      dynamic res = await Dio().post('${Constants.baseUrl}todos',
          data: task.toJson(),
          options: Options(headers: {'Authorization': 'Bearer $token'}));
      created = true;
    } on DioError catch (e) {
      print(e);
    }

    return created;
  }

  static Future<bool> beginTask(String id) async {
    bool updated = false;

    try {
      dynamic res = await Dio().patch('${Constants.baseUrl}todos/$id',
          data: {"begined_at": DateTime.now().toString()},
          options: Options(headers: {'Authorization': 'Bearer $token'}));

      updated = true;
    } on DioError catch (e) {
      print(e);
    }

    return updated;
  }

  static Future<bool> finishTask(String id) async {
    bool updated = false;

    try {
      dynamic res = await Dio().patch('${Constants.baseUrl}todos/$id',
          data: {"finished_at": DateTime.now().toString()},
          options: Options(headers: {'Authorization': 'Bearer $token'}));

      updated = true;
    } on DioError catch (e) {
      print(e);
    }

    return updated;
  }

  static Future<List<dynamic>> findAllCompleted() async {
    List<Task> tasks = await getAll();
    List<Task> completed = [];

    completed = tasks.where((element) => element.finishedAt != null).toList();

    return completed;
  }

  static Future<List<dynamic>> findAllStarted() async {
    List<Task> tasks = await getAll();
    List<Task> started = [];

    started = tasks.where((element) => element.beginedAt != null).toList();

    return started;
  }

  static Future<List<dynamic>> findAllNotStarted() async {
    List<Task> tasks = await getAll();
    List<Task> notStarted = [];

    notStarted = tasks.where((element) => element.beginedAt == null).toList();

    return notStarted;
  }

  static Future<List<dynamic>> findLatelyFinished(String state) async {
    List<Task> tasks = await getAll();
    List<Task> late = [];

    late = tasks.where((element) {
      final DateTime deadline = DateTime.parse(element.deadlineAt);
      if (element.finishedAt != null) {
        final DateTime endDate = DateTime.parse(element.finishedAt ?? "");
        return endDate.isAfter(deadline);
      } else {
        return deadline.isBefore(DateTime.now());
      }
    }).toList();

    return late;
  }

  static Future<List<dynamic>> filterByPriority(String priority) async {
    List<Task> tasks = [];
    try {
      Response<List<dynamic>> res = await Dio().get(
          '${Constants.baseUrl}todos?priority=$priority',
          options: Options(headers: {'Authorization': 'Bearer $token'}));
      res.data?.forEach((element) {
        tasks.add(Task.fromJson(element));
      });
    } on DioError catch (e) {
      print(e);
    }
    return tasks;
  }
}
