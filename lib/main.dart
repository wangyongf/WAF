import 'package:daily_purify/common/routes_name.dart';
import 'package:daily_purify/pages/about_wancaibao_page.dart';
import 'package:daily_purify/pages/account_info_page.dart';
import 'package:daily_purify/pages/account_setting_page.dart';
import 'package:daily_purify/pages/feedback_page.dart';
import 'package:daily_purify/pages/guide_page.dart';
import 'package:daily_purify/pages/more_page.dart';
import 'package:daily_purify/pages/password_manage_page.dart';
import 'package:daily_purify/pages/wanandroid_home_page.dart';
import 'package:daily_purify/pages/wancai_login_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(routes: <String, WidgetBuilder>{
    Routes.loginPage: (BuildContext context) => WancaiLoginPage(),
    Routes.settingsPage: (BuildContext context) => AccountSettingPage(),
    Routes.aboutPage: (BuildContext context) => AboutWancaibaoPage(),
    Routes.feedbackPage: (BuildContext context) => FeedbackPage(),
    Routes.morePage: (BuildContext context) => MorePage(),
    Routes.passwordManagePage: (BuildContext context) => PasswordManagePage(),
    Routes.accountInfoPage: (BuildContext context) => AccountInfoPage(),
    Routes.guidePage: (BuildContext context) => GuidePage(),
    Routes.wanHomePage: (BuildContext context) => WanAndroidHomePage(),
  }, home: WanAndroidHomePage()));
}
