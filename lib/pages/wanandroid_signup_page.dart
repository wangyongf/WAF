import 'package:daily_purify/util/toast_utils.dart';
import 'package:flutter/material.dart';

typedef OnSignup(String username, String password);
typedef OnGoLogin();

class WanAndroidSignupPage extends StatefulWidget {
  final OnSignup signup;
  final OnGoLogin onGoLogin;

  WanAndroidSignupPage(
      {Key key, @required this.signup, @required this.onGoLogin})
      : super(key: key);

  @override
  _WanAndroidSignupPageState createState() => _WanAndroidSignupPageState();
}

class _WanAndroidSignupPageState extends State<WanAndroidSignupPage> {
  var _userController = TextEditingController();
  var _passController = TextEditingController();
  var _repassController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
        color: Colors.white,
        image: DecorationImage(
          colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.05), BlendMode.dstATop),
          image: AssetImage('assets/images/mountains.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(top: 80, bottom: 50),
            child: Center(
              child: Icon(
                Icons.android,
                color: Colors.redAccent,
                size: 50.0,
              ),
            ),
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(left: 40.0),
                  child: Text(
                    "用户名",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.redAccent,
                      fontSize: 15.0,
                    ),
                  ),
                ),
              ),
            ],
          ),
          _buildUsernameInput(context),
          Container(
            height: 12.0,
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(left: 40.0),
                  child: Text(
                    "密码",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.redAccent,
                      fontSize: 15.0,
                    ),
                  ),
                ),
              ),
            ],
          ),
          _buildPasswordInput(context),
          Container(
            height: 12.0,
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(left: 40.0),
                  child: Text(
                    "确认密码",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.redAccent,
                      fontSize: 15.0,
                    ),
                  ),
                ),
              ),
            ],
          ),
          _buildRepasswordInput(context),
          Container(
            height: 12.0,
          ),
          _buildLoginTip(context),
          _buildRegisterButton(context),
        ],
      ),
    );
  }

  Container _buildRegisterButton(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.only(left: 30.0, right: 30.0, top: 40.0),
      alignment: Alignment.center,
      child: Row(
        children: <Widget>[
          Expanded(
            child: FlatButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0),
              ),
              color: Colors.redAccent,
              onPressed: () {
                String username = _userController.text;
                String password = _passController.text;
                String repass = _repassController.text;
                if (username.isEmpty) {
                  ToastUtils.showSnack(context, '用户名不能为空！');
                  return;
                }
                if (password != repass) {
                  ToastUtils.showSnack(context, '两次输入的密码好像不一致哦~');
                  return;
                }
                widget.signup(username, password);
              },
              child: Container(
                padding: EdgeInsets.symmetric(
                  vertical: 15.0,
                  horizontal: 20.0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      child: Text(
                        "注  册",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 17,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Row _buildLoginTip(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(right: 20.0),
          child: FlatButton(
            child: Text(
              "已有账号？立即登录！",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.redAccent,
                fontSize: 15.0,
              ),
              textAlign: TextAlign.end,
            ),
            onPressed: widget.onGoLogin,
          ),
        ),
      ],
    );
  }

  Container _buildRepasswordInput(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.only(left: 40.0, right: 40.0, top: 6.0),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
              color: Colors.redAccent, width: 0.5, style: BorderStyle.solid),
        ),
      ),
      padding: EdgeInsets.only(left: 0.0, right: 10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: TextField(
              controller: _repassController,
              obscureText: true,
              textAlign: TextAlign.left,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: '*********',
                hintStyle: TextStyle(color: Colors.grey),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container _buildPasswordInput(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.only(left: 40.0, right: 40.0, top: 6.0),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
              color: Colors.redAccent, width: 0.5, style: BorderStyle.solid),
        ),
      ),
      padding: EdgeInsets.only(left: 0.0, right: 10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: TextField(
              controller: _passController,
              obscureText: true,
              textAlign: TextAlign.left,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: '*********',
                hintStyle: TextStyle(color: Colors.grey),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container _buildUsernameInput(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.only(left: 40.0, right: 40.0, top: 6.0),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
              color: Colors.redAccent, width: 0.5, style: BorderStyle.solid),
        ),
      ),
      padding: EdgeInsets.only(left: 0.0, right: 10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: TextField(
              controller: _userController,
              textAlign: TextAlign.left,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'scottwang1996@qq.com',
                hintStyle: TextStyle(color: Colors.grey),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
