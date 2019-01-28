import 'package:daily_purify/util/toast_utils.dart';
import 'package:flutter/material.dart';

typedef OnLogin(String username, String password);

class WanAndroidLoginPage extends StatefulWidget {
  final OnLogin login;

  const WanAndroidLoginPage({Key key, @required this.login}) : super(key: key);

  @override
  _WanAndroidLoginPageState createState() => _WanAndroidLoginPageState();
}

class _WanAndroidLoginPageState extends State<WanAndroidLoginPage> {
  TextEditingController _userController = TextEditingController();
  TextEditingController _passController = TextEditingController();

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
            padding: EdgeInsets.only(top: 80.0, bottom: 50),
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
            height: 20.0,
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
          _buildFindPwd(context),
          _buildLoginButton(context),
          _buildThirdLoginTitle(context),
          _buildThirdLoginButton(context)
        ],
      ),
    );
  }

  Container _buildThirdLoginButton(BuildContext context) {
    return Container(
          width: MediaQuery.of(context).size.width,
          margin: EdgeInsets.only(left: 30.0, right: 30.0, top: 12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              _buildFackbookLoginBtn(context),
              _buildGoogleLoginBtn(context)
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
                  color: Colors.redAccent,
                  width: 0.5,
                  style: BorderStyle.solid),
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
                  color: Colors.redAccent,
                  width: 0.5,
                  style: BorderStyle.solid),
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

  Container _buildThirdLoginTitle(BuildContext context) {
    return Container(
          width: MediaQuery.of(context).size.width,
          margin: EdgeInsets.only(left: 30.0, right: 30.0, top: 56.0),
          alignment: Alignment.center,
          child: Row(
            children: <Widget>[
              Expanded(
                child: Container(
                  margin: EdgeInsets.all(8.0),
                  decoration: BoxDecoration(border: Border.all(width: 0.25)),
                ),
              ),
              Text(
                "三方登录",
                style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.all(8.0),
                  decoration: BoxDecoration(border: Border.all(width: 0.25)),
                ),
              ),
            ],
          ),
        );
  }

  Container _buildLoginButton(BuildContext context) {
    return Container(
          width: MediaQuery.of(context).size.width,
          margin: EdgeInsets.only(left: 30.0, right: 30.0, top: 20.0),
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
                    widget.login(username, password);
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
                            "立即登录",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 16,
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

  Row _buildFindPwd(BuildContext context) {
    return Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: FlatButton(
                child: Text(
                  "找回密码",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.redAccent,
                    fontSize: 15.0,
                  ),
                  textAlign: TextAlign.end,
                ),
                onPressed: () {
                  ToastUtils.showToast(context, '找回密码功能开发中，敬请期待~');
                },
              ),
            ),
          ],
        );
  }

  _buildFackbookLoginBtn(BuildContext context) {
    return FlatButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      color: Color(0Xff3B5998),
      onPressed: () {
        ToastUtils.showToast(context, '三方登录正在路上，敬请期待~');
      },
      child: Container(
        width: 85,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Icon(IconData(0xea90, fontFamily: 'icomoon'),
                color: Colors.white, size: 12),
            Text("Facebook",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }

  _buildGoogleLoginBtn(BuildContext context) {
    return FlatButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      color: Color(0Xffdb3236),
      onPressed: () {
        ToastUtils.showToast(context, '三方登录正在路上，敬请期待~');
      },
      child: Container(
        width: 85,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Icon(IconData(0xea88, fontFamily: 'icomoon'),
                color: Colors.white, size: 12),
            Text("Google",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}
