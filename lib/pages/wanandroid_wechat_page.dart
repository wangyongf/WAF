import 'package:flutter/material.dart';

class WanAndroidWechatPage extends StatefulWidget {
  @override
  _WanAndroidWechatPageState createState() => _WanAndroidWechatPageState();
}

class _WanAndroidWechatPageState extends State<WanAndroidWechatPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('公众号'),
        centerTitle: true,
      ),
    );
  }
}
