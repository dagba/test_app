import 'package:flutter/material.dart';

class NoticeCell extends StatelessWidget {
  final String message;

  NoticeCell(this.message);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Text(
        message,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24.0),
        textAlign: TextAlign.center,
      ),
    );
  }
}
