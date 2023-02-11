import 'package:blog/models/new_task.dart';
import 'package:blog/services/task_service.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "/home";

  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Center(
          child: TextButton(
            onPressed: () {
              TaskService.create(NewTask(
                  "Learn Flutter",
                  "Flutter is the best mobile framework",
                  "high",
                  "2023-06-06 00:00:00"));
            },
            child: Text("Click"),
          ),
        ),
      ),
    );
  }
}
