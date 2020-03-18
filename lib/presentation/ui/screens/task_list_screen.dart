import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testapp/data/constants.dart';
import 'package:testapp/presentation/bloc/task_list/task_list_bloc.dart';
import 'package:testapp/presentation/bloc/task_list/task_list_event.dart';
import 'package:testapp/presentation/bloc/task_list/task_list_state.dart';
import 'package:testapp/presentation/ui/widgets/empty_cell.dart';
import 'package:testapp/presentation/ui/widgets/input_field.dart';
import 'package:testapp/presentation/ui/widgets/notice_cell.dart';
import 'package:testapp/presentation/ui/widgets/task_list_item.dart';

class TaskListScreen extends StatelessWidget {
// MARK:- Functions

  Widget _buildEmptyCell(String header, String body) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(16.0),
            child: EmptyCell(
              header: header,
              body: body,
            ),
          ),
        ]);
  }

  Widget _buildErrorCell(String message) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(padding: EdgeInsets.all(16.0), child: Text(message)),
        ]);
  }

  Widget _buildLoadingCell() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _buildTaskCountLabel(TaskListBloc bloc) {
    return StreamBuilder(
      stream: bloc.state,
      builder: (context, snapshot) {
        final state = snapshot.data;

        if (state is TaskListAdd) {
          return Container(
            width: AppBar().preferredSize.height / 2,
            height: AppBar().preferredSize.height / 2,
            margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 0.0),
            child: FloatingActionButton(
              onPressed: null,
              backgroundColor: AppColors.blue,
              shape: CircleBorder(),
              child: Text("${state.models.length}"),
            ),
          );
        }

        return Container();
      },
    );
  }

  Widget get _separator => Container(
        height: 1.0,
        color: Colors.blueGrey.withOpacity(0.3),
      );

  // MARK:- Lifecycle methods

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<TaskListBloc>(context);
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
        appBar: AppBar(
          title: const Text(Strings.appBarTitle),
          actions: <Widget>[
            _buildTaskCountLabel(bloc),
          ],
        ),
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              // tasks list
              Expanded(
                child: StreamBuilder<TaskListState>(
                  stream: bloc.state,
                  builder: (context, snapshot) {
                    final state = snapshot.data;

                    if (state is TaskListEmpty) {
                      return _buildEmptyCell(state.header, state.body);
                    } else if (state is TaskListLoading) {
                      return _buildLoadingCell();
                    } else if (state is TaskListAdd) {
                      return ListView.builder(
                        itemCount: state.models.length + 1,
                        itemBuilder: (BuildContext ctxt, int index) {
                          if (index < state.models.length) {
                            final viewModel = state.models[index];
                            return TaskListItem(viewModel: viewModel);
                          } else {
                            return NoticeCell(_Constants.noticeMessage);
                          }
                        },
                      );
                    } else if (state is TaskListError) {
                      return _buildErrorCell(state.message);
                    }
                    return Container();
                  },
                ),
              ),

              // input field
              InputField(
                submitHandler: (txt) {
                  bloc.dispatch(TaskListSubmitted(text: txt));
                },
              )
            ],
          ),
        ));
  }
}

class _Constants {
  static const inputFieldHeight = 80.0;
  static const noticeMessage = "Это все задания на сегодня!";
}
