import 'package:daily_purify/data/net/wanandroid_api.dart';
import 'package:daily_purify/util/toast_utils.dart';
import 'package:flutter/material.dart';

class WanAndroidFeedbackPage extends StatefulWidget {
  @override
  _WanAndroidFeedbackPageState createState() => _WanAndroidFeedbackPageState();
}

class _WanAndroidFeedbackPageState extends State<WanAndroidFeedbackPage> {
  var _bodyController = TextEditingController();
  var _titleController = TextEditingController();
  var _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('意见反馈'),
        centerTitle: true,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
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
              '感谢您对我们的支持，期待您的宝贵意见',
              style: TextStyle(
                  fontSize: 13,
                  background: Paint()..color = (const Color(0xFFF6F6F6))),
            ),
          ),
          Divider(
            height: 1,
            color: const Color(0xFFDCDCDC),
          ),
          _buildFeedbackContent(),
          Divider(
            height: 1,
            color: const Color(0xFFDCDCDC),
          ),
          Container(
            alignment: Alignment.bottomLeft,
            color: const Color(0xF6F6F6),
            padding: const EdgeInsets.only(left: 15, top: 20, bottom: 10),
            child: Text(
              '给您的反馈/意见来个标题吧',
              style: TextStyle(fontSize: 13, color: Colors.black),
            ),
          ),
          Divider(
            height: 1,
            color: const Color(0xFFDCDCDC),
          ),
          _buildFeedbackTitle(),
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
          _buildEmail(),
          Divider(
            height: 1,
            color: const Color(0xFFDCDCDC),
          ),
          _buildSubmitButton(),
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

  Container _buildSubmitButton() {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
      child: RaisedButton(
        padding: const EdgeInsets.only(top: 15, bottom: 15),
        color: Colors.redAccent,
        onPressed: () async {
          String body = _bodyController.text.trim();
          String title = _titleController.text.trim();
          String email = _emailController.text.trim();
          if (body.isEmpty) {
            ToastUtils.showToast(context, '请输入反馈内容');
            return;
          }
          if (title.isEmpty) {
            ToastUtils.showToast(context, '请输入反馈标题，便于我们归类问题');
            return;
          }
          await WanAndroidApi().createIssue(title, _formatBody(body, email));
          ToastUtils.showToast(context, '反馈成功，感谢~');
        },
        child: Text(
          '确定',
          style: TextStyle(fontSize: 16, color: Colors.white),
        ),
      ),
    );
  }

  _clearText() {
    _bodyController.text = "";
    _titleController.text = "";
    _emailController.text = "";
  }

  String _formatBody(String body, String email) {
    if (email == null || email.isEmpty) {
      email = "somefeedback@wangyongf.com";
    }
    return "反馈内容：$body\n联系方式：${email.replaceAll('@', '#')}";
  }

  Container _buildEmail() {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.only(top: 4, bottom: 4),
      child: TextField(
        controller: _emailController,
        maxLines: 1,
        decoration: InputDecoration(
            border: InputBorder.none,
            contentPadding: const EdgeInsets.all(10),
            hintStyle: TextStyle(fontSize: 14, color: Colors.grey),
            hintText: '请输入便于联系的邮箱地址',
            fillColor: Colors.white),
      ),
    );
  }

  Container _buildFeedbackTitle() {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.only(top: 4, bottom: 4),
      child: TextField(
        controller: _titleController,
        maxLines: 1,
        decoration: InputDecoration(
            border: InputBorder.none,
            contentPadding: const EdgeInsets.all(10),
            hintStyle: TextStyle(fontSize: 14, color: Colors.grey),
            hintText: '一句话形容~',
            fillColor: Colors.white),
      ),
    );
  }

  Container _buildFeedbackContent() {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.only(top: 10, bottom: 10),
      child: TextField(
        controller: _bodyController,
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
    );
  }
}
