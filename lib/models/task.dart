class Task {
  String id;
  String title;
  String description;
  String priority;
  String? beginedAt;
  String deadlineAt;
  String? finishedAt;

  Task(this.id, this.title, this.description, this.priority, this.beginedAt,
      this.deadlineAt, this.finishedAt);

  factory Task.fromJson(Map<String, dynamic> json) => Task(
        json['id'],
        json['title'],
        json['description'],
        json['priority'],
        json['begined_at'],
        json['deadline_at'],
        json['finished_at'],
      );
}
