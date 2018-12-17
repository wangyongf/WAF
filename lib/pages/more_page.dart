import 'package:daily_purify/util/divider_helper.dart';
import 'package:daily_purify/widget/unify_setting_widget.dart';
import 'package:flutter/material.dart';

class MorePage extends StatefulWidget {
  @override
  _MorePageState createState() => _MorePageState();
}

class _MorePageState extends State<MorePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('更多'),
        centerTitle: true,
        leading: InkWell(
          child: Icon(Icons.arrow_back),
        ),
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Container(
      padding: const EdgeInsets.only(top: 12),
      color: const Color(0xFFF6F6F6),
      child: Column(
        children: <Widget>[
          UnifySettingWidget(
            header: DividerHelper.get(),
            title: Text(
              "精选发现更新提醒",
              style: TextStyle(fontSize: 15),
            ),
            trailing: Checkbox(value: true, onChanged: (bool value) {}),
          ),
          Container(
            padding:
                const EdgeInsets.only(top: 12, bottom: 12, left: 20, right: 20),
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            alignment: Alignment.center,
            child: Text(
              '关闭后，有精选发现更新内容时，界面下面的发现切换按钮不再出现红点提示',
              style: TextStyle(fontSize: 11, color: Colors.grey),
            ),
          ),
          DividerHelper.get(),
          UnifySettingWidget(
            margin: const EdgeInsets.only(top: 20),
            header: DividerHelper.get(),
            title: Text(
              '法律协议',
              style: TextStyle(fontSize: 15),
            ),
            trailing: Icon(Icons.chevron_right),
          ),
          UnifySettingWidget(
            margin: const EdgeInsets.only(top: 10),
            header: DividerHelper.get(),
            title: Text(
              "挖财隐私权政策",
              style: TextStyle(fontSize: 15),
            ),
            trailing: Icon(Icons.chevron_right),
          ),
          UnifySettingWidget(
            margin: const EdgeInsets.only(top: 10),
            header: DividerHelper.get(),
            title: Text(
              "更多挖财 App",
              style: TextStyle(fontSize: 15),
            ),
            trailing: Icon(Icons.chevron_right),
          ),
        ],
      ),
    );
  }
}
