import 'dart:core';

import 'package:flutter/material.dart';
import 'package:quiver/async.dart';

class TaskCell extends StatefulWidget {
  final String time, body;
  final Duration timeLeft;

  TaskCell({Key key, this.time, this.body, this.timeLeft}) : super(key: key);

  @override
  _TaskCellState createState() => _TaskCellState();
}

class _TaskCellState extends State<TaskCell> {
  CountdownTimer _timer;
  String _timeLeft = "";

  void _startTimer() {
    _timer?.cancel();
    _timer = CountdownTimer(
      widget.timeLeft,
      Duration(seconds: 1),
    );
    var sub = _timer.listen(null);

    sub.onData((duration) {
      setState(() {
        final elapsed = _timer.elapsed;
        final hoursLeft = widget.timeLeft.inHours;
        final minutesLeft = widget.timeLeft.inMinutes;
        final secondsLeft = widget.timeLeft.inSeconds;

        final diffHours = hoursLeft - elapsed.inHours;
        final diffMinutes = minutesLeft % 60 - elapsed.inMinutes % 60;
        final seconds =
            (elapsed.inSeconds <= secondsLeft % 60) ? secondsLeft % 60 : 60;
        final elapsedSeconds = (elapsed.inSeconds <= secondsLeft % 60)
            ? elapsed.inSeconds % 60
            : (elapsed.inSeconds - secondsLeft % 60) % 60;
        final diffSeconds = seconds - elapsedSeconds;

        _timeLeft = "$diffHours час. $diffMinutes мин. $diffSeconds сек.";

        _timeLeft += " осталось";
      });
    });

    sub.onDone(() {
      _timer.cancel();
    });
  }

  // MARK:- Lifecycle methods

  @override
  void initState() {
    super.initState();
  }

  @override
  void didUpdateWidget(TaskCell oldWidget) {
    if (widget.timeLeft != null) {
      _startTimer();
    } else {
      _timeLeft = "Без времени";
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Text(
            "${widget.time} ${widget.body}",
            style: const TextStyle(fontSize: 17.0, fontWeight: FontWeight.w300),
            textAlign: TextAlign.start,
          ),
          const SizedBox(height: 7.0),
          Text(
            _timeLeft,
            textAlign: TextAlign.end,
            style: const TextStyle(fontSize: 17.0, fontWeight: FontWeight.w300),
          ),
        ],
      ),
    );
  }
}
