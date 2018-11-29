import 'package:daily_purify/util/divider_helper.dart';
import 'package:daily_purify/widget/unify_setting_widget.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AccountInfoPage extends StatefulWidget {
  @override
  _AccountInfoPageState createState() => _AccountInfoPageState();
}

class _AccountInfoPageState extends State<AccountInfoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('账户信息'),
        centerTitle: true,
        leading: InkWell(
          onTap: () {},
          child: Icon(Icons.arrow_back),
        ),
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Container(
      color: const Color(0xFFF6F6F6),
      margin: const EdgeInsets.only(top: 10),
      child: Column(
        children: <Widget>[
          GestureDetector(
            onTap: _onClickAvatar,
            child: UnifySettingWidget(
              header: DividerHelper.get(),
              title: "头像",
              trailingStatus: CircleAvatar(
                radius: 15,
                backgroundImage: AssetImage('images/appbar_def_bg.jpeg'),
              ),
              trailing: Icon(Icons.chevron_right),
            ),
          ),
          GestureDetector(
            onTap: _onClickNickname,
            child: UnifySettingWidget(
              title: "昵称",
              trailingStatus: Text(
                '霸者赤魂',
                style: TextStyle(fontSize: 15),
              ),
              trailing: Icon(Icons.chevron_right),
            ),
          ),
          GestureDetector(
            onTap: _onClickAccount,
            child: UnifySettingWidget(
              title: '挖财账号',
              trailingStatus: Text(
                '霸者丿赤魂',
                style: TextStyle(fontSize: 15),
              ),
            ),
          )
        ],
      ),
    );
  }

  /// 点击了「头像」
  void _onClickAvatar() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return SimpleDialog(
            title: Text(
              '选择头像',
              style: TextStyle(fontSize: 15, color: Colors.black),
            ),
            children: <Widget>[
              SimpleDialogOption(
                onPressed: () {
                  Fluttertoast.showToast(msg: 'Option One');
                },
                child: Text('从头像库选一张'),
              ),
              SimpleDialogOption(
                onPressed: () {
                  Fluttertoast.showToast(msg: 'Option Two');
                },
                child: Text('拍一张照片'),
              ),
              SimpleDialogOption(
                onPressed: () {
                  Fluttertoast.showToast(msg: 'Option Three');
                },
                child: Text('从相册选一张'),
              ),
            ],
          );
        });

    /// TODO: 实现挖财宝的对话框~
  }

  /// 点击了「昵称」
  void _onClickNickname() {}

  /// 点击了「账号」
  void _onClickAccount() {
    Fluttertoast.showToast(msg: 'nothing happened.');
  }
}
