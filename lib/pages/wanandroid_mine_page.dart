import 'package:flutter/material.dart';

class WanAndroidMinePage extends StatefulWidget {
  @override
  _WanAndroidMinePageState createState() => _WanAndroidMinePageState();
}

class _WanAndroidMinePageState extends State<WanAndroidMinePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('我的'),
        centerTitle: true,
      ),
    );
  }
}
