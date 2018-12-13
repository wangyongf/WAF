import 'package:daily_purify/data/net/wanandroid_api.dart';
import 'package:daily_purify/model/project_detail_model.dart';
import 'package:daily_purify/util/toast_util.dart';
import 'package:daily_purify/widget/empty_holder.dart';
import 'package:daily_purify/widget/wanandroid_article_list_item.dart';
import 'package:flutter/material.dart';

typedef String UrlBuilder(int page);

class ArticleListPage extends StatefulWidget {
  final UrlBuilder urlBuilder;

  const ArticleListPage({Key key, @required this.urlBuilder}) : super(key: key);

  @override
  _ArticleListPageState createState() => _ArticleListPageState();
}

class _ArticleListPageState extends State<ArticleListPage> {
  ProjectDetailModel _detailModel;
  int _currentPage = 1;

  @override
  void initState() {
    super.initState();

    _fetchProjectDetail();
  }

  @override
  Widget build(BuildContext context) {
    if (_detailModel == null) {
      return EmptyHolder();
    }
    return ListView.builder(
        itemCount: _detailModel?.data?.datas?.length ?? 0,
        itemBuilder: (BuildContext context, int position) {
          return _buildArticleItem(position);
        });
  }

  _buildArticleItem(int position) {
    var item = _detailModel?.data?.datas[position] ?? null;
    if (item == null) {
      return EmptyHolder(msg: "数据错误...");
    }
    String avatarUrl = "https://www.baidu.com.png";
    String chapterName = item.chapterName;
    String superChapterName = item.superChapterName;
    String title = item.title;
    String author = item.author;
    String publishTime = item.niceDate;
    return WanAndroidArticleListItem(
      avatarUrl: avatarUrl,
      chapterName: chapterName,
      superChapterName: superChapterName,
      title: title,
      author: author,
      publishTime: publishTime,
    );
  }

  _fetchProjectDetail() {
    WanAndroidApi()
        .getProjectDetail(widget.urlBuilder(_currentPage))
        .then((ProjectDetailModel value) {
      setState(() {
        _detailModel = value;
      });
    }).catchError((Object error) {
      ToastUtil.showToast(context, '项目列表数据加载失败');
    }).whenComplete(() {});
  }
}
