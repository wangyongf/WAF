import 'package:daily_purify/pages/article_list_page.dart';
import 'package:flutter/material.dart';

class WanAndroidCollectionsPage extends StatefulWidget {
  @override
  _WanAndroidCollectionsPageState createState() =>
      _WanAndroidCollectionsPageState();
}

class _WanAndroidCollectionsPageState extends State<WanAndroidCollectionsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Icon(Icons.arrow_back)),
        title: Text('我的收藏'),
        centerTitle: true,
        actions: <Widget>[
          CircleAvatar(
            child: Icon(
              Icons.add,
              color: Colors.white,
            ),
            backgroundColor: Theme.of(context).primaryColor,
          )
        ],
      ),
      body: _buildBody(),
    );
  }

  _buildBody() {
    return ArticleListPage(
      startPage: 1,
      urlBuilder: (currentPage) {
        return "http://www.wanandroid.com/wxarticle/list/408/1/json";
      },
    );
  }
}
