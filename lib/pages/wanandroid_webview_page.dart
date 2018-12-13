import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class WanAndroidWebViewPage extends StatefulWidget {
  final String target;
  final String title;

  const WanAndroidWebViewPage({Key key, @required this.target, this.title})
      : super(key: key);

  @override
  _WanAndroidWebViewPageState createState() => _WanAndroidWebViewPageState();
}

class _WanAndroidWebViewPageState extends State<WanAndroidWebViewPage> {
  @override
  Widget build(BuildContext context) {
    return WebviewScaffold(
      url: widget.target,
      appBar: new AppBar(
        title: Text(widget.title),
      ),
      withZoom: true,
      withLocalStorage: true,
      hidden: true,
      initialChild: Container(
        color: Colors.redAccent,
        child: const Center(
          child: Text('Waiting.....'),
        ),
      ),
    );
  }
}
