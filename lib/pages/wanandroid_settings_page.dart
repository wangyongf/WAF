import 'package:daily_purify/common/routes_name.dart';
import 'package:daily_purify/util/divider_helper.dart';
import 'package:daily_purify/util/toast_utils.dart';
import 'package:daily_purify/widget/unify_setting_widget.dart';
import 'package:flutter/material.dart';

class WanAndroidSettingsPage extends StatefulWidget {
  @override
  _WanAndroidSettingsPageState createState() => _WanAndroidSettingsPageState();
}

class _WanAndroidSettingsPageState extends State<WanAndroidSettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back),
        ),
        title: Text('设置'),
      ),
      body: _buildBody(),
    );
  }

  _buildBody() {
    return Container(
      color: Color(0x0D000000),
      child: ListView(
        children: <Widget>[
          DividerHelper.get(),
          _buildTheming(),
          DividerHelper.get(),
          _buildClearCache(),
          DividerHelper.get(),
          _buildPushSetting(),
          DividerHelper.get(),
          _build4GBannerConfig(),
          DividerHelper.get(),
          _buildAutoCheckClipboardConfig(),
          DividerHelper.get(),
          _buildSpace(),
          _buildAbout(),
          DividerHelper.get(),
          _buildSpace(),
        ],
      ),
    );
  }

  _buildSpace() {
    return Container(
      height: 8,
    );
  }

  /// 主题设置
  _buildTheming() {
    var colorList = <Color>[
      Colors.black,
      Colors.blueAccent,
      Colors.lightBlue,
      Colors.lightBlueAccent,
      Colors.deepPurpleAccent,
      Colors.deepOrange,
      Colors.deepOrangeAccent,
      Colors.orange,
      Colors.green,
      Colors.yellow,
      Colors.pink,
      Colors.red,
      Colors.redAccent,
    ];
    return ExpansionTile(
      backgroundColor: Colors.white,
      leading: Icon(Icons.color_lens),
      title: Text(
        '主题',
        style: TextStyle(fontSize: 15),
      ),
      children: <Widget>[
        Container(
          /// TODO: 如何实现？？？
          child: GridView.count(
            crossAxisCount: 6,
            children: colorList.map(_convert).toList(),
          ),
        )
      ],
    );
  }

  Widget _convert(Color color) {
    return Container(
      padding: EdgeInsets.all(2),
      width: 35,
      height: 35,
      color: color,
    );
  }

  /// 清除缓存
  _buildClearCache() {
    return InkWell(
      onTap: () {
        ToastUtils.showToast(context, '清除缓存功能开发中，敬请期待~');
      },
      child: UnifySettingWidget(
        title: Text(
          '清除缓存',
          style: TextStyle(fontSize: 15),
        ),
        trailing: Text(
          '22.99MB',
          style: TextStyle(fontSize: 13, color: Colors.grey),
        ),
      ),
    );
  }

  /// 推送消息设置
  _buildPushSetting() {
    return InkWell(
      onTap: () {
        ToastUtils.showToast(context, '推送消息设置功能开发中，敬请期待~');
      },
      child: UnifySettingWidget(
        title: Text(
          '推送消息设置',
          style: TextStyle(fontSize: 15),
        ),
      ),
    );
  }

  /// 移动网络下首页不显示图片
  _build4GBannerConfig() {
    return UnifySettingWidget(
      title: Text(
        '移动网络下首页不显示图片',
        style: TextStyle(fontSize: 15),
      ),
      trailing: Switch(value: true, onChanged: (bool value) {}),
    );
  }

  /// 自动检查粘贴板
  _buildAutoCheckClipboardConfig() {
    return UnifySettingWidget(
      title: Text(
        '自动检查粘贴板',
        style: TextStyle(fontSize: 15),
      ),
      subTitle: Text(
        '用于自动打开链接',
        style: TextStyle(fontSize: 11, color: Colors.grey),
      ),
      trailing: Switch(value: true, onChanged: (bool value) {}),
    );
  }

  /// 关于
  _buildAbout() {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(Routes.WAN_ANDROID_ABOUT_PAGE);
      },
      child: UnifySettingWidget(
        title: Text(
          '关于',
          style: TextStyle(fontSize: 15),
        ),
      ),
    );
  }
}
