import 'package:daily_purify/data/net/wanandroid_api.dart';
import 'package:daily_purify/model/project_detail_model.dart';
import 'package:daily_purify/model/project_list_model.dart';
import 'package:daily_purify/util/toast_util.dart';
import 'package:daily_purify/widget/wanandroid_article_list_item.dart';
import 'package:flutter/material.dart';

class WanAndroidProjectPage extends StatefulWidget {
  @override
  _WanAndroidProjectPageState createState() => _WanAndroidProjectPageState();
}

class _WanAndroidProjectPageState extends State<WanAndroidProjectPage>
    with SingleTickerProviderStateMixin {
  ProjectListModel _projectListModel;
  ProjectDetailModel _detailModel;

  TabController _tabController;

  @override
  void initState() {
    super.initState();

    _tabController = TabController(length: 0, vsync: this);
    _fetchData();
  }

  @override
  Widget build(BuildContext context) {
    if (_projectListModel?.data?.isEmpty ?? true) {
      return Scaffold(
        appBar: AppBar(
          title: Text('项目'),
          centerTitle: true,
        ),
      );
    }
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
    /// TODO: 构造 TabBarView 的方法参考下 wanandroid-flutter 吧
    return TabBarView(
      children: _projectListModel?.data
              ?.map((project) => ListView.builder(
                  itemCount: _detailModel?.data?.datas?.length ?? 0,
                  itemBuilder: (BuildContext context, int position) {
                    return _buildArticleItem(position);
                  }))
              ?.toList() ??
          [],
      controller: _tabController,
    );
  }

  _buildArticleItem(int position) {
    String avatarUrl = "https://www.baidu.com.png";
    String chapterName = _detailModel.data.datas[position].chapterName;
    String superChapterName =
        _detailModel.data.datas[position].superChapterName;
    String title = _detailModel.data.datas[position].title;
    String author = _detailModel.data.datas[position].author;
    String publishTime = _detailModel.data.datas[position].niceDate;
    return WanAndroidArticleListItem(
      avatarUrl: avatarUrl,
      chapterName: chapterName,
      superChapterName: superChapterName,
      title: title,
      author: author,
      publishTime: publishTime,
    );
  }

  _buildTabBar() {
    List<Widget> tabs = _projectListModel?.data
            ?.map((tab) => Padding(
                padding: EdgeInsets.only(bottom: 8, top: 8),
                child: Text(tab.name)))
            ?.toList() ??
        [];
    return TabBar(
      tabs: tabs,
      isScrollable: true,
      controller: _tabController,
    );
  }

  @override
  void dispose() {
    super.dispose();

    _tabController.dispose();
  }

  _fetchData() {
    WanAndroidApi().getProjectList().then((ProjectListModel value) {
      ToastUtil.showToast(context, 'Tab 数据加载成功');
      setState(() {
        /// TODO: 参考一下 wanandroid-flutter 的 tab 是如何实现的。
        this._projectListModel = value;
        int tabSize = _projectListModel?.data?.length ?? 0;
        _tabController = TabController(length: tabSize, vsync: this);
      });
    }).catchError((Object error) {
      ToastUtil.showToast(context, 'Tab 数据加载失败');
    }).whenComplete(() {});

    WanAndroidApi().getProjectDetail().then((ProjectDetailModel value) {
      ToastUtil.showToast(context, '项目列表数据加载成功');
      setState(() {
        this._detailModel = value;
      });
    }).catchError((Object error) {
      ToastUtil.showToast(context, '项目列表数据加载失败');
    }).whenComplete(() {});
  }
}
