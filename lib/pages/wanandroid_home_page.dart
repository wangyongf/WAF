import 'package:daily_purify/widget/carousel.dart';
import 'package:daily_purify/widget/wanandroid_article_list_item.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class WanAndroidHomePage extends StatefulWidget {
  @override
  _WanAndroidHomePageState createState() => _WanAndroidHomePageState();
}

class _WanAndroidHomePageState extends State<WanAndroidHomePage> {
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
        itemCount: 7,
        itemBuilder: (BuildContext context, int position) {
          if (position == 0) {
            return _buildBanners();
          }
          return _buildArticleItem();
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

  _buildArticleItem() {
    return WanAndroidArticleListItem(
      avatarUrl: "https://www.baidu.com.png",
      chapterName: "移动开发小黑屋",
      superChapterName: "Android 开发",
      title: "基于 Vue-Cli 打包自动生成/抽离相关配置文件",
      author: "老码",
      publishTime: "1天前",
    );
  }

  _buildActions() {
    return <Widget>[
      InkWell(
        onTap: () {
          Fluttertoast.showToast(msg: 'you clicked search');
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
