import 'package:daily_purify/manager/user_manager.dart';
import 'package:daily_purify/pages/wanandroid_login_home_page.dart';
import 'package:daily_purify/pages/wanandroid_login_page.dart';
import 'package:daily_purify/pages/wanandroid_signup_page.dart';
import 'package:daily_purify/util/toast_utils.dart';
import 'package:flutter/material.dart';

class WanAndroidUniversalLoginPage extends StatefulWidget {
  @override
  _WanAndroidUniversalLoginPageState createState() =>
      new _WanAndroidUniversalLoginPageState();
}

class _WanAndroidUniversalLoginPageState
    extends State<WanAndroidUniversalLoginPage> with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  Widget _homePage() {
    return WanAndroidLoginHomePage(
      signup: _gotoSignup,
      login: _gotoLogin,
    );
  }

  Widget _loginPage() {
    return WanAndroidLoginPage(
      login: _login,
    );
  }

  Widget _signupPage() {
    return WanAndroidSignupPage(
      signup: _signup,
      onGoLogin: _gotoLogin,
    );
  }

  _gotoLogin() {
//    _controller.animateToPage(0,
//        duration: Duration(milliseconds: 500), curve: Curves.linear);
    _controller.jumpToPage(0);
  }

  _gotoSignup() {
//    _controller.animateToPage(
//      2,
//      duration: Duration(milliseconds: 800),
//      curve: Curves.bounceOut,
//    );
    _controller.jumpToPage(2);
  }

  /// 登录
  _login(String username, String password) {
    UserManager().login(
        username: username,
        password: password,
        callback: (bool success, String msg) {
          if (success) {
            ToastUtils.showSnack(context, '欢迎回来~');
            Navigator.of(context).pop();
          } else {
            ToastUtils.showSnack(context, msg);
          }
        });
  }

  /// 注册
  _signup(String username, String password) {
    UserManager().register(
        username: username,
        password: password,
        callback: (bool success, String msg) {
          if (success) {
            ToastUtils.showSnack(context, '好久不见，新人~');
            Navigator.of(context).pop();
          } else {
            ToastUtils.showSnack(context, msg);
          }
        });
  }

  PageController _controller =
      new PageController(initialPage: 1, viewportFraction: 1.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          height: MediaQuery.of(context).size.height,
          child: PageView(
            controller: _controller,
            physics: new AlwaysScrollableScrollPhysics(),
            children: <Widget>[_loginPage(), _homePage(), _signupPage()],
            scrollDirection: Axis.horizontal,
          )),
    );
  }
}
