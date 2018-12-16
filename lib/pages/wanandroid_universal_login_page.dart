import 'package:daily_purify/pages/wanandroid_login_home_page.dart';
import 'package:daily_purify/pages/wanandroid_login_page.dart';
import 'package:daily_purify/pages/wanandroid_signup_page.dart';
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
    return WanAndroidLoginHomePage();
  }

  Widget _loginPage() {
    return WanAndroidLoginPage();
  }

  Widget _signupPage() {
    return WanAndroidSignupPage();
  }

  gotoLogin() {
    //controller_0To1.forward(from: 0.0);
    _controller.animateToPage(
      0,
      duration: Duration(milliseconds: 800),
      curve: Curves.bounceOut,
    );
  }

  gotoSignup() {
    //controller_minus1To0.reverse(from: 0.0);
    _controller.animateToPage(
      2,
      duration: Duration(milliseconds: 800),
      curve: Curves.bounceOut,
    );
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
