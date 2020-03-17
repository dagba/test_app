import 'dart:async';

import 'package:flutter/material.dart';

class TaskCell extends StatefulWidget {
  final String time, body;
  final DateTime date;
  final String Function(DateTime) timeLeftProducer;

  TaskCell({Key key, this.time, this.body, this.date, this.timeLeftProducer})
      : super(key: key);

  @override
  _TaskCellState createState() => _TaskCellState();
}

class _TaskCellState extends State<TaskCell> with TickerProviderStateMixin {
  Timer _timer;
  int _start = 10;

  void startTimer() {
    const oneSec = const Duration(seconds: 1);
    _timer = new Timer.periodic(
      oneSec,
      (Timer timer) => setState(
        () {
          if (_start < 1) {
            timer.cancel();
          } else {
            _start = _start - 1;
          }
        },
      ),
    );
  }

  // MARK:- Lifecycle methods

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 7.0),
      child: Column(
        children: <Widget>[Text("$widget.time $widget.body"), Text()],
      ),
    );
  }
}
