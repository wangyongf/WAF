import 'package:daily_purify/data/net/url_host.dart';
import 'package:daily_purify/data/net/wanandroid_api.dart';
import 'package:daily_purify/util/toast_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class WanAndroidWebViewPage extends StatefulWidget {
  final String target;
  final String title;
  final bool collect;
  final int originId;

  const WanAndroidWebViewPage(
      {Key key, @required this.target, this.title, this.collect, this.originId})
      : super(key: key);

  @override
  _WanAndroidWebViewPageState createState() => _WanAndroidWebViewPageState();
}

class _WanAndroidWebViewPageState extends State<WanAndroidWebViewPage> {
  bool _collect;

  @override
  void initState() {
    super.initState();

    _collect = widget.collect ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return WebviewScaffold(
      url: widget.target,
      appBar: AppBar(
        title: Text(widget.title),
        actions: <Widget>[
          InkWell(
            onTap: () async {
              bool newStatus = !_collect;
              await _onCollectStatusChange(context, newStatus);
              setState(() {
                this._collect = newStatus;
              });
            },
            child: SizedBox(
              height: 30,
              width: 30,
              child: Icon(
                Icons.favorite,
                size: 18,
                color: _collect ? Colors.blueAccent : Colors.white,
              ),
            ),
          ),
        ],
      ),
      withZoom: true,
      withLocalStorage: true,
      hidden: true,
      initialChild: Container(
        color: Colors.redAccent,
        child: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }

  /// 收藏 || 取消收藏
  _onCollectStatusChange(BuildContext context, bool newStatus) async {
    if (newStatus) {
      await WanAndroidApi().collectArticleInner(
          UrlHost.WANANDROID_BASE_URL + "/lg/collect/${widget.originId}/json");
      ToastUtils.showToast(context, '收藏成功');
    } else {
      await WanAndroidApi().uncollectOriginId(UrlHost.WANANDROID_BASE_URL +
          "/lg/uncollect_originId/${widget.originId}/json");
      ToastUtils.showToast(context, '取消收藏');
    }
  }
}
