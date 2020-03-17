import 'package:jiffy/jiffy.dart';
import 'package:testapp/data/model/task.dart';

abstract class TaskListRepository {
  void addTask({String text});
  Future<List<Task>> getSortedTasks();
}

class TaskListRepositoryImpl implements TaskListRepository {
  List<Task> tasks = [];

  TaskListRepositoryImpl({this.tasks = const []});
  @override
  void addTask({String text}) {
    final separatedText = text.split(" "); // split the text to time and body
    String body = "";
    DateTime completeTime;
    DateTime currentTime = DateTime.now();
    int year = currentTime.year;
    int month = currentTime.month;
    int day = currentTime.day;

    if (separatedText.length > 1) {
      completeTime =
          Jiffy("$year-$month-$day $separatedText.first", "yyyy-MM-dd hh:mm")
              .dateTime;
      // if complete time is earlier than current set date time to next day
      if (completeTime.isBefore(currentTime)) {
        completeTime = Jiffy("$year-$month-${day + 1} $separatedText.first",
                "yyyy-MM-dd hh:mm")
            .dateTime;
      }
      body = separatedText[1];
    } else {
      body = text;
    }

    final task = Task((b) => b
      ..body = body
      ..completeTime = completeTime);
    tasks.add(task);
  }

  @override
  Future<List<Task>> getSortedTasks() async {
    final noTimeTasks = tasks.where((t) => t.completeTime == null);

    List<Task> withTimeSortedTasks = tasks
      ..where((t) => t.completeTime != null)
      ..where((t) => DateTime.now().day == t.completeTime.day);

    withTimeSortedTasks
        .sort((t1, t2) => t1.completeTime.compareTo(t2.completeTime));

    final sortedTasks = List<Task>()
      ..addAll(noTimeTasks)
      ..addAll(withTimeSortedTasks);

    return sortedTasks;
  }
}
