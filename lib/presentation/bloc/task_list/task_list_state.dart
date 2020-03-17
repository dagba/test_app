import 'package:testapp/presentation/bloc/base/state_base.dart';
import 'package:testapp/presentation/bloc/task_list/task_view_model.dart';

abstract class TaskListState extends StateBase {
  const TaskListState();
}

class TaskListLoading extends TaskListState {
  const TaskListLoading();
}

class TaskListAdd extends TaskListState {
  final List<TaskViewModel> models;

  const TaskListAdd(this.models);
}

class TaskListError extends TaskListState {
  final String message;

  const TaskListError({this.message});
}

class TaskListEmpty extends TaskListState {
  final String header;
  final String body;

  const TaskListEmpty({this.header, this.body});
}
