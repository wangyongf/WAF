import 'package:daily_purify/util/divider_helper.dart';
import 'package:daily_purify/widget/unify_setting_widget.dart';
import 'package:daily_purify/widget/universal_alert_dialog.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

/// TODO: 实现一个挖财宝标题栏式的布局
/// TODO: 实现选择本地相册更新头像的功能
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
          List<String> items = [
            "从头像库选一张",
            "拍一张照片",
            "从相册选一张",
            "随机选择？！！",
            "我的世界"
          ];
          return UniversalAlertDialog<String>(
            title: Container(
              color: Colors.black12,
              child: Row(
                children: <Widget>[
                  SizedBox(
                    width: 47,
                    height: 47,
                    child: Container(),
                  ),
                  Expanded(
                      child: Center(
                          child: Text(
                    '选择头像',
                    style: TextStyle(color: Colors.black, fontSize: 18),
                  ))),
                  SizedBox(
                    width: 47,
                    height: 47,
                    child: InkWell(
                      child: Icon(Icons.close),
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  )
                ],
              ),
            ),
            titlePadding: const EdgeInsets.all(0),
            divider: DividerHelper.get(),
            initialValue: "我的世界",
            items: items,
            itemBuilder: (context, item) {
              return InkWell(
                onTap: () {
                  Fluttertoast.showToast(msg: item);
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    DividerHelper.get(),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 15, top: 12, bottom: 12),
                      child: Text(
                        item,
                        style: TextStyle(color: Colors.black, fontSize: 18),
                      ),
                    ),
                    DividerHelper.get()
                  ],
                ),
              );
            },
            actions: <Widget>[],
          );
        });
  }

  /// 点击了「昵称」
  void _onClickNickname() {}

  /// 点击了「账号」
  void _onClickAccount() {
    Fluttertoast.showToast(msg: 'nothing happened.');
  }
}
