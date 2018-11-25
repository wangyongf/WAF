import 'package:flutter/material.dart';

class SnakeBarHelper {
  static showSnackBar(BuildContext context, String str) {
    final snackBar = new SnackBar(content: new Text(str));
    Scaffold.of(context).showSnackBar(snackBar);
  }

  //如果弹不出请用这个
  static showSnackBarByKey(
      final GlobalKey<ScaffoldState> key, BuildContext context, String str) {
    final snackBar = new SnackBar(content: new Text(str));
    key.currentState.showSnackBar(snackBar);
  }
}
