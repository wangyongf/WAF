import 'package:daily_purify/data/net/url_host.dart';
import 'package:daily_purify/data/net/wanandroid_api.dart';
import 'package:daily_purify/model/project_list_model.dart' as list;
import 'package:daily_purify/pages/article_list_page.dart';
import 'package:daily_purify/util/toast_utils.dart';
import 'package:daily_purify/widget/empty_holder.dart';
import 'package:flutter/material.dart';

class WanAndroidProjectPage extends StatefulWidget {
  @override
  _WanAndroidProjectPageState createState() => _WanAndroidProjectPageState();
}

class _WanAndroidProjectPageState extends State<WanAndroidProjectPage>
    with AutomaticKeepAliveClientMixin, SingleTickerProviderStateMixin {
  list.ProjectListModel _projectListModel;
  TabController _tabController;

  /// TODO: 缓存用
  var _maxCachePageNums = 5;
  var _cachedPageNum = 0;

  @override
  void initState() {
    super.initState();

    _tabController = TabController(length: 0, vsync: this);
    _fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('项目'),
        centerTitle: true,
        bottom: _buildTabBar(),
      ),
      body: _buildBody(),
    );
  }

  _buildBody() {
    if (_projectListModel?.data?.isEmpty ?? true) {
      return EmptyHolder();
    }
    return TabBarView(
      children: _buildPages(),
      controller: _tabController,
    );
  }

  List<Widget> _buildPages() {
    return _projectListModel?.data?.map(_buildSinglePage)?.toList();
  }

  Widget _buildSinglePage(list.Data project) {
    int id = project.id;
    return ArticleListPage(
      urlBuilder: (currentPage) =>
          UrlHost.WANANDROID_BASE_URL +
          "/project/list/$currentPage/json?cid=$id",
    );
  }

  _buildTabBar() {
    if (_projectListModel?.data?.isEmpty ?? true) {
      return null;
    }
    return TabBar(
      tabs: _buildTabs(),
      isScrollable: true,
      controller: _tabController,
      indicatorColor: Colors.white,
    );
  }

  List<Widget> _buildTabs() {
    return _projectListModel.data.map(_buildSingleTab).toList();
  }

  Widget _buildSingleTab(tab) => Padding(
      padding: EdgeInsets.only(bottom: 8, top: 8), child: Text(tab.name));

  @override
  void dispose() {
    super.dispose();

    _tabController.dispose();
  }

  _fetchData() {
    _fetchProjectList();
  }

  _fetchProjectList() {
    WanAndroidApi().getProjectList(null).then((list.ProjectListModel value) {
      setState(() {
        this._projectListModel = value;
        int tabSize = _projectListModel?.data?.length ?? 0;
        _tabController = TabController(length: tabSize, vsync: this);
      });
    }).catchError((Object error) {
      ToastUtils.showToast(context, 'Tab 数据加载失败');
    }).whenComplete(() {});
  }

  @override
  bool get wantKeepAlive => true;
}
