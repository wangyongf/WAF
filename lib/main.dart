import 'package:daily_purify/common/routes_name.dart';
import 'package:daily_purify/pages/account_setting_page.dart';
import 'package:daily_purify/pages/home_page.dart';
import 'package:daily_purify/pages/login_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(routes: <String, WidgetBuilder>{
    RoutesName.routesHomePage: (BuildContext context) => HomePage(),
    RoutesName.routesRegistPage: (BuildContext context) => LoginPage(),
  }, home: AccountSettingPage()));
}
