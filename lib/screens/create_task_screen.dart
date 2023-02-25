import 'package:blog/models/new_task.dart';
import 'package:blog/screens/tasks_screen.dart';
import 'package:blog/services/task_service.dart';
import 'package:blog/widgets/bottom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/constants.dart';

class CreateTaskScreen extends StatefulWidget {
  static const String routeName = "/create-task";

  CreateTaskScreen({Key? key}) : super(key: key);

  @override
  State<CreateTaskScreen> createState() => _CreateTaskScreenState();
}

class _CreateTaskScreenState extends State<CreateTaskScreen> {
  late TextEditingController titleController;

  late TextEditingController descriptionController;

  late TextEditingController beginningController;

  late TextEditingController deadlineController;

  late Key _formKey;

  String priority = "";
  String deadline = "";

  updatePriority(String value) {
    setState(() {
      priority = value;
    });
  }

  init() {
    titleController = TextEditingController();
    descriptionController = TextEditingController();
    beginningController = TextEditingController();
    deadlineController = TextEditingController();

    _formKey = GlobalKey<FormState>();
  }

  @override
  Widget build(BuildContext context) {
    init();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.2,
        title: Text(
          "New task",
          style: StyleConstants.appBarTitle,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(
                  height: 30,
                ),
                TextFormField(
                  controller: titleController,
                  decoration: InputDecoration(
                      suffixIcon: const Icon(
                        Icons.edit,
                        color: Colors.green,
                      ),
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Colors.black,
                            width: 2,
                            style: BorderStyle.none),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.black),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      label: Container(
                        transform: Matrix4.translationValues(0, 0, 0),
                        child: Text(
                          "Title",
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                              fontFamily: GoogleFonts.inter().fontFamily,
                              letterSpacing: 1),
                        ),
                      ),
                      floatingLabelBehavior: FloatingLabelBehavior.always),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  minLines: 2,
                  maxLines: 3,
                  controller: descriptionController,
                  decoration: InputDecoration(
                      suffixIcon: const Icon(
                        Icons.edit,
                        color: Colors.green,
                      ),
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Colors.black,
                            width: 2,
                            style: BorderStyle.none),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.black),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      label: Container(
                        transform: Matrix4.translationValues(0, 0, 0),
                        child: Text(
                          "Description",
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                              fontFamily: GoogleFonts.inter().fontFamily,
                              letterSpacing: 1),
                        ),
                      ),
                      floatingLabelBehavior: FloatingLabelBehavior.always),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Expanded(
                      child: SizedBox(
                        child: TextFormField(
                          readOnly: true,
                          controller: beginningController,
                          onTap: () async {
                            DateTime? date = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(2000),
                                lastDate: DateTime(2050));
                            if (date != null) {
                              beginningController.text =
                                  "${date.year}-${date.month.toString().padLeft(2, "0")}-${date.day}";
                            }
                          },
                          style: const TextStyle(
                            fontSize: 14,
                          ),
                          decoration: InputDecoration(
                              suffixIcon: const Icon(
                                Icons.keyboard_arrow_down_rounded,
                              ),
                              border: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Colors.black,
                                    width: 2,
                                    style: BorderStyle.none),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Colors.black),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              label: Container(
                                transform: Matrix4.translationValues(0, 0, 0),
                                child: Text(
                                  "Beginning",
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600,
                                      fontFamily:
                                          GoogleFonts.inter().fontFamily,
                                      letterSpacing: 1),
                                ),
                              ),
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.always),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: SizedBox(
                        child: TextFormField(
                          style: const TextStyle(fontSize: 14),
                          readOnly: true,
                          controller: deadlineController,
                          onTap: () async {
                            DateTime? date = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(2000),
                                lastDate: DateTime(2050));
                            if (date != null) {
                              deadlineController.text =
                                  "${date.year}-${date.month.toString().padLeft(2, "0")}-${date.day}";
                              deadline = date.toString();
                            }
                          },
                          decoration: InputDecoration(
                              suffixIcon:
                                  const Icon(Icons.keyboard_arrow_down_rounded),
                              border: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Colors.black,
                                      width: 2,
                                      style: BorderStyle.none),
                                  borderRadius: BorderRadius.circular(10)),
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Colors.black),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              label: Container(
                                transform: Matrix4.translationValues(0, 0, 0),
                                child: Text(
                                  "Deadline",
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600,
                                      fontFamily:
                                          GoogleFonts.inter().fontFamily,
                                      letterSpacing: 1),
                                ),
                              ),
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.always),
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                PriorityChoice(
                  priority,
                  onChange: (value) {
                    priority = value;
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () async {
                    if (titleController.text.isNotEmpty &&
                        descriptionController.text.isNotEmpty &&
                        deadlineController.text.isNotEmpty) {
                      final task = NewTask(titleController.text,
                          descriptionController.text, priority, deadline);
                      bool created = await TaskService.create(task);

                      if (created) {
                        Navigator.pushNamed(context, TasksScreen.routeName);
                      }
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    textStyle: const TextStyle(fontSize: 16),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                  ),
                  child: const Text('Create task'),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: const BottomNavigation(2),
    );
  }
}

class PriorityChoice extends StatefulWidget {
  String priorityController;

  // add an argument which will be a function that will be called when the priority is changed to update state in the parent component
  dynamic onChange;

  PriorityChoice(this.priorityController, {Key? key, required this.onChange})
      : super(key: key);

  @override
  State<PriorityChoice> createState() => _PriorityChoiceState();
}

class _PriorityChoiceState extends State<PriorityChoice> {
  String priority = "";

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Radio(
                value: "high",
                groupValue: priority,
                onChanged: (value) {
                  setState(() {
                    priority = value.toString();
                    widget.priorityController = priority;
                    widget.onChange(priority);
                  });
                }),
            const CircleAvatar(
              backgroundColor: Colors.red,
              radius: 5,
            ),
            const SizedBox(
              width: 10,
            ),
            const Text(
              "High",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
          ],
        ),
        Row(
          children: [
            Radio(
                value: "medium",
                groupValue: priority,
                onChanged: (value) {
                  setState(() {
                    priority = value.toString();
                    widget.priorityController = priority;
                    widget.onChange(priority);
                  });
                }),
            const CircleAvatar(
              backgroundColor: Color(0xff79C7B4),
              radius: 5,
            ),
            const SizedBox(
              width: 10,
            ),
            const Text(
              "Medium",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
          ],
        ),
        Row(
          children: [
            Radio(
                value: "low",
                groupValue: priority,
                onChanged: (value) {
                  setState(() {
                    priority = value.toString();
                    widget.priorityController = priority;
                    widget.onChange(priority);
                  });
                }),
            CircleAvatar(
              backgroundColor: Colors.yellow.shade500,
              radius: 5,
            ),
            const SizedBox(
              width: 10,
            ),
            const Text(
              "Low",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ],
    );
  }
}
