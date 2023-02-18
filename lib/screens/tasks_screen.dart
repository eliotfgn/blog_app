import 'package:blog/services/storage_service.dart';
import 'package:blog/services/task_service.dart';
import 'package:blog/utils/constants.dart';
import 'package:blog/widgets/category_pill.dart';
import 'package:blog/widgets/task_item.dart';
import 'package:flutter/material.dart';

import '../models/task.dart';
import '../widgets/bottom_navigation.dart';

class TasksScreen extends StatefulWidget {
  static const String routeName = '/tasks';

  const TasksScreen({Key? key}) : super(key: key);

  @override
  State<TasksScreen> createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  String current = "All";
  List<Task> tasks = [];

  init() async {
    List<Task> allTasks = await TaskService.getAll();
    setState(() {
      tasks = allTasks;
    });
  }

  @override
  void initState() {
    super.initState();
    init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.2,
        title: Text(
          "My tasks",
          style: StyleConstants.appBarTitle,
        ),
        centerTitle: true,
      ),
      bottomNavigationBar: const BottomNavigation(1),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            SizedBox(
              height: 45,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  CategoryPill(category: "All", isSelected: current == "All"),
                  CategoryPill(category: "High", isSelected: current == "High"),
                  CategoryPill(
                      category: "Medium", isSelected: current == "Medium"),
                  CategoryPill(category: "Low", isSelected: current == "Low"),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Column(
              children: tasks
                  .map((e) => TaskItem(
                      title: e.title,
                      description: e.description,
                      priority: e.priority))
                  .toList(),
            )
          ],
        ),
      ),
    );
  }
}
