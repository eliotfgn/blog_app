import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/constants.dart';

class CreateTaskScreen extends StatelessWidget {
  static const String routeName = "/create-task";

  CreateTaskScreen({Key? key}) : super(key: key);
  late TextEditingController titleController;
  late TextEditingController descriptionController;
  late TextEditingController beginningController;
  late TextEditingController deadlineController;
  late Key _formKey;

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
      body: Padding(
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
                              borderSide: const BorderSide(color: Colors.black),
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
                                    fontFamily: GoogleFonts.inter().fontFamily,
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
                            suffixIcon:
                                const Icon(Icons.keyboard_arrow_down_rounded),
                            border: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Colors.black,
                                    width: 2,
                                    style: BorderStyle.none),
                                borderRadius: BorderRadius.circular(10)),
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.black),
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
                                    fontFamily: GoogleFonts.inter().fontFamily,
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
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {},
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
    );
  }
}
