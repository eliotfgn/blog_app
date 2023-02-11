class NewTask {
  String title;
  String description;
  String priority;
  String deadlineAt;

  NewTask(this.title, this.description, this.priority, this.deadlineAt);

  Map<String, String> toJson() {
    return {
      "title": title,
      "description": description,
      "priority": priority,
      "deadline_at": deadlineAt
    };
  }
}