import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ToastUtils {
  /// 显示 Snackbar
  static void showSnack(BuildContext context, String msg) {
    Scaffold.of(context).showSnackBar(SnackBar(content: Text(msg)));
  }

  /// 显示 Toast
  static void showToast(BuildContext context, String msg) {
    Fluttertoast.showToast(msg: msg);
  }
}
