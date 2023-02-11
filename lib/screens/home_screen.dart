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
              TaskService.finishTask("9df032c5-6b18-4499-9a1f-1e16e4350048");
            },
            child: Text("Click"),
          ),
        ),
      ),
    );
  }
}
