import 'package:testapp/data/model/task.dart';

class TaskViewModel {
  bool isTimeSpecified;
  String timeLeft;
  String completeTime;
  String body;

  TaskViewModel(Task task) {
    final currentDate = DateTime.now();
    final difference = currentDate.difference(task.completeTime);

    this.isTimeSpecified = task.completeTime != null;
    if (this.isTimeSpecified) {
      this.timeLeft =
          "${difference.inHours} ${difference.inMinutes} ${difference.inSeconds} $_Constants.timeLeft";
      this.completeTime =
          "${task.completeTime.hour}:${task.completeTime.minute}";
      this.body = task.body;
    } else {
      this.timeLeft = _Constants.noTimeLeft;
      this.completeTime = _Constants.noCompleteTime;
      this.body = task.body;
    }
  }
}

class _Constants {
  static const String timeLeft = "осталось";
  static const String noTimeLeft = "Без времени";

  static const String noCompleteTime = "";
}
