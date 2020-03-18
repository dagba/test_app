import 'package:flutter/material.dart';
import 'package:testapp/presentation/bloc/task_list/task_view_model.dart';
import 'package:testapp/presentation/ui/widgets/task_cell.dart';

class TaskListItem extends StatelessWidget {
  const TaskListItem({Key key, @required this.viewModel}) : super(key: key);

  final TaskViewModel viewModel;

  Widget get _separator => Container(
        height: 1.0,
        color: Colors.blueGrey.withOpacity(0.3),
      );

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TaskCell(
          body: viewModel.body,
          time: viewModel.completeTime,
          timeLeft: viewModel.timeLeft,
        ),
        _separator
      ],
    );
  }
}
