import 'package:flutter/material.dart';

class EmptyHolder extends StatelessWidget {
  final String msg;

  const EmptyHolder({Key key, this.msg}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(msg ?? "加载中..."),
    );
  }
}
