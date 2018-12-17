import 'package:daily_purify/util/divider_helper.dart';
import 'package:daily_purify/widget/unify_setting_widget.dart';
import 'package:flutter/material.dart';

class PasswordManagePage extends StatefulWidget {
  @override
  _PasswordManagePageState createState() => _PasswordManagePageState();
}

class _PasswordManagePageState extends State<PasswordManagePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('密码管理'),
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
      padding: const EdgeInsets.only(top: 10),
      child: Column(
        children: <Widget>[
          UnifySettingWidget(
            header: DividerHelper.get(),
            title: Text(
              "挖财宝令",
              style: TextStyle(fontSize: 15),
            ),
            subTitle: Text(
              "挖财平台的交易核验密码",
              style: TextStyle(fontSize: 13),
            ),
            trailing: Icon(Icons.chevron_right),
          ),
          UnifySettingWidget(
              margin: const EdgeInsets.only(top: 10),
              header: DividerHelper.get(),
              title: Text(
                "手势密码",
                style: TextStyle(fontSize: 15),
              ),
              subTitle: Text(
                "建议设置手势密码，确保手机使用安全",
                style: TextStyle(fontSize: 13),
              ),
              trailing: Switch(value: true, onChanged: (bool value) {})),
          UnifySettingWidget(
            margin: const EdgeInsets.only(top: 10),
            header: DividerHelper.get(),
            title: Text(
              "修改登录密码",
              style: TextStyle(fontSize: 15),
            ),
            trailing: Icon(Icons.chevron_right),
          ),
        ],
      ),
    );
  }
}
