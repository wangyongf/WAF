import 'package:daily_purify/common/routes_name.dart';
import 'package:daily_purify/pages/about_wancaibao_page.dart';
import 'package:daily_purify/pages/account_info_page.dart';
import 'package:daily_purify/pages/account_setting_page.dart';
import 'package:daily_purify/pages/feedback_page.dart';
import 'package:daily_purify/pages/guide_page.dart';
import 'package:daily_purify/pages/home_page.dart';
import 'package:daily_purify/pages/login_page.dart';
import 'package:daily_purify/pages/more_page.dart';
import 'package:daily_purify/pages/password_manage_page.dart';
import 'package:daily_purify/pages/wancai_login_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(routes: <String, WidgetBuilder>{
    RoutesName.routesHomePage: (BuildContext context) => HomePage(),
    RoutesName.routesRegistPage: (BuildContext context) => LoginPage(),
    '/wancaibao/login': (BuildContext context) => WancaiLoginPage(),
    '/wancaibao/settings': (BuildContext context) => AccountSettingPage(),
    '/wancaibao/about': (BuildContext context) => AboutWancaibaoPage(),
    '/wancaibao/feedback': (BuildContext context) => FeedbackPage(),
    '/wancaibao/more': (BuildContext context) => MorePage(),
    '/wancaibao/password-manage': (BuildContext context) =>
        PasswordManagePage(),
    '/wancaibao/account-info': (BuildContext context) => AccountInfoPage(),
    '/guide': (BuildContext context) => GuidePage(),
  }, home: AccountInfoPage()));
}
