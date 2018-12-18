import 'package:daily_purify/common/routes_name.dart';
import 'package:daily_purify/manager/user_manager.dart';
import 'package:daily_purify/util/divider_helper.dart';
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
      child: Column(
        children: <Widget>[
          DividerHelper.get(),
          _buildEmail(),
          DividerHelper.get(),
          _buildPhone(),
          DividerHelper.get(),
          _buildModifyPassword(),
          DividerHelper.get(),
          _buildSpace(),
          DividerHelper.get(),
          _buildSinaBind(),
          DividerHelper.get(),
          _buildWechatBind(),
          DividerHelper.get(),
          _buildGithubBind(),
          DividerHelper.get(),
          _buildSpace(),
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
          DividerHelper.get(),
          _buildLogout(),
          DividerHelper.get(),
        ],
      ),
    );
  }

  _buildSpace() {
    return Container(
      height: 8,
    );
  }

  /// 邮箱
  _buildEmail() {
    return UnifySettingWidget(
      title: Text(
        '邮箱',
        style: TextStyle(fontSize: 15),
      ),
      content: Text(
        '1059613472@qq.com',
        style: TextStyle(fontSize: 13, color: Colors.grey),
      ),
    );
  }

  /// 手机号
  _buildPhone() {
    return UnifySettingWidget(
      title: Text(
        '手机号',
        style: TextStyle(fontSize: 15),
      ),
      content: Text(
        '110-111-112-113',
        style: TextStyle(fontSize: 13, color: Colors.grey),
      ),
    );
  }

  /// 修改账户密码
  _buildModifyPassword() {
    return UnifySettingWidget(
        title: Text(
      '修改账户密码',
      style: TextStyle(fontSize: 15),
    ));
  }

  /// 绑定新浪微博
  _buildSinaBind() {
    return UnifySettingWidget(
      title: Text('绑定新浪微博',
          style: TextStyle(
            fontSize: 15,
          )),
      content: Text(
        'yongf2015',
        style: TextStyle(fontSize: 13, color: Colors.grey),
      ),
      trailing: Switch(value: true, onChanged: (bool value) {}),
    );
  }

  /// 微信绑定
  _buildWechatBind() {
    return UnifySettingWidget(
      title: Text('绑定微信',
          style: TextStyle(
            fontSize: 15,
          )),
      content: Text(
        '小拓先森',
        style: TextStyle(fontSize: 13, color: Colors.grey),
      ),
      trailing: Switch(value: true, onChanged: (bool value) {}),
    );
  }

  /// 绑定 Github
  _buildGithubBind() {
    return UnifySettingWidget(
      title: Text('绑定 Github',
          style: TextStyle(
            fontSize: 15,
          )),
      content: Text(
        '',
        style: TextStyle(fontSize: 13, color: Colors.grey),
      ),
      trailing: Switch(value: true, onChanged: (bool value) {}),
    );
  }

  /// 清除缓存
  _buildClearCache() {
    return UnifySettingWidget(
      title: Text(
        '推送消息设置',
        style: TextStyle(fontSize: 15),
      ),
      trailing: Text(
        '22.99MB',
        style: TextStyle(fontSize: 13, color: Colors.grey),
      ),
    );
  }

  /// 推送消息设置
  _buildPushSetting() {
    return UnifySettingWidget(
      title: Text(
        '推送消息设置',
        style: TextStyle(fontSize: 15),
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

  /// 退出登录
  _buildLogout() {
    return InkWell(
      onTap: _showLogoutDialog,
      child: Container(
        height: 52,
        color: Colors.white,
        alignment: Alignment.center,
        child: Text(
          '退出登录',
          style: TextStyle(fontSize: 16, color: Colors.redAccent),
        ),
      ),
    );
  }

  _showLogoutDialog() {
    showDialog(
        context: context,
        child: AlertDialog(
          title: Text(
            '安全退出',
            style: TextStyle(fontSize: 14),
          ),
          content: Text(
            '退出当前账号，下次登录时依然可以使用本账号。',
            style: TextStyle(color: Colors.grey, fontSize: 13),
          ),
          actions: <Widget>[
            FlatButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('取消')),
            FlatButton(onPressed: _logout, child: Text('确定'))
          ],
        ));
  }

  /// 退出登录
  /// TODO: pop 两次来实现关闭对话框和页面？
  _logout() {
    UserManager().logout();
    Navigator.of(context).pop();
    Navigator.of(context).pop();
  }
}
