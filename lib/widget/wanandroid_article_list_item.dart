import 'package:daily_purify/data/net/url_host.dart';
import 'package:daily_purify/data/net/wanandroid_api.dart';
import 'package:daily_purify/manager/user_manager.dart';
import 'package:daily_purify/pages/wanandroid_webview_page.dart';
import 'package:daily_purify/util/toast_utils.dart';
import 'package:flutter/material.dart';

typedef OnCollectStatusChange(BuildContext context, bool newStatus);
typedef OnItemTap(BuildContext context);

class WanAndroidArticleListItem extends StatefulWidget {
  final int originId;
  final bool collect;
  final String target;
  final String avatarUrl;
  final String chapterName;
  final String superChapterName;
  final String title;
  final String author;
  final String publishTime;
  final OnItemTap onItemTap;
  final OnCollectStatusChange onCollectStatusChange;

  const WanAndroidArticleListItem(
      {Key key,
      this.originId,
      this.collect,
      this.target,
      this.avatarUrl,
      this.chapterName,
      this.superChapterName,
      this.title,
      this.author,
      this.publishTime,
      this.onItemTap,
      this.onCollectStatusChange})
      : super(key: key);

  @override
  _WanAndroidArticleListItemState createState() =>
      _WanAndroidArticleListItemState();
}

class _WanAndroidArticleListItemState extends State<WanAndroidArticleListItem> {
  bool _collect;

  @override
  void initState() {
    super.initState();

    _collect = widget.collect ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _onItemTap(context);
      },
      child: Card(
        color: Colors.white,
        child: Container(
          padding: EdgeInsets.fromLTRB(8, 10, 8, 2),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  CircleAvatar(
                    radius: 9,
                    backgroundImage: AssetImage('images/appbar_def_bg.jpeg'),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 5),
                    child: Text(
                      widget.chapterName,
                      style: TextStyle(fontSize: 13, color: Colors.black),
                    ),
                  ),
                  Expanded(child: Container()),
                  Text(
                    widget.superChapterName,
                    style: TextStyle(fontSize: 13, color: Colors.grey),
                  )
                ],
              ),
              Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.only(top: 16),
                child: Text(
                  widget.title,
                  style: TextStyle(
                      fontSize: 15,
                      color: Color(0xA6000000),
                      fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 5),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      widget.author,
                      style: TextStyle(fontSize: 13, color: Colors.black87),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 20),
                      child: Text(
                        widget.publishTime,
                        style: TextStyle(fontSize: 13, color: Colors.grey),
                      ),
                    ),
                    Expanded(child: Container()),
                    Container(
                      margin: EdgeInsets.only(right: 10),
                      child: InkWell(
                        onTap: () {
                          _updateCollectStatus(context);
                        },
                        child: SizedBox(
                          height: 30,
                          width: 30,
                          child: Icon(
                            Icons.favorite,
                            size: 18,
                            color: _collect ? Colors.redAccent : Colors.grey,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  _onItemTap(BuildContext context) {
    if (widget.target == null || widget.target.isEmpty) {
      return;
    }
    Function action = widget.onItemTap ?? _defaultOnItemTap;
    action(context);
  }

  _defaultOnItemTap(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => WanAndroidWebViewPage(
              target: widget.target,
              title: widget.title,
              collect: _collect,
              originId: widget.originId,
            )));
  }

  _updateCollectStatus(BuildContext context) async {
    if (!UserManager().isLogin()) {
      ToastUtils.showToast(context, '请先登录');
      return;
    }
    bool newStatus = !_collect;
    Function action =
        widget.onCollectStatusChange ?? _defaultOnCollectStatusChange;
    await action(context, newStatus);

    setState(() {
      this._collect = newStatus;
    });
  }

  /// 收藏 || 取消收藏
  _defaultOnCollectStatusChange(BuildContext context, bool newStatus) async {
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
