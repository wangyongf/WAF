import 'package:daily_purify/data/net/wanandroid_api.dart';
import 'package:daily_purify/model/project_detail_model.dart';
import 'package:daily_purify/util/toast_utils.dart';
import 'package:daily_purify/widget/empty_holder.dart';
import 'package:daily_purify/widget/wanandroid_article_list_item.dart';
import 'package:flutter/material.dart';

typedef String UrlBuilder(int page);
typedef OnCollectStatusChange(bool newStatus, int originId);
typedef OnItemTap(BuildContext context);

/// ProjectArticleListPage, Dart 的泛型？
class ArticleListPage extends StatefulWidget {
  final UrlBuilder urlBuilder;
  final int startPage;
  final OnCollectStatusChange onCollectStatusChange;
  final OnItemTap onItemTap;

  const ArticleListPage(
      {Key key,
      @required this.urlBuilder,
      this.startPage = 1,
      this.onCollectStatusChange,
      this.onItemTap})
      : super(key: key);

  @override
  _ArticleListPageState createState() => _ArticleListPageState();
}

class _ArticleListPageState extends State<ArticleListPage> with AutomaticKeepAliveClientMixin {
  ProjectDetailModel _detailModel;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();

    _currentPage = widget.startPage;
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
    String chapterName = item.chapterName ?? "Something";
    chapterName = chapterName.trim().isEmpty ? "Something" : chapterName;
    return WanAndroidArticleListItem(
      originId: item.id ?? -1,
      collect: item.collect ?? false,
      target: item.link,
      avatarUrl: avatarUrl,
      chapterName: chapterName,
      superChapterName: item.superChapterName ?? "Another thing",
      title: item.title,
      author: item.author,
      publishTime: item.niceDate,
      onItemTap: widget.onItemTap,
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
      ToastUtils.showToast(context, '项目列表数据加载失败');
    }).whenComplete(() {});
  }

  @override
  bool get wantKeepAlive => true;
}
