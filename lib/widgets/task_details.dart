import 'package:blog/models/task.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

import '../services/task_service.dart';

class TaskDetails extends StatefulWidget {
  Task? task;
  dynamic close;

  TaskDetails({Key? key, this.task, this.close}) : super(key: key);

  @override
  State<TaskDetails> createState() => _TaskDetailsState();
}

class _TaskDetailsState extends State<TaskDetails> {
  late bool taskStarted;
  late bool completed;

  @override
  void initState() {
    super.initState();

    if (widget.task?.beginedAt != null) {
      if (widget.task?.beginedAt != "") {
        taskStarted = true;
      } else {
        taskStarted = false;
      }
    } else {
      taskStarted = false;
    }

    if (widget.task?.finishedAt != null) {
      if (widget.task?.finishedAt != "") {
        completed = true;
      } else {
        completed = false;
      }
    } else {
      completed = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    final TextEditingController titleController =
        TextEditingController(text: widget.task?.title);
    final TextEditingController descriptionController =
        TextEditingController(text: widget.task?.description);
    final TextEditingController beginningController =
        TextEditingController(text: widget.task?.beginedAt ?? "-");
    final TextEditingController deadlineController =
        TextEditingController(text: widget.task?.deadlineAt ?? "-");
    bool editDescription = true;
    bool editTitle = true;

    final _formKey = GlobalKey<FormState>();
    return GestureDetector(
      onTap: widget.close,
      child: Container(
        color: Colors.black.withOpacity(0.5),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Center(
          heightFactor: 0.1,
          child: GestureDetector(
            onTap: () {},
            child: Card(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                margin:
                    const EdgeInsets.symmetric(vertical: 200, horizontal: 30),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        !taskStarted
                            ? ElevatedButton(
                                onPressed: () async {
                                  final task_ = widget.task;
                                  if (task_ != null) {
                                    bool done =
                                        await TaskService.beginTask(task_.id);
                                    beginningController.text =
                                        DateTime.now().toString();
                                    if (done) {
                                      setState(() {
                                        taskStarted = true;
                                        widget.close();
                                      });
                                    }
                                  }
                                },
                                style: ElevatedButton.styleFrom(
                                  textStyle: const TextStyle(fontSize: 16),
                                  shape: const RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20)),
                                  ),
                                ),
                                child: const Text('Start task'),
                              )
                            : !completed
                                ? ElevatedButton(
                                    onPressed: () async {
                                      final task_ = widget.task;
                                      bool completed_ = false;
                                      if (task_ != null) {
                                        completed_ =
                                            await TaskService.finishTask(
                                                task_.id);
                                      }
                                      if (completed_) {
                                        setState(() {
                                          completed = true;
                                          print(completed_);
                                          widget.close();
                                        });
                                      }
                                    },
                                    style: ElevatedButton.styleFrom(
                                      textStyle: const TextStyle(fontSize: 16),
                                      shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20)),
                                      ),
                                    ),
                                    child: const Text('Finish task'),
                                  )
                                : Container(
                                    width: double.infinity,
                                    height: 40,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(50),
                                        border: const Border.fromBorderSide(
                                            BorderSide(
                                                color: Colors.green,
                                                width: 2))),
                                    child: const Center(
                                        child: Text(
                                      "Completed",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.green),
                                    )),
                                  ),
                        const SizedBox(
                          height: 30,
                        ),
                        TextFormField(
                          controller: titleController,
                          readOnly: editTitle,
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
                                borderSide:
                                    const BorderSide(color: Colors.black),
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
                                      fontFamily:
                                          GoogleFonts.inter().fontFamily,
                                      letterSpacing: 1),
                                ),
                              ),
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.always),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          readOnly: editDescription,
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
                                borderSide:
                                    const BorderSide(color: Colors.black),
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
                                      fontFamily:
                                          GoogleFonts.inter().fontFamily,
                                      letterSpacing: 1),
                                ),
                              ),
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.always),
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
                                        borderSide: const BorderSide(
                                            color: Colors.black),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      label: Container(
                                        transform:
                                            Matrix4.translationValues(0, 0, 0),
                                        child: Text(
                                          "Beginning",
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.black,
                                              fontWeight: FontWeight.w600,
                                              fontFamily: GoogleFonts.inter()
                                                  .fontFamily,
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
                                    }
                                  },
                                  decoration: InputDecoration(
                                      suffixIcon: const Icon(
                                          Icons.keyboard_arrow_down_rounded),
                                      border: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                              color: Colors.black,
                                              width: 2,
                                              style: BorderStyle.none),
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: Colors.black),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      label: Container(
                                        transform:
                                            Matrix4.translationValues(0, 0, 0),
                                        child: Text(
                                          "Deadline",
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.black,
                                              fontWeight: FontWeight.w600,
                                              fontFamily: GoogleFonts.inter()
                                                  .fontFamily,
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
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            textStyle: const TextStyle(fontSize: 16),
                            shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                            ),
                          ),
                          child: const Text('Set modifications'),
                        ),
                      ],
                    ),
                  ),
                )),
          ),
        ),
      ),
    );
  }
}
