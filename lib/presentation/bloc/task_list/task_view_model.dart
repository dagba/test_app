import 'package:testapp/data/model/task.dart';

class TaskViewModel {
  Duration timeLeft;
  String completeTime;
  String body;

  TaskViewModel(Task task) {
    final currentDate = DateTime.now();
    final isTimeSpecified = task.completeTime != null;

    if (isTimeSpecified) {
      this.timeLeft = currentDate.difference(task.completeTime).abs();
      this.completeTime =
          "${task.completeTime.hour}:${task.completeTime.minute}";
      this.body = task.body;
    } else {
      this.completeTime = _Constants.noCompleteTime;
      this.body = task.body;
    }
  }
}

class _Constants {
  static const String noCompleteTime = "";
}
