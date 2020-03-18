import 'package:rxdart/src/subjects/behavior_subject.dart';
import 'package:testapp/domain/repository/task_list_repository.dart';
import 'package:testapp/presentation/bloc/base/bloc_base.dart';
import 'package:testapp/presentation/bloc/task_list/task_view_model.dart';

import 'task_list_event.dart';
import 'task_list_state.dart';

class TaskListBloc implements BlocBase<TaskListEvent, TaskListState> {
  static const TaskListEmpty _taskListEmpty = TaskListEmpty(
      header: _Constants.emptyStateHeader, body: _Constants.emptyStateBody);

  TaskListRepository _repository;

  @override
  final state = BehaviorSubject<TaskListState>.seeded(TaskListLoading());

  TaskListBloc({TaskListRepositoryImpl repository}) {
    this._repository = repository;
    _updateViewState();
  }

  @override
  void dispatch(TaskListEvent event) {
    if (event is TaskListInit) {
      state.add(TaskListLoading());

      _updateViewState();
    } else if (event is TaskListSubmitted) {
      state.add(TaskListLoading());

      final text = event.text.trim(); // remove whitespaces

      if (!text.isEmpty) {
        _repository.addTask(text: text);
        _updateViewState();
      } else {
        state.add(TaskListError(message: _Constants.emptyTextError));
      }
    }
  }

  @override
  void dispose() {
    state.close();
  }

  void _updateViewState() {
    _repository.getSortedTasks().then((tasks) {
      final viewModels = tasks.map((t) => TaskViewModel(t)).toList();
      if (!viewModels.isEmpty) {
        state.add(TaskListAdd(models: viewModels));
      } else {
        state.add(TaskListEmpty(
            body: _Constants.emptyStateBody,
            header: _Constants.emptyStateHeader));
      }
    }).catchError((e) => state.add(TaskListError(message: e.toString())));
  }
}

class _Constants {
  static const String emptyStateHeader = "Вы впервые?";
  static const String emptyStateBody =
      "Вы можете добавить напоминание снизу. Используйте формат “12:00 cходить в магазин”, чтобы задать напоминание по времени";
  static const String emptyTextError = "Вы ввели пустую строку";
}
