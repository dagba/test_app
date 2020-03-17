import 'package:testapp/presentation/bloc/base/event_base.dart';

abstract class TaskListEvent extends EventBase {
  const TaskListEvent();
}

class TaskListCreate extends TaskListEvent {
  final String text;
  const TaskListCreate(this.text);
}

class TaskListInit extends TaskListEvent {
  const TaskListInit();
}
