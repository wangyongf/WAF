import 'package:daily_purify/data/net/wanandroid_api.dart';
import 'package:daily_purify/model/knowledge_articles_model.dart';
import 'package:daily_purify/util/toast_util.dart';
import 'package:daily_purify/widget/empty_holder.dart';
import 'package:daily_purify/widget/wanandroid_article_list_item.dart';
import 'package:flutter/material.dart';

typedef String UrlBuilder(int page);

/// ProjectArticleListPage, Dart 的泛型？
class KnowledgeArticleListPage extends StatefulWidget {
  final UrlBuilder urlBuilder;

  const KnowledgeArticleListPage({Key key, @required this.urlBuilder}) : super(key: key);

  @override
  _KnowledgeArticleListPageState createState() => _KnowledgeArticleListPageState();
}

class _KnowledgeArticleListPageState extends State<KnowledgeArticleListPage> {
  KnowledgeArticlesModel _articlesModel;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();

    _fetchProjectDetail();
  }

  @override
  Widget build(BuildContext context) {
    if (_articlesModel == null) {
      return EmptyHolder();
    }
    return ListView.builder(
        itemCount: _articlesModel?.data?.datas?.length ?? 0,
        itemBuilder: (BuildContext context, int position) {
          return _buildArticleItem(position);
        });
  }

  _buildArticleItem(int position) {
    var item = _articlesModel?.data?.datas[position] ?? null;
    if (item == null) {
      return EmptyHolder(msg: "数据错误...");
    }
    String avatarUrl = "https://www.baidu.com.png";
    return WanAndroidArticleListItem(
      target: item.link,
      avatarUrl: avatarUrl,
      chapterName: item.chapterName,
      superChapterName: item.superChapterName,
      title: item.title,
      author: item.author,
      publishTime: item.niceDate,
    );
  }

  _fetchProjectDetail() {
    WanAndroidApi()
        .getKnowledgeArticles(widget.urlBuilder(_currentPage))
        .then((KnowledgeArticlesModel value) {
      setState(() {
        _articlesModel = value;
      });
    }).catchError((Object error) {
      ToastUtil.showToast(context, '项目列表数据加载失败');
    }).whenComplete(() {});
  }
}
