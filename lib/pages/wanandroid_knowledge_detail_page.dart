import 'package:daily_purify/data/net/url_host.dart';
import 'package:daily_purify/model/knowledge_tree_list_model.dart' as tree;
import 'package:daily_purify/pages/article_list_page.dart';
import 'package:daily_purify/widget/empty_holder.dart';
import 'package:flutter/material.dart';

class WanAndroidKnowledgeDetailPage extends StatefulWidget {
  final tree.Data knowledgeTree;

  const WanAndroidKnowledgeDetailPage({Key key, @required this.knowledgeTree})
      : super(key: key);

  @override
  _WanAndroidKnowledgeDetailPageState createState() =>
      _WanAndroidKnowledgeDetailPageState();
}

class _WanAndroidKnowledgeDetailPageState
    extends State<WanAndroidKnowledgeDetailPage>
    with AutomaticKeepAliveClientMixin, SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();

    _tabController = TabController(
        length: widget.knowledgeTree.children.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.knowledgeTree.name),
        centerTitle: true,
        bottom: _buildTabBar(),
      ),
      body: _buildBody(),
    );
  }

  _buildBody() {
    if (widget.knowledgeTree?.children?.isEmpty ?? true) {
      return EmptyHolder();
    }
    return TabBarView(
      children: _buildPages(),
      controller: _tabController,
    );
  }

  List<Widget> _buildPages() {
    return widget.knowledgeTree?.children?.map(_buildSinglePage)?.toList();
  }

  Widget _buildSinglePage(tree.Children children) {
    int id = children.id;
    return ArticleListPage(
      startPage: 0,
      urlBuilder: (currentPage) =>
          UrlHost.WANANDROID_BASE_URL +
          "/article/list/$currentPage/json?cid=$id",
    );
  }

  _buildTabBar() {
    if (widget.knowledgeTree?.children?.isEmpty ?? true) {
      return null;
    }
    return TabBar(
      tabs: _buildTabs(),
      isScrollable: true,
      controller: _tabController,
    );
  }

  List<Widget> _buildTabs() {
    return widget.knowledgeTree?.children?.map(_buildSingleTab)?.toList();
  }

  Widget _buildSingleTab(tab) => Padding(
      padding: EdgeInsets.only(bottom: 8, top: 8), child: Text(tab.name));

  @override
  void dispose() {
    super.dispose();

    _tabController.dispose();
  }

  @override
  bool get wantKeepAlive => true;
}
