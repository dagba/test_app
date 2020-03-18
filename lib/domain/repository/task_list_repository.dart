import 'package:jiffy/jiffy.dart';
import 'package:testapp/data/model/task.dart';

abstract class TaskListRepository {
  void addTask({String text});
  Future<List<Task>> getSortedTasks();
}

class TaskListRepositoryImpl implements TaskListRepository {
  List<Task> tasks = [];

  @override
  void addTask({String text}) {
    final separatedText = text.split(" "); // split the text to time and body
    String body = "";
    DateTime completeTime;
    DateTime currentTime = DateTime.now();
    int year = currentTime.year;
    int month = currentTime.month;
    int day = currentTime.day;
    final time = separatedText.first;

    if (separatedText.length > 1 && time?.contains(":")) {
      completeTime =
          Jiffy("$year-$month-$day $time", "yyyy-MM-dd hh:mm").dateTime;
      // if complete time is earlier - skip
      if (completeTime.isBefore(currentTime)) {
        return;
      }
      body = separatedText
          .sublist(1, separatedText.length)
          .reduce((s1, s2) => "$s1 $s2");
    } else {
      body = text;
    }
// 19:54 asdasdasdasd asdas asdasdasd
    final task = Task((b) => b
      ..body = body
      ..completeTime = completeTime);
    tasks.add(task);
  }

  @override
  Future<List<Task>> getSortedTasks() async {
    final noTimeTasks = tasks.where((t) => t.completeTime == null).toList();

    List<Task> withTimeSortedTasks = tasks
        .where((t) => t.completeTime != null)
        .where((t) => DateTime.now().day == t.completeTime.day)
        .toList();

    withTimeSortedTasks
        .sort((t1, t2) => t1.completeTime.compareTo(t2.completeTime));

    final sortedTasks = List<Task>()
      ..addAll(noTimeTasks)
      ..addAll(withTimeSortedTasks);

    return sortedTasks;
  }
}
