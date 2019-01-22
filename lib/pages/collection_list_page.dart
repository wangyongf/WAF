import 'package:daily_purify/data/net/url_host.dart';
import 'package:daily_purify/data/net/wanandroid_api.dart';
import 'package:daily_purify/model/article_collections_model.dart';
import 'package:daily_purify/util/toast_utils.dart';
import 'package:daily_purify/widget/empty_holder.dart';
import 'package:daily_purify/widget/wanandroid_article_list_item.dart';
import 'package:flutter/material.dart';

typedef String UrlBuilder(int page);

/// ProjectArticleListPage, Dart 的泛型？
class ArticleCollectionsPage extends StatefulWidget {
  final UrlBuilder urlBuilder;
  final int startPage;
  final OnCollectStatusChange onCollectStatusChange;
  final OnItemTap onItemTap;

  const ArticleCollectionsPage(
      {Key key,
      @required this.urlBuilder,
      this.startPage = 1,
      this.onCollectStatusChange,
      this.onItemTap})
      : super(key: key);

  @override
  _ArticleCollectionsPageState createState() => _ArticleCollectionsPageState();
}

class _ArticleCollectionsPageState extends State<ArticleCollectionsPage> {
  final _refreshKey = GlobalKey<RefreshIndicatorState>();

  ArticleCollectionsModel _collectionsModel;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();

    _currentPage = widget.startPage;
    _fetchProjectDetail();
  }

  @override
  Widget build(BuildContext context) {
    if (_collectionsModel == null) {
      return EmptyHolder();
    }
    return RefreshIndicator(
      key: _refreshKey,
      onRefresh: _fetchProjectDetail,
      child: ListView.builder(
          itemCount: _collectionsModel?.data?.datas?.length ?? 0,
          itemBuilder: (BuildContext context, int position) {
            return _buildArticleItem(position);
          }),
    );
  }

  _buildArticleItem(int position) {
    var item = _collectionsModel?.data?.datas[position] ?? null;
    if (item == null) {
      return EmptyHolder(msg: "数据错误...");
    }
    String avatarUrl = "https://www.baidu.com.png";
    String chapterName = item.chapterName ?? "Something";
    chapterName = chapterName.trim().isEmpty ? "Something" : chapterName;
    return WanAndroidArticleListItem(
      originId: item.id ?? -1,
      collect: true,
      target: item.link,
      avatarUrl: avatarUrl,
      chapterName: chapterName,
      superChapterName: "Another thing",
      title: item.title,
      author: item.author,
      publishTime: item.niceDate,
      onItemTap: widget.onItemTap,
      onCollectStatusChange: (BuildContext context, bool newStatus) {
        _onUnCollect(newStatus, item.id, item.originId);
      },
    );
  }

  Future<Null> _fetchProjectDetail() async {
    try {
      var value = await WanAndroidApi()
          .getArticleCollections(widget.urlBuilder(_currentPage));
      setState(() {
        this._collectionsModel = value;
      });
    } catch (e) {
      ToastUtils.showToast(context, '收藏数据加载失败');
    }
    return null;
  }

  _onUnCollect(bool newStatus, int id, int originId) async {
    if (newStatus) {
      await WanAndroidApi().collectArticleInner(
          UrlHost.WANANDROID_BASE_URL + "/lg/collect/$originId/json");
      ToastUtils.showToast(context, '收藏成功');
    } else {
      await WanAndroidApi().uncollect(
          UrlHost.WANANDROID_BASE_URL + "/lg/uncollect/$id/json", originId);
      ToastUtils.showToast(context, '取消收藏');
    }
    _fetchProjectDetail();
  }
}
