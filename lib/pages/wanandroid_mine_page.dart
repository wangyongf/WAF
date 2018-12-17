import 'package:daily_purify/common/routes_name.dart';
import 'package:daily_purify/manager/user_manager.dart';
import 'package:daily_purify/pages/wanandroid_feedback_page.dart';
import 'package:daily_purify/util/toast_utils.dart';
import 'package:daily_purify/widget/unify_setting_widget.dart';
import 'package:flutter/material.dart';

class WanAndroidMinePage extends StatefulWidget {
  @override
  _WanAndroidMinePageState createState() => _WanAndroidMinePageState();
}

class _WanAndroidMinePageState extends State<WanAndroidMinePage> {
  bool isDarkMode = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('个人中心'),
        centerTitle: true,
      ),
      body: _buildBody(),
    );
  }

  _buildBody() {
    return Container(
      color: Color(0x0D000000),
      child: Column(
        children: <Widget>[
          _buildSpace(),
          _buildUserInfo(),
          _buildSpace(),
          _buildMessageCenter(),
          Divider(height: 0.2, indent: 0, color: Color(0xFFDCDCDC)),
          _buildCollections(),
          Divider(height: 0.2, indent: 0, color: Color(0xFFDCDCDC)),
          _buildReadList(),
          Divider(height: 0.2, indent: 0, color: Color(0xFFDCDCDC)),
          _buildTagManager(),
          _buildSpace(),
          _buildDarkMode(),
          Divider(height: 0.2, indent: 0, color: Color(0xFFDCDCDC)),
          _buildFeedback(),
          Divider(height: 0.2, indent: 0, color: Color(0xFFDCDCDC)),
          _buildSettings(),
        ],
      ),
    );
  }

  /// 用户信息：头像、昵称
  _buildUserInfo() {
    return InkWell(
      onTap: () {
        if (!UserManager().isLogin()) {
          Navigator.of(context).pushNamed(Routes.WAN_ANDROID_LOGIN_PAGE);
        } else {
          ToastUtils.showToast(context, '用户信息页开发中，敬请期待~');
        }
      },
      child: Container(
        color: Colors.white,
        child: UnifySettingWidget(
          padding: EdgeInsets.only(top: 10, bottom: 10),
          leading: CircleAvatar(
            radius: 22,
            backgroundImage: AssetImage('images/appbar_def_bg.jpeg'),
          ),
          title: Text(
            UserManager().isLogin() ? UserManager().userName : '点击登录',
            style: TextStyle(fontSize: 19),
          ),
          subTitle: Text(
            'Android 开发工程师 @AGreatCompany',
            style: TextStyle(fontSize: 11, color: Colors.grey),
          ),
          trailing: Icon(
            Icons.arrow_forward_ios,
            color: Color(0x4D000000),
          ),
        ),
      ),
    );
  }

  _buildSpace() {
    return Container(
      height: 8,
    );
  }

  /// 消息中心
  _buildMessageCenter() {
    return InkWell(
      onTap: () {
        ToastUtils.showToast(context, '功能开发中，敬请期待~');
      },
      child: Container(
        color: Colors.white,
        child: UnifySettingWidget(
          leading: Icon(
            Icons.add_alert,
            size: 20,
            color: Colors.black54,
          ),
          title: Text(
            '消息中心',
            style: TextStyle(fontSize: 15),
          ),
          trailing: Text(
            '10w+',
            style: TextStyle(color: Colors.grey),
          ),
        ),
      ),
    );
  }

  /// 我的收藏
  _buildCollections() {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(Routes.WAN_ANDROID_COLLECTIONS_PAGE);
      },
      child: Container(
        color: Colors.white,
        child: UnifySettingWidget(
          leading: Icon(
            Icons.collections_bookmark,
            size: 20,
            color: Colors.black54,
          ),
          title: Text(
            '我的收藏',
            style: TextStyle(fontSize: 15),
          ),
          trailing: Text(
            '346篇',
            style: TextStyle(color: Colors.grey),
          ),
        ),
      ),
    );
  }

  /// 阅读过的文章
  _buildReadList() {
    return InkWell(
      onTap: () {
        ToastUtils.showToast(context, '功能开发中，敬请期待~');
      },
      child: Container(
        color: Colors.white,
        child: UnifySettingWidget(
          leading: Icon(
            Icons.remove_red_eye,
            size: 20,
            color: Colors.black54,
          ),
          title: Text(
            '已读列表',
            style: TextStyle(fontSize: 15),
          ),
          trailing: Text(
            '3本',
            style: TextStyle(color: Colors.grey),
          ),
        ),
      ),
    );
  }

  /// 标签管理
  _buildTagManager() {
    return InkWell(
      onTap: () {
        ToastUtils.showToast(context, '功能开发中，敬请期待~');
      },
      child: Container(
        color: Colors.white,
        child: UnifySettingWidget(
          leading: Icon(
            Icons.assistant_photo,
            size: 20,
            color: Colors.black54,
          ),
          title: Text(
            '标签管理',
            style: TextStyle(fontSize: 15),
          ),
          trailing: Text(
            '73个',
            style: TextStyle(color: Colors.grey),
          ),
        ),
      ),
    );
  }

  /// 夜间模式
  _buildDarkMode() {
    return InkWell(
      child: Container(
        color: Colors.white,
        child: UnifySettingWidget(
          leading: Icon(
            Icons.lightbulb_outline,
            size: 20,
            color: Colors.black54,
          ),
          title: Text(
            '夜间模式',
            style: TextStyle(fontSize: 15),
          ),
          trailing: Switch(
              value: isDarkMode,
              onChanged: (bool value) {
                setState(() {
                  isDarkMode = value;
                });
              }),
        ),
      ),
    );
  }

  /// 意见反馈
  _buildFeedback() {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => WanAndroidFeedbackPage()));
      },
      child: Container(
        color: Colors.white,
        child: UnifySettingWidget(
          leading: Icon(
            Icons.feedback,
            size: 20,
            color: Colors.black54,
          ),
          title: Text(
            '意见反馈',
            style: TextStyle(fontSize: 15),
          ),
        ),
      ),
    );
  }

  /// 设置
  _buildSettings() {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(Routes.ACCOUNT_INFO_PAGE);
      },
      child: Container(
        color: Colors.white,
        child: UnifySettingWidget(
          leading: Icon(
            Icons.settings,
            size: 20,
            color: Colors.black54,
          ),
          title: Text(
            '设置',
            style: TextStyle(fontSize: 15),
          ),
        ),
      ),
    );
  }
}
