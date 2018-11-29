import 'package:flutter/material.dart';

class GuidePage extends StatefulWidget {
  @override
  _GuidePageState createState() => _GuidePageState();
}

class _GuidePageState extends State<GuidePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          child: Icon(Icons.menu),
          onTap: () {},
        ),
        title: Text('Guide Page'),
        centerTitle: true,
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                  child: Container(
                child: RaisedButton(
                  padding: const EdgeInsets.only(top: 15, bottom: 15),
                  onPressed: _gotoWancaiLoginPage,
                  child: Text('万财登录页'),
                ),
              )),
              Expanded(
                  child: Container(
                margin: const EdgeInsets.only(left: 8),
                child: RaisedButton(
                  padding: const EdgeInsets.only(top: 15, bottom: 15),
                  onPressed: _gotoWancaibaoSettingPage,
                  child: Text('万财账号设置页'),
                ),
              )),
            ],
          ),
          Row(
            children: <Widget>[
              Expanded(
                  child: Container(
                margin: const EdgeInsets.only(top: 8),
                child: RaisedButton(
                  padding: const EdgeInsets.only(top: 15, bottom: 15),
                  onPressed: _gotoWancaibaoAboutPage,
                  child: Text('关于万财宝'),
                ),
              )),
              Expanded(
                  child: Container(
                margin: const EdgeInsets.only(left: 8, top: 8),
                child: RaisedButton(
                  padding: const EdgeInsets.only(top: 15, bottom: 15),
                  onPressed: _gotoWancaibaoFeedbackPage,
                  child: Text('帮助与反馈页面'),
                ),
              )),
            ],
          ),
          Row(
            children: <Widget>[
              Expanded(
                  child: Container(
                      margin: const EdgeInsets.only(top: 8),
                      child: RaisedButton(
                        onPressed: _gotoWancaibaoMorePage,
                        padding: EdgeInsets.only(top: 15, bottom: 15),
                        child: Text('更多页面'),
                      ))),
              Expanded(
                  child: Container(
                margin: const EdgeInsets.only(left: 8, top: 8),
                child: RaisedButton(
                  onPressed: _gotoWancaibaoPasswordManage,
                  padding: EdgeInsets.only(top: 15, bottom: 15),
                  child: Text('密码管理'),
                ),
              ))
            ],
          ),
          Row(
            children: <Widget>[
              Expanded(
                  child: Container(
                      margin: const EdgeInsets.only(top: 8),
                      child: RaisedButton(
                        onPressed: _gotoWancaibaoAccountInfo,
                        padding: EdgeInsets.only(top: 15, bottom: 15),
                        child: Text('账号信息'),
                      ))),
              Expanded(
                  child: Container(
                margin: const EdgeInsets.only(left: 8, top: 8),
                child: RaisedButton(
                  onPressed: () {},
                  padding: EdgeInsets.only(top: 15, bottom: 15),
                  child: Text('something'),
                ),
              ))
            ],
          ),
        ],
      ),
    );
  }

  /// 进入万财宝登录页
  void _gotoWancaiLoginPage() {
    Navigator.pushNamed(context, '/wancaibao/login');
  }

  /// 进入万财宝账号设置页
  void _gotoWancaibaoSettingPage() {
    Navigator.pushNamed(context, '/wancaibao/settings');
  }

  /// 进入「关于万财宝」
  void _gotoWancaibaoAboutPage() {
    Navigator.pushNamed(context, '/wancaibao/about');
  }

  /// 帮助与反馈页面
  void _gotoWancaibaoFeedbackPage() {
    Navigator.pushNamed(context, '/wancaibao/feedback');
  }

  /// 更多页面
  void _gotoWancaibaoMorePage() {
    Navigator.pushNamed(context, '/wancaibao/more');
  }

  /// 账户信息页
  void _gotoWancaibaoAccountInfo() {
    Navigator.pushNamed(context, '/wancaibao/account-info');
  }

  /// 密码管理
  void _gotoWancaibaoPasswordManage() {
    Navigator.pushNamed(context, '/wancaibao/password-manage');
  }
}
