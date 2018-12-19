import 'package:daily_purify/util/divider_helper.dart';
import 'package:daily_purify/widget/unify_setting_widget.dart';
import 'package:flutter/material.dart';
import 'package:package_info/package_info.dart';

class WanAndroidAboutPage extends StatefulWidget {
  @override
  _WanAndroidAboutPageState createState() => _WanAndroidAboutPageState();
}

class _WanAndroidAboutPageState extends State<WanAndroidAboutPage> {
  String _version = "";

  @override
  void initState() {
    super.initState();

    _getAppInfo();
  }

  _getAppInfo() {
    PackageInfo.fromPlatform().then((PackageInfo packageInfo) {
//      String appName = packageInfo.appName;
//      String packageName = packageInfo.packageName;
//      String buildNumber = packageInfo.buildNumber;
      String version = packageInfo.version;

      setState(() {
        this._version = version;
      });
    });
  }

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
        title: Text('关于'),
      ),
      body: _buildBody(),
    );
  }

  _buildBody() {
    return Container(
      color: Color(0x0D000000),
      child: Column(
        children: <Widget>[
          _buildAppIcon(),
          _buildAppVersion(),
          _buildCheckUpdate(),
          DividerHelper.get(),
          _buildAboutWanAndroid(),
          DividerHelper.get(),
          _buildRating(),
          DividerHelper.get(),
          _buildShareWanAndroid(),
          DividerHelper.get(),
          _buildWanAndroid()
        ],
      ),
    );
  }

  _buildAppIcon() {
    return Container(
      margin: EdgeInsets.only(top: 50),
      alignment: Alignment.center,
      child: Container(
        width: 70,
        height: 70,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.asset(
            'assets/images/mountains.jpg',
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  _buildAppVersion() {
    return Container(
      margin: EdgeInsets.only(top: 8),
      alignment: Alignment.center,
      child: Text(
        _version,
        style: TextStyle(color: Colors.grey, fontSize: 12),
      ),
    );
  }

  _buildCheckUpdate() {
    return Container(
      margin: EdgeInsets.only(top: 25),
      child: InkWell(
        onTap: () {},
        child: UnifySettingWidget(
          title: Text(
            '检查更新',
            style: TextStyle(fontSize: 15),
          ),
        ),
      ),
    );
  }

  _buildAboutWanAndroid() {
    return InkWell(
      onTap: () {},
      child: UnifySettingWidget(
        title: Text(
          '关于「玩 Android」',
          style: TextStyle(fontSize: 15),
        ),
      ),
    );
  }

  _buildRating() {
    return InkWell(
      onTap: () {},
      child: UnifySettingWidget(
        title: Text(
          '去应用市场为我们评分',
          style: TextStyle(fontSize: 15),
        ),
      ),
    );
  }

  _buildShareWanAndroid() {
    return InkWell(
      onTap: () {},
      child: UnifySettingWidget(
        title: Text(
          '分享「玩 Android」给好友',
          style: TextStyle(fontSize: 15),
        ),
      ),
    );
  }

  _buildWanAndroid() {
    return Container(
      padding: EdgeInsets.only(top: 10),
      alignment: Alignment.center,
      child: Text(
        '「玩 Android」',
        style: TextStyle(fontSize: 14, color: Colors.grey),
      ),
    );
  }
}
