import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';

import '../style/app_size.dart';

class AppToast {
  static void error(String msg) {
    Fluttertoast.showToast(
      msg: msg,
      timeInSecForIosWeb: 2,
      textColor: Colors.white,
      backgroundColor: Colors.red,
      gravity: ToastGravity.BOTTOM,
      toastLength: Toast.LENGTH_LONG,
      fontSize: AppSize.font(16),
    );
  }

  static void success(String msg) {
    Fluttertoast.showToast(
      msg: msg,
      timeInSecForIosWeb: 2,
      textColor: Colors.white,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.green,
      toastLength: Toast.LENGTH_LONG,
      fontSize: AppSize.font(16),
    );
  }
}
