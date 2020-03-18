import 'package:testapp/presentation/bloc/base/event_base.dart';

abstract class TaskListEvent extends EventBase {
  const TaskListEvent();
}

class TaskListInit extends TaskListEvent {
  const TaskListInit();
}

class TaskListSubmitted extends TaskListEvent {
  final String text;
  const TaskListSubmitted({this.text});
}
