import 'package:daily_purify/pages/wanandroid_webview_page.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class WanAndroidArticleListItem extends StatelessWidget {
  final String target;
  final String avatarUrl;
  final String chapterName;
  final String superChapterName;
  final String title;
  final String author;
  final String publishTime;

  const WanAndroidArticleListItem(
      {Key key,
      this.avatarUrl,
      this.chapterName,
      this.superChapterName,
      this.title,
      this.author,
      this.publishTime,
      this.target})
      : assert(title != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (target == null || target.isEmpty) {
          return;
        }
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => WanAndroidWebViewPage(
                  target: target,
                  title: title,
                )));
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
                      chapterName,
                      style: TextStyle(fontSize: 13, color: Colors.black),
                    ),
                  ),
                  Expanded(child: Container()),
                  Text(
                    superChapterName,
                    style: TextStyle(fontSize: 13, color: Colors.grey),
                  )
                ],
              ),
              Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.only(top: 16),
                child: Text(
                  title,
                  style: TextStyle(
                      fontSize: 15,
                      color: Colors.black87,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 5),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      author,
                      style: TextStyle(fontSize: 13, color: Colors.black87),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 20),
                      child: Text(
                        publishTime,
                        style: TextStyle(fontSize: 13, color: Colors.grey),
                      ),
                    ),
                    Expanded(child: Container()),
                    Container(
                      margin: EdgeInsets.only(right: 10),
                      child: InkWell(
                        onTap: () {
                          Fluttertoast.showToast(msg: '收藏功能开发中~');
                        },
                        child: SizedBox(
                          height: 30,
                          width: 30,
                          child: Icon(
                            Icons.favorite,
                            size: 18,
                            color: Colors.redAccent,
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
}
