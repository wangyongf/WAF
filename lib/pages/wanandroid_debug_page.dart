import 'package:daily_purify/util/divider_helper.dart';
import 'package:daily_purify/util/sp_utils.dart';
import 'package:daily_purify/widget/unify_setting_widget.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WanAndroidDebugPage extends StatefulWidget {
  @override
  _WanAndroidDebugPageState createState() => _WanAndroidDebugPageState();
}

class _WanAndroidDebugPageState extends State<WanAndroidDebugPage> {
  static const String ENABLE_DIO_PROXY = "enableDioProxy";
  bool enableDioProxy = false;

  @override
  void initState() {
    super.initState();

    _fetchConfig();
  }

  _fetchConfig() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      this.enableDioProxy = prefs.getBool('enableDioProxy') ?? false;
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
        title: Text('玩 Android 开发配置'),
        centerTitle: true,
      ),
      body: _buildBody(),
    );
  }

  _buildBody() {
    return ListView(
      children: <Widget>[
        DividerHelper.get(),
        UnifySettingWidget(
          title: Text(
            'Dio 代理配置',
            style: TextStyle(fontSize: 15),
          ),
          trailing: Switch(value: enableDioProxy, onChanged: _dioProxy),
        ),
        DividerHelper.get()
      ],
    );
  }

  _dioProxy(bool value) async {
    setState(() {
      this.enableDioProxy = value;
    });
    await SpUtils.putBool(ENABLE_DIO_PROXY, value);
  }
}
