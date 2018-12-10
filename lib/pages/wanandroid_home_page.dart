import 'package:daily_purify/data/net/wanandroid_api.dart';
import 'package:daily_purify/model/article_list_model.dart';
import 'package:daily_purify/util/toast_util.dart';
import 'package:daily_purify/widget/carousel.dart';
import 'package:daily_purify/widget/wanandroid_article_list_item.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

/// TODO: 首页字体再对比掘金认真整整
class WanAndroidHomePage extends StatefulWidget {
  @override
  _WanAndroidHomePageState createState() => _WanAndroidHomePageState();
}

class _WanAndroidHomePageState extends State<WanAndroidHomePage> {
  ArticleListModel _articlesList;

  @override
  void initState() {
    super.initState();

    _request();
  }

  _request() {
    WanAndroidApi().getArticles(0).then((ArticleListModel value) {
      setState(() {
        _articlesList = value;
      });
      ToastUtil.showToast(context, '加载成功');
    }).catchError((Object error) {
      ToastUtil.showToast(context, '加载出错！');
      return true;
    }).whenComplete(() {
      print('加载完毕');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '玩 Android',
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
        centerTitle: true,
        actions: _buildActions(),
      ),
      body: _buildBody(),
      bottomNavigationBar: _buildBottomNavigation(),
    );
  }

  _buildBody() {
    return Container(
      child: _buildArticles(),
    );
  }

  _buildArticles() {
    return ListView.builder(
        itemCount: _articlesList?.data?.datas?.length ?? 0 + 1,
        itemBuilder: (BuildContext context, int position) {
          if (position == 0) {
            return _buildBanners();
          }
          return _buildArticleItem(position - 1);
        });
  }

  _buildBanners() {
    return Container(
        padding: EdgeInsets.all(5),
        height: 200,
        child: Carousel(
          children: [
            AssetImage('images/hello_spider_man.png'),
            AssetImage('images/spider_man.jpeg'),
            AssetImage('images/text.jpeg'),
          ]
              .map((bgImg) => Image(
                  image: bgImg,
                  width: double.infinity,
                  height: 200,
                  fit: BoxFit.cover))
              .toList(),
          displayDuration: const Duration(seconds: 5),
        ));
  }

  _buildArticleItem(int position) {
    String avatarUrl = "https://www.baidu.com.png";
    String chapterName = _articlesList.data.datas[position].chapterName;
    String superChapterName =
        _articlesList.data.datas[position].superChapterName;
    String title = _articlesList.data.datas[position].title;
    String author = _articlesList.data.datas[position].author;
    String publishTime = _articlesList.data.datas[position].niceDate;
    return WanAndroidArticleListItem(
      avatarUrl: avatarUrl,
      chapterName: chapterName,
      superChapterName: superChapterName,
      title: title,
      author: author,
      publishTime: publishTime,
    );
  }

  _buildActions() {
    return <Widget>[
      InkWell(
        onTap: () {
          _request();
        },
        child: IconButton(
          icon: Icon(
            Icons.search,
            color: Colors.white,
            size: 24,
          ),
        ),
      )
    ];
  }

  _buildBottomNavigation() {
    return BottomNavigationBar(
        currentIndex: 1,
        type: BottomNavigationBarType.fixed,
        onTap: (int position) {
          Fluttertoast.showToast(msg: 'you clicked ${position}');
        },
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                color: Colors.redAccent,
              ),
              title: Text(
                '首页',
                style: TextStyle(color: Colors.redAccent),
              )),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.folder_special,
                color: Colors.grey,
              ),
              title: Text(
                '项目',
                style: TextStyle(color: Colors.grey),
              )),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.chat,
                color: Colors.grey,
              ),
              title: Text(
                '公众号',
                style: TextStyle(color: Colors.grey),
              )),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.dashboard,
                color: Colors.grey,
              ),
              title: Text(
                '体系',
                style: TextStyle(color: Colors.grey),
              )),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
                color: Colors.grey,
              ),
              title: Text(
                '我的',
                style: TextStyle(color: Colors.grey),
              ))
        ]);
  }
}
