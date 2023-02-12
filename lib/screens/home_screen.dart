import 'package:blog/models/new_task.dart';
import 'package:blog/services/task_service.dart';
import 'package:flutter/material.dart';

import '../utils/constants.dart';

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
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.5,
        title: Text(
          "ToDo",
          style: StyleConstants.appBarTitle,
        ),
        centerTitle: true,
      ),
      body: Container(
        color: Colors.white,
      ),
    );
  }
}
