import 'package:flutter/material.dart';
import 'package:testapp/data/Constants.dart';

class EmptyCell extends StatelessWidget {
  final String header;
  final String body;

  EmptyCell({Key key, @required this.header, @required this.body})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: _Constants.bgColor,
        borderRadius: BorderRadius.circular(_Constants.borderRadius),
        boxShadow: [_Constants.boxShadow],
      ),
      padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Column(
        children: <Widget>[
          Text(header, style: _Constants.headerTextStyle),
          SizedBox(
            height: 12.0,
          ),
          Text(
            body,
            style: TextStyle(
                color: _Constants.bodyColor.withOpacity(0.8),
                fontSize: _Constants.bodyFontSize),
          )
        ],
      ),
    );
  }
}

class _Constants {
  static const bgColor = AppColors.lightGreen;
  static const borderRadius = 10.0;

  static const boxShadow = BoxShadow(
    color: const Color(0xFFd9d9d9),
    offset: const Offset(0, 4.0),
    blurRadius: 4.0,
  );

  static const headerTextStyle = TextStyle(
      color: Color(0xFF323232), fontSize: 24.0, fontWeight: FontWeight.bold);

  static const bodyOpacity = 0.8;
  static const bodyFontSize = 14.0;
  static const bodyColor = Color(0xFF2C2C2C);
}
