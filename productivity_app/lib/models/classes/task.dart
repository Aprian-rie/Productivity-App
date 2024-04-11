class Task {
  late List<Task> tasks;
  late String note;
  late DateTime timeToComplete;
  bool completed;
  late String repeats;
  late DateTime deadline;
  late List<DateTime> reminders;
  String taskId;
  String title;

  Task(this.title, this.completed, this.taskId);
}
