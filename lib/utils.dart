import 'package:flutter/cupertino.dart';

class KeyboardHelper {
  static void dismiss(BuildContext context) {
    FocusScope.of(context).unfocus();
  }
}
