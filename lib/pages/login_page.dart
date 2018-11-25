import 'dart:async';

import 'package:daily_purify/model/menu_model.dart';
import 'package:daily_purify/widget/snackbar_helper.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LoginPageState();
  }
}

class _LoginPageState extends State<LoginPage> {
  GlobalKey<ScaffoldState> registerKey = GlobalKey();

  String _phoneNum = '';

  String _verifyCode = '';

  int _seconds = 0;

  String _verifyStr = '获取验证码';

  Timer _timer;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _cancelTimer();
  }

  _startTimer() {
    _seconds = 10;

    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_seconds == 0) {
        _cancelTimer();
        return;
      }

      _seconds--;
      _verifyStr = '$_seconds(s)';
      setState(() {});
      if (_seconds == 0) {
        _verifyStr = '重新发送';
      }
    });
  }

  _cancelTimer() {
    _timer?.cancel();
  }

  showTips() {
    showModalBottomSheet<void>(
        context: context,
        builder: (BuildContext context) {
          return Container(
              child: Padding(
                  padding: const EdgeInsets.all(32.0),
                  child: Text('没有相关接口，这是一个纯UI界面，提供部分交互体验',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Theme.of(context).accentColor,
                          fontSize: 24.0))));
        });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        key: registerKey,
        backgroundColor: Colors.white,
        body: _buildBody(),
      ),
    );
  }

  Widget _buildBody() {
    return ListView(
      children: <Widget>[
        _buildCustomBar(),
        _buildLabel(),
        _buildPhoneEdit(),
        _buildVerifyCodeEdit(),
        _buildRegisterButton(),
        _buildTips(),
        _buildThirdPartLogin(),
        _buildProtocol(),
      ],
    );
  }

  Widget _buildCustomBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween, //子组件的排列方式为主轴两端对齐
      children: <Widget>[
        InkWell(
          child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Icon(
                Icons.clear,
                size: 26.0,
                color: Colors.grey[700],
              )),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        InkWell(
          child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(
                "密码登录",
                style: TextStyle(fontSize: 16.0, color: Colors.grey[700]),
              )),
          onTap: () {
            showTips();
          },
        ),
      ],
    );
  }

  Widget _buildLabel() {
    return Container(
      margin: const EdgeInsets.only(top: 40.0, bottom: 20.0),
      alignment: Alignment.center,
      child: Text(
        "登录知乎日报，体验更多功能",
        style: TextStyle(fontSize: 24.0),
      ),
    );
  }

  Widget _buildPhoneEdit() {
    var node = FocusNode();
    return Padding(
      padding: const EdgeInsets.only(left: 40.0, right: 40.0),
      child: TextField(
        onChanged: (str) {
          _phoneNum = str;
          setState(() {});
        },
        decoration: InputDecoration(
          hintText: '请输入手机号',
        ),
        maxLines: 1,
        maxLength: 11,
        //键盘展示为号码
        keyboardType: TextInputType.phone,
        //只能输入数字
        inputFormatters: <TextInputFormatter>[
          WhitelistingTextInputFormatter.digitsOnly,
        ],
        onSubmitted: (text) {
          FocusScope.of(context).reparentIfNeeded(node);
        },
      ),
    );
  }

  Widget _buildVerifyCodeEdit() {
    var node = FocusNode();
    Widget verifyCodeEdit = TextField(
      onChanged: (str) {
        _verifyCode = str;
        setState(() {});
      },
      decoration: InputDecoration(
        hintText: '请输入短信验证码',
      ),
      maxLines: 1,
      maxLength: 6,
      //键盘展示为数字
      keyboardType: TextInputType.number,
      //只能输入数字
      inputFormatters: <TextInputFormatter>[
        WhitelistingTextInputFormatter.digitsOnly,
      ],
      onSubmitted: (text) {
        FocusScope.of(context).reparentIfNeeded(node);
      },
    );

    Widget verifyCodeBtn = InkWell(
      onTap: (_seconds == 0)
          ? () {
              setState(() {
                _startTimer();
              });
            }
          : null,
      child: Container(
        alignment: Alignment.center,
        width: 100.0,
        height: 36.0,
        decoration: BoxDecoration(
          border: Border.all(
            width: 1.0,
            color: Colors.blue,
          ),
        ),
        child: Text(
          '$_verifyStr',
          style: TextStyle(fontSize: 14.0),
        ),
      ),
    );

    return Padding(
      padding: const EdgeInsets.only(left: 40.0, right: 40.0, top: 10.0),
      child: Stack(
        children: <Widget>[
          verifyCodeEdit,
          Align(
            alignment: Alignment.topRight,
            child: verifyCodeBtn,
          ),
        ],
      ),
    );
  }

  Widget _buildRegisterButton() {
    return Padding(
      padding: const EdgeInsets.only(left: 40.0, right: 40.0, top: 20.0),
      child: RaisedButton(
        padding: const EdgeInsets.only(top: 12.0, bottom: 12.0),
        color: Colors.blue,
        textColor: Colors.white,
        disabledTextColor: Colors.white,
        disabledColor: Colors.blue[100],
        onPressed: (_phoneNum.isEmpty || _verifyCode.isEmpty)
            ? null
            : () {
                showTips();
              },
        child: Text(
          "马上登录",
          style: TextStyle(fontSize: 16.0),
        ),
      ),
    );
  }

  Widget _buildTips() {
    return Padding(
      padding: const EdgeInsets.only(left: 40.0, right: 40.0, top: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //子组件的排列方式为主轴两端对齐
        children: <Widget>[
          Text(
            "未注册手机验证后自动登录",
            style: TextStyle(fontSize: 14.0, color: Colors.grey[500]),
          ),
          Text(
            "需要帮助",
            style: TextStyle(fontSize: 14.0, color: Colors.blue),
          ),
        ],
      ),
    );
  }

  // 三方登录
  Widget _buildThirdPartLogin() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: menus_login.map((Menu m) {
        return GestureDetector(
          onTap: () {
            switch (m.index) {
              case 0:
                SnakeBarHelper.showSnackBarByKey(registerKey, context, '点击了微信');
                break;
              case 1:
                SnakeBarHelper.showSnackBarByKey(
                    registerKey, context, '点击了新浪微博');
                break;
            }
          },
          child: Padding(
              padding: const EdgeInsets.only(
                  left: 24.0, top: 60.0, bottom: 12.0, right: 24.0),
              child: Image.asset(
                m.icon,
                width: 50.0,
                height: 50.0,
              )),
        );
      }).toList(),
    );
  }

  // 注册协议
  Widget _buildProtocol() {
    return Padding(
      padding: const EdgeInsets.only(
          left: 40.0, right: 40.0, top: 10.0, bottom: 20.0),
      child: Container(
        child: Text.rich(
          TextSpan(
              text: '注册知乎日报代表你已阅读并同意 ',
              style: TextStyle(
                  fontSize: 14.0,
                  color: Colors.grey[500],
                  fontWeight: FontWeight.w400),
              children: [
                TextSpan(
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        SnakeBarHelper.showSnackBarByKey(
                            registerKey, context, '点击了知乎协议');
                      },
                    text: '知乎协议',
                    style: TextStyle(
                      fontSize: 14.0,
                      color: Colors.blue,
                      fontWeight: FontWeight.w400,
                    )),
                TextSpan(
                    text: ' 和 ',
                    style: TextStyle(
                      fontSize: 14.0,
                      color: Colors.grey[500],
                      fontWeight: FontWeight.w400,
                    )),
                TextSpan(
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        SnakeBarHelper.showSnackBarByKey(
                            registerKey, context, '点击了隐私政策');
                      },
                    text: '隐私政策',
                    style: TextStyle(
                      fontSize: 14.0,
                      color: Colors.blue,
                      fontWeight: FontWeight.w400,
                    )),
              ]),
        ),
      ),
    );
  }
}
