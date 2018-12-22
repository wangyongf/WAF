import 'package:daily_purify/data/net/wanandroid_api.dart';
import 'package:daily_purify/model/article_list_model.dart';
import 'package:daily_purify/model/home_banner_model.dart';
import 'package:daily_purify/util/toast_utils.dart';
import 'package:daily_purify/widget/carousel.dart';
import 'package:daily_purify/widget/wanandroid_article_list_item.dart';
import 'package:flutter/material.dart';

/// TODO: 首页字体再对比掘金认真整整
class WanAndroidHomePage extends StatefulWidget {
  @override
  _WanAndroidHomePageState createState() => _WanAndroidHomePageState();
}

class _WanAndroidHomePageState extends State<WanAndroidHomePage>
    with AutomaticKeepAliveClientMixin {
  HomeBannerModel _bannerModel;
  ArticleListModel _articlesList;

  @override
  void initState() {
    super.initState();

    _fetchData();
  }

  /// 获取 Banner 数据和文章列表数据
  _fetchData() {
    _fetchArticles();
    _fetchBanners();
  }

  _fetchArticles() {
    WanAndroidApi().getArticles(0).then((ArticleListModel value) {
      setState(() {
        _articlesList = value;
      });
    }).catchError((Object error) {
      ToastUtils.showToast(context, '文章列表加载出错！');
      return true;
    }).whenComplete(() {
      print('加载完毕');
    });
  }

  _fetchBanners() {
    WanAndroidApi().getHomeBanners().then((HomeBannerModel model) {
      setState(() {
        _bannerModel = model;
      });
    }).catchError((Object error) {
      ToastUtils.showToast(context, 'Banner 加载失败');
    }).whenComplete(() {});
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
    );
  }

  @override
  void dispose() {
    super.dispose();
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
          children: _bannerModel?.data
                  ?.map((banner) => Image.network(
                        banner?.imagePath,
                        width: double.infinity,
                        height: 200,
                        fit: BoxFit.cover,
                      ))
                  ?.toList() ??
              _defaultBanner(),
          displayDuration: const Duration(seconds: 5),
        ));
  }

  _defaultBanner() {
    return [
      AssetImage('images/hello_spider_man.png'),
      AssetImage('images/spider_man.jpeg'),
      AssetImage('images/text.jpeg'),
    ]
        .map((bgImg) => Image(
            image: bgImg,
            width: double.infinity,
            height: 200,
            fit: BoxFit.cover))
        .toList();
  }

  _buildArticleItem(int position) {
    var item = _articlesList.data.datas[position];
    String avatarUrl = "https://www.baidu.com.png";
    return WanAndroidArticleListItem(
      originId: item.id,
      collect: item.collect,
      target: item.link,
      avatarUrl: avatarUrl,
      chapterName: item.chapterName,
      superChapterName: item.superChapterName,
      title: item.title,
      author: item.author,
      publishTime: item.niceDate,
    );
  }

  _buildActions() {
    return <Widget>[
      InkWell(
        onTap: () {
          _fetchData();
        },
        child: IconButton(
          icon: Icon(
            Icons.search,
            color: Colors.white,
            size: 24,
          ),
          onPressed: () {},
        ),
      )
    ];
  }

  @override
  bool get wantKeepAlive => true;
}
