import 'package:daily_purify/pages/wanandroid_home_page.dart';
import 'package:daily_purify/pages/wanandroid_knowledge_page.dart';
import 'package:daily_purify/pages/wanandroid_mine_page.dart';
import 'package:daily_purify/pages/wanandroid_project_page.dart';
import 'package:daily_purify/pages/wanandroid_wechat_page.dart';
import 'package:flutter/material.dart';

/// TODO: 页面之间的切换还有很多可以优化的地方，比如切换动画
class WanAndroidMainPage extends StatefulWidget {
  @override
  _WanAndroidMainPageState createState() => _WanAndroidMainPageState();
}

class _WanAndroidMainPageState extends State<WanAndroidMainPage>
    with SingleTickerProviderStateMixin {
  int _page = 0;
  int _current = 0;
  PageController _pageController;

  var _body;

  @override
  void initState() {
    super.initState();

    _pageController = PageController(initialPage: _page);
    _body = <Widget>[
      WanAndroidHomePage(),
      WanAndroidProjectPage(),
      WanAndroidWechatPage(),
      WanAndroidKnowledgePage(),
      WanAndroidMinePage()
    ];
  }

  @override
  Widget build(BuildContext context) {
    /// TODO: 这里如果是 PageView 的话，如何取消动画？
    return Scaffold(
//      body: _body[_page],
      body: PageView(
        controller: _pageController,
        physics: NeverScrollableScrollPhysics(),
        onPageChanged: _pageChanged,
        pageSnapping: false,
        children: <Widget>[
          WanAndroidHomePage(),
          WanAndroidProjectPage(),
          WanAndroidWechatPage(),
          WanAndroidKnowledgePage(),
          WanAndroidMinePage()
        ],
      ),
      bottomNavigationBar: _buildBottomNavigation(),
    );
  }

  _pageChanged(int page) {}

  _buildBottomNavigation() {
    return BottomNavigationBar(
        currentIndex: _page,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          _pageController.animateToPage(index,
              duration: Duration(milliseconds: 100), curve: Curves.ease);
          _current = index;
          setState(() {
            _page = index;
          });
        },
        fixedColor: Colors.redAccent,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('首页')),
          BottomNavigationBarItem(
              icon: Icon(Icons.folder_special), title: Text('项目')),
          BottomNavigationBarItem(icon: Icon(Icons.chat), title: Text('公众号')),
          BottomNavigationBarItem(
              icon: Icon(Icons.dashboard), title: Text('体系')),
          BottomNavigationBarItem(icon: Icon(Icons.person), title: Text('我的'))
        ]);
  }

  @override
  void dispose() {
    super.dispose();

    _pageController.dispose();
  }
}
