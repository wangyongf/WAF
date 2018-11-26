import 'package:daily_purify/model/setting_model.dart';
import 'package:daily_purify/widget/snackbar_helper.dart';
import 'package:flutter/material.dart';

class AccountSettingPage extends StatefulWidget {
  @override
  _AccountSettingPageState createState() => _AccountSettingPageState();
}

class _AccountSettingPageState extends State<AccountSettingPage> {
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
    return ListView.builder(
        itemCount: settings.length,
        itemBuilder: (context, index) {
          switch (settings[index].type) {
            case SettingItemType.Setting:
              return _buildSettingItem(index);
            case SettingItemType.Title:
              return _buildTitleBar();
            case SettingItemType.Divider:
              return _buildDivider();
            case SettingItemType.Space:
              return _buildSpace();
          }
        });
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

  // 设置项
  Widget _buildSettingItem(int index) {
    return Container(
      height: 48,
      margin: const EdgeInsets.only(left: 20, right: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          _getSettingItemLeading(index),
          _getSettingItemTitle(index),
          Expanded(child: Container()),
          _getSettingItemTrailing(index),
        ],
      ),
    );
  }

  Widget _getSettingItemTrailing(int index) => settings[index].trailing;

  Widget _getSettingItemTitle(int index) => settings[index].title.isNotEmpty
      ? Text(
          settings[index].title,
          style: TextStyle(fontSize: 15),
        )
      : null;

  Widget _getSettingItemLeading(int index) {
    if (settings[index].leading != null) {
      return Padding(
        padding: const EdgeInsets.only(right: 8),
        child: settings[index].leading,
      );
    } else {
      return Container();
    }
  }

  // 分割线
  Widget _buildDivider() {
    return Divider(
      height: 1,
      color: const Color(0xFFDCDCDC),
    );
  }

  Widget _buildSpace() {
    return Container(
      margin: const EdgeInsets.all(0),
      height: 10,
      decoration: BoxDecoration(
          color: Color(0xFFF6F6F6),
          border: Border(
              top: BorderSide(width: 0.3, color: const Color(0xFFDCDCDC)),
              bottom: BorderSide(width: 0.3, color: const Color(0xFFDCDCDC)))),
    );
  }
}
