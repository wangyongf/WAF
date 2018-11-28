import 'package:daily_purify/model/unify_setting_model.dart';
import 'package:daily_purify/widget/unify_setting_widget.dart';
import 'package:flutter/material.dart';

class AboutWancaibaoPage extends StatefulWidget {
  @override
  _AboutWancaibaoPageState createState() => _AboutWancaibaoPageState();
}

class _AboutWancaibaoPageState extends State<AboutWancaibaoPage> {
  GlobalKey<ScaffoldState> _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      appBar: AppBar(
        leading: InkWell(
          child: Icon(Icons.arrow_back),
          onTap: () {},
        ),
        title: Text('关于挖财宝'),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Column(
      children: <Widget>[
        Container(
          padding: const EdgeInsets.only(top: 25, bottom: 25),
          decoration: BoxDecoration(
              border: const Border(
                  bottom:
                      BorderSide(color: const Color(0xFF697588), width: 0.2))),
          child: Center(
              child: Column(
            children: <Widget>[
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('images/appbar_def_bg.jpeg'),
                        fit: BoxFit.cover),
                    borderRadius: BorderRadius.all(Radius.circular(10))),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10),
                child: Text(
                  '4.23.0',
                  style: TextStyle(fontSize: 13, color: Colors.black54),
                ),
              )
            ],
          )),
        ),
        Expanded(
          child: ListView.builder(
              itemCount: about.length,
              itemBuilder: (context, index) {
                return _buildAboutItem(index);
              }),
        ),
      ],
    );
  }

  Widget _buildAboutItem(int index) {
    return UnifySettingWidget(
      leading: about[index].leading,
      title: about[index].title,
      subTitle: about[index].subTitle,
      content: about[index].content,
      subContent: about[index].subContent,
      trailing: about[index].trailing,
      shortDivider: about[index].shortDivider,
    );
  }
}
