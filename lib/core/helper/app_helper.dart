import 'package:flutter/material.dart';

class AppHelper {
  /// CLOSE KEYBOARD
  static Future closeKeyboard() async {
    FocusManager.instance.primaryFocus?.unfocus();
  }
}
