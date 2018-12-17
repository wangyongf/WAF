import 'package:flutter/material.dart';

class MyTheme {
  static get theme {
    final originalTextTheme = ThemeData.dark().textTheme;
    final originalBody1 = originalTextTheme.body1;

    return ThemeData.light().copyWith(
        primaryColor: Colors.redAccent,
//        accentColor: Colors.cyan[300],
//        buttonColor: Colors.grey[800],
//        textSelectionColor: Colors.cyan[100],
//        backgroundColor: Colors.grey[800],
//        toggleableActiveColor: Colors.cyan[300],
//        textTheme: originalTextTheme.copyWith(
//            body1:
//                originalBody1.copyWith(decorationColor: Colors.transparent))
    );
  }
}
