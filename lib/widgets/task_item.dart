import 'package:blog/services/task_service.dart';
import 'package:flutter/material.dart';

class TaskItem extends StatefulWidget {
  final String title;
  final String description;
  final String priority;
  final String id;
  final dynamic onDelete;

  const TaskItem(
      {Key? key,
      required this.title,
      required this.description,
      required this.priority,
      required this.id,
      required this.onDelete})
      : super(key: key);

  @override
  State<TaskItem> createState() => _TaskItemState();
}

class _TaskItemState extends State<TaskItem> {
  Color taskColor() {
    switch (widget.priority) {
      case "low":
        return Colors.yellow.shade500;
      case "medium":
        return Color(0xff79C7B4);
      case "high":
        return Colors.red;
      default:
        return Colors.green;
    }
  }

  String description = "";

  @override
  void initState() {
    super.initState();

    if (widget.description.length > 150) {
      setState(() {
        description = "${widget.description.substring(0, 150)}...";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(-2, 2), // changes position of shadow
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 8,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.title,
                  style: const TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Container(
                  height: 13,
                  width: 13,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: taskColor(),
                  ),
                ),
                const Spacer(),
                GestureDetector(
                  onTap: () async {
                    bool deleted = false;
                    deleted = await TaskService.delete(widget.id);
                    if (deleted) {
                      widget.onDelete();
                    }
                  },
                  child: const Icon(
                    Icons.delete,
                    color: Colors.red,
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              widget.description,
              textAlign: TextAlign.start,
            )
          ],
        ));
  }
}
