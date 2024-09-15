import 'package:flutter/material.dart';

class PasswordVisibilityController extends ChangeNotifier {
  bool isVisible = true;

  void changeVisibility() {
    isVisible = !isVisible;
    notifyListeners();
  }
}
