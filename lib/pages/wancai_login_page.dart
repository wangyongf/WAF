import 'package:daily_purify/widget/snackbar_helper.dart';
import 'package:flutter/material.dart';

class WancaiLoginPage extends StatefulWidget {
  @override
  _WancaiLoginPageState createState() => _WancaiLoginPageState();
}

class _WancaiLoginPageState extends State<WancaiLoginPage> {
  GlobalKey<ScaffoldState> _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      backgroundColor: Colors.white,
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return ListView(
      children: <Widget>[
        _buildTitleBar(),
        _buildWelcomeToWacaiBao(),
        _buildWacaiLoginButton(),
        _buildRegisterButton(),
        _buildThirdLogin(),
      ],
    );
  }

  // 标题部分
  Widget _buildTitleBar() {
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            InkWell(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Icon(
                  Icons.arrow_back,
                  size: 26.0,
                  color: Colors.blueAccent,
                ),
              ),
              onTap: () {
                SnackBarHelper.showSnackBarByKey(_key, context, '点击了返回');
              },
            ),
            Text(
              '登录',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 18.0,
                  fontWeight: FontWeight.w500),
            ),
            // TODO: 这种实现居中的效果有点蠢。。。
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Opacity(
                opacity: 0,
                child: Icon(
                  Icons.arrow_back,
                  size: 26.0,
                  color: Colors.blueAccent,
                ),
              ),
            )
          ],
        ),
        Divider(
          height: 2.0,
          color: Colors.black26,
        )
      ],
    );
  }

  // 「欢迎来到挖财宝」部分
  Widget _buildWelcomeToWacaiBao() {
    return Container(
        margin: const EdgeInsets.only(top: 55.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              '欢迎来到挖财宝',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.redAccent,
                  fontSize: 23,
                  fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Text(
                '梦想与财富，我们与您一同追逐',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.black38,
                    fontSize: 16,
                    fontWeight: FontWeight.w500),
              ),
            )
          ],
        ));
  }

  // 挖财账号登录
  Widget _buildWacaiLoginButton() {
    return Container(
      margin: const EdgeInsets.only(top: 55, left: 20, right: 20),
      child: RaisedButton(
        padding: const EdgeInsets.only(top: 12, bottom: 12),
        onPressed: () {},
        child: Text(
          '挖财账号登录',
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
        color: Colors.redAccent,
      ),
    );
  }

  // 新用户注册
  Widget _buildRegisterButton() {
    return Container(
      margin: const EdgeInsets.only(top: 20, left: 20, right: 20),
      child: OutlineButton(
          onPressed: () {},
          padding: const EdgeInsets.only(top: 12, bottom: 12),
          borderSide: BorderSide(color: Colors.redAccent),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                Icons.card_giftcard,
                size: 26,
                color: Colors.redAccent,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Text(
                  '新用户注册',
                  style: TextStyle(color: Colors.redAccent, fontSize: 18),
                ),
              )
            ],
          )),
    );
  }

  // 三方登录部分
  Widget _buildThirdLogin() {
    return Container(
      margin: const EdgeInsets.only(top: 150, left: 20, right: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Expanded(
                child: Container(
                  height: 0.5,
                  foregroundDecoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [Colors.transparent, Colors.black38])),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 12, right: 12),
                child: Text(
                  '其他方式登录',
                  style: TextStyle(
                      color: Colors.black38,
                      fontSize: 15,
                      fontWeight: FontWeight.w600),
                ),
              ),
              Expanded(
                child: Container(
                  height: 0.5,
                  foregroundDecoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [Colors.black38, Colors.transparent])),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20, bottom: 30),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    SnackBarHelper.showSnackBarByKey(_key, context, '点击了QQ登录');
                  },
                  child: Image.asset(
                    'images/icon_msg.png',
                    width: 45,
                    height: 45,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    SnackBarHelper.showSnackBarByKey(_key, context, '点击了微信登录');
                  },
                  child: Image.asset(
                    'images/icon_wx.png',
                    width: 45,
                    height: 45,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    SnackBarHelper.showSnackBarByKey(_key, context, '点击了微博登录');
                  },
                  child: Image.asset(
                    'images/icon_sina.png',
                    width: 45,
                    height: 45,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
