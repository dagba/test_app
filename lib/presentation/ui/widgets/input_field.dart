import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:testapp/data/constants.dart';
import 'package:testapp/utils.dart';

class InputField extends StatefulWidget {
  final Function(String) submitHandler;

  InputField({Key key, @required this.submitHandler}) : super(key: key);

  @override
  _InputFieldState createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  // MARK:- Properties

  var _controller = TextEditingController();

  // MARK:- Functions

  void _onPressed() {
    widget.submitHandler(_controller.text);
    _controller.clear();
    KeyboardHelper.dismiss(context);
  }

  // MARK:- Lifecycle methods

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [_Constants.boxShadow],
          borderRadius: BorderRadius.only(
              topLeft: _Constants.borderRadius,
              topRight: _Constants.borderRadius)),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  focusedBorder: _Constants.textFieldBorder,
                  enabledBorder: _Constants.textFieldBorder,
                  contentPadding: const EdgeInsets.symmetric(
                      horizontal: 9.0, vertical: 12.0),
                  hintText: _Constants.hintText,
                ),
                style: const TextStyle(fontSize: _Constants.textFieldFontSize),
                controller: _controller,
                onSubmitted: (_) => _onPressed,
              ),
            ),
            SizedBox(
              width: 8.0,
            ),
            FloatingActionButton(
              onPressed: _onPressed,
              elevation: 0.0,
              backgroundColor: AppColors.blue,
              shape: CircleBorder(),
              child: Icon(Icons.arrow_upward),
            )
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

  static const textFieldBorder = const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(10.0)),
      borderSide: BorderSide(color: AppColors.green, width: 1.0));

  static const borderRadius = Radius.circular(20.0);

  static const hintText = "Что нужно сделать?";
  static const textFieldFontSize = 14.0;
}
