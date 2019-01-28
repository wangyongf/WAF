import 'package:daily_purify/common/my_theme.dart';
import 'package:daily_purify/common/routes_name.dart';
import 'package:daily_purify/pages/about_wancaibao_page.dart';
import 'package:daily_purify/pages/account_info_page.dart';
import 'package:daily_purify/pages/account_setting_page.dart';
import 'package:daily_purify/pages/feedback_page.dart';
import 'package:daily_purify/pages/guide_page.dart';
import 'package:daily_purify/pages/more_page.dart';
import 'package:daily_purify/pages/password_manage_page.dart';
import 'package:daily_purify/pages/wanandroid_about_page.dart';
import 'package:daily_purify/pages/wanandroid_collections_page.dart';
import 'package:daily_purify/pages/wanandroid_debug_page.dart';
import 'package:daily_purify/pages/wanandroid_feedback_page.dart';
import 'package:daily_purify/pages/wanandroid_home_page.dart';
import 'package:daily_purify/pages/wanandroid_knowledge_page.dart';
import 'package:daily_purify/pages/wanandroid_main_page.dart';
import 'package:daily_purify/pages/wanandroid_message_center_page.dart';
import 'package:daily_purify/pages/wanandroid_mine_page.dart';
import 'package:daily_purify/pages/wanandroid_project_page.dart';
import 'package:daily_purify/pages/wanandroid_read_list_page.dart';
import 'package:daily_purify/pages/wanandroid_settings_page.dart';
import 'package:daily_purify/pages/wanandroid_tag_manager_page.dart';
import 'package:daily_purify/pages/wanandroid_universal_login_page.dart';
import 'package:daily_purify/pages/wanandroid_user_info_page.dart';
import 'package:daily_purify/pages/wanandroid_webview_page.dart';
import 'package:daily_purify/pages/wanandroid_wechat_page.dart';
import 'package:daily_purify/pages/wancai_login_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    routes: <String, WidgetBuilder>{
      Routes.LOGIN_PAGE: (BuildContext context) => WancaiLoginPage(),
      Routes.SETTINGS_PAGE: (BuildContext context) => AccountSettingPage(),
      Routes.ABOUT_PAGE: (BuildContext context) => AboutWancaibaoPage(),
      Routes.FEEDBACK_PAGE: (BuildContext context) => FeedbackPage(),
      Routes.MORE_PAGE: (BuildContext context) => MorePage(),
      Routes.PASSWORD_MANAGE_PAGE: (BuildContext context) =>
          PasswordManagePage(),
      Routes.ACCOUNT_INFO_PAGE: (BuildContext context) => AccountInfoPage(),
      Routes.GUIDE_PAGE: (BuildContext context) => GuidePage(),
      Routes.WAN_ANDROID_MAIN_PAGE: (BuildContext context) =>
          WanAndroidMainPage(),
      Routes.WAN_ANDROID_HOME_PAGE: (BuildContext context) =>
          WanAndroidHomePage(),
      Routes.WAN_ANDROID_PROJECT_PAGE: (BuildContext context) =>
          WanAndroidProjectPage(),
      Routes.WAN_ANDROID_WECHAT_PAGE: (BuildContext context) =>
          WanAndroidWechatPage(),
      Routes.WAN_ANDROID_KNOWLEDGE_PAGE: (BuildContext context) =>
          WanAndroidKnowledgePage(),
      Routes.WAN_ANDROID_MINE_PAGE: (BuildContext context) =>
          WanAndroidMinePage(),
      Routes.WAN_ANDROID_WEBVIEW_PAGE: (BuildContext context) =>
          WanAndroidWebViewPage(),
      Routes.WAN_ANDROID_SETTINGS_PAGE: (BuildContext context) =>
          WanAndroidSettingsPage(),
      Routes.WAN_ANDROID_MESSAGE_CENTER_PAGE: (BuildContext context) =>
          WanAndroidMessageCenterPage(),
      Routes.WAN_ANDROID_COLLECTIONS_PAGE: (BuildContext context) =>
          WanAndroidCollectionsPage(),
      Routes.WAN_ANDROID_READLIST_PAGE: (BuildContext context) =>
          WanAndroidReadListPage(),
      Routes.WAN_ANDROID_TAG_MANAGER_PAGE: (BuildContext context) =>
          WanAndroidTagManagerPage(),
      Routes.WAN_ANDROID_FEEDBACK_PAGE: (BuildContext context) =>
          WanAndroidFeedbackPage(),
      Routes.WAN_ANDROID_LOGIN_PAGE: (BuildContext context) =>
          WanAndroidUniversalLoginPage(),
      Routes.WAN_ANDROID_ABOUT_PAGE: (BuildContext context) =>
          WanAndroidAboutPage(),
      Routes.WAN_ANDROID_USER_INFO_PAGE: (BuildContext context) =>
          WanAndroidUserInfoPage(),
      Routes.WAN_ANDROID_DEBUG_PAGE: (BuildContext context) =>
          WanAndroidDebugPage(),
    },
    home: WanAndroidUniversalLoginPage(),
    debugShowCheckedModeBanner: false,
    theme: MyTheme.theme,
  ));
}
