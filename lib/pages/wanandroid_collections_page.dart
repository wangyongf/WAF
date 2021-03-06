import 'package:daily_purify/pages/collection_list_page.dart';
import 'package:flutter/material.dart';

class WanAndroidCollectionsPage extends StatefulWidget {
  @override
  _WanAndroidCollectionsPageState createState() =>
      _WanAndroidCollectionsPageState();
}

class _WanAndroidCollectionsPageState extends State<WanAndroidCollectionsPage>
    with AutomaticKeepAliveClientMixin {
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
    return ArticleCollectionsPage(
      startPage: 0,
      urlBuilder: (currentPage) {
        return "http://www.wanandroid.com/lg/collect/list/$currentPage/json";
      },
    );
  }

  @override
  bool get wantKeepAlive => true;
}
