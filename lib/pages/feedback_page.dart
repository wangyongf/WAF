import 'package:flutter/material.dart';

class FeedbackPage extends StatefulWidget {
  @override
  _FeedbackPageState createState() => _FeedbackPageState();
}

class _FeedbackPageState extends State<FeedbackPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('意见反馈'),
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
      child: Column(
        children: <Widget>[
          Container(
            alignment: Alignment.bottomLeft,
            padding: const EdgeInsets.only(left: 15, top: 23, bottom: 10),
            child: Text(
              '感谢您对万财宝的支持，我们期待您的宝贵意见',
              style: TextStyle(
                  fontSize: 13,
                  background: Paint()..color = (const Color(0xFFF6F6F6))),
            ),
          ),
          Divider(
            height: 1,
            color: const Color(0xFFDCDCDC),
          ),
          Container(
            color: Colors.white,
            padding: const EdgeInsets.only(top: 10, bottom: 10),
            child: TextField(
              keyboardType: TextInputType.multiline,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.all(10),
                  hintText: '请在此输入您的意见',
                  hintStyle: TextStyle(fontSize: 14, color: Colors.grey)),
              autofocus: true,
              maxLength: 500,
              maxLengthEnforced: true,
              maxLines: null,
            ),
          ),
          Divider(
            height: 1,
            color: const Color(0xFFDCDCDC),
          ),
          Container(
            alignment: Alignment.bottomLeft,
            color: const Color(0xF6F6F6),
            padding: const EdgeInsets.only(left: 15, top: 20, bottom: 10),
            child: Text(
              '联系方式',
              style: TextStyle(fontSize: 13, color: Colors.black),
            ),
          ),
          Divider(
            height: 1,
            color: const Color(0xFFDCDCDC),
          ),
          Container(
            color: Colors.white,
            padding: const EdgeInsets.only(top: 4, bottom: 4),
            child: TextField(
              maxLines: 1,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.all(10),
                  hintStyle: TextStyle(fontSize: 14, color: Colors.grey),
                  hintText: '请输入便于联系的邮箱地址',
                  fillColor: Colors.white),
            ),
          ),
          Divider(
            height: 1,
            color: const Color(0xFFDCDCDC),
          ),
          Container(
            width: double.infinity,
            margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
            child: RaisedButton(
              padding: const EdgeInsets.only(top: 15, bottom: 15),
              color: Colors.redAccent,
              onPressed: () {},
              child: Text(
                '确定',
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
          ),
          Container(), // TODO: 虚线如何实现？
          Container(
            margin: const EdgeInsets.only(top: 40),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(
                  Icons.phone,
                  size: 13,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 5),
                  child: Text(
                    '客服电话',
                    style: TextStyle(fontSize: 13, color: Colors.black),
                  ),
                ),
                Text(
                  '(工作日 9:00-18:00)',
                  style: TextStyle(fontSize: 13, color: Colors.black26),
                ),
              ],
            ),
          ),
          Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.only(top: 10),
            child: Text(
              '400-711-8718',
              style: TextStyle(fontSize: 17, color: Colors.blue),
            ),
          ),
        ],
      ),
    );
  }
}
