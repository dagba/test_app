import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:testapp/data/Constants.dart';

class InputField extends StatefulWidget {
  final Function(String) submitHandler;

  InputField({Key key, @required this.submitHandler}) : super(key: key);

  @override
  _InputFieldState createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  // MARK:- Properties

  String _text = "";

  // MARK:- Functions

  void _onPressed() {
    widget.submitHandler(_text);
  }

  void _onChanged(String txt) {
    _text = txt;
  }

  // MARK:- Lifecycle methods

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80.0,
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [_Constants.boxShadow],
          borderRadius: BorderRadius.only(
              topLeft: _Constants.borderRadius,
              topRight: _Constants.borderRadius)),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 16.0),
        child: Row(
          children: <Widget>[
            TextField(
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: AppColors.lightGreen, width: 1.0)),
                  contentPadding: const EdgeInsets.symmetric(
                      horizontal: 9.0, vertical: 12.0),
                  hintText: _Constants.hintText,
                ),
                maxLines: 6,
                onChanged: _onChanged),
            SizedBox(
              width: 8.0,
            ),
            MaterialButton(
              onPressed: _onPressed,
              color: Colors.blue,
              textColor: Colors.white,
              child: Icon(
                Icons.arrow_upward,
                size: 24,
              ),
              padding: EdgeInsets.all(16),
              shape: CircleBorder(),
            ),
          ],
        ),
      ),
    );
  }
}

class _Constants {
  static const boxShadow = BoxShadow(
    color: const Color(0xFFe6e6e6),
    offset: const Offset(0.0, -4.0),
    blurRadius: 4.0,
  );

  static const borderRadius = Radius.circular(20.0);

  static const hintText = "Что нужно сделать?";
}
