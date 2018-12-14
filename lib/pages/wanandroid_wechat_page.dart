import 'package:daily_purify/data/net/url_host.dart';
import 'package:daily_purify/data/net/wanandroid_api.dart';
import 'package:daily_purify/model/wechat_subscription_list_model.dart' as list;
import 'package:daily_purify/pages/article_list_page.dart';
import 'package:daily_purify/util/toast_util.dart';
import 'package:daily_purify/widget/empty_holder.dart';
import 'package:flutter/material.dart';

class WanAndroidWechatPage extends StatefulWidget {
  @override
  _WanAndroidWechatPageState createState() => _WanAndroidWechatPageState();
}

class _WanAndroidWechatPageState extends State<WanAndroidWechatPage>
    with AutomaticKeepAliveClientMixin, SingleTickerProviderStateMixin {
  list.WechatSubscriptionListModel _subscriptions;
  TabController _tabController;

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
        title: Text('公众号'),
        centerTitle: true,
        bottom: _buildTabBar(),
      ),
      body: _buildBody(),
    );
  }

  _buildBody() {
    if (_subscriptions?.data?.isEmpty ?? true) {
      return EmptyHolder();
    }
    return TabBarView(
      children: _buildPages(),
      controller: _tabController,
    );
  }

  List<Widget> _buildPages() {
    return _subscriptions?.data?.map(_buildSinglePage)?.toList();
  }

  Widget _buildSinglePage(list.Data subscription) {
    int id = subscription.id;
    return ArticleListPage(
      urlBuilder: (currentPage) =>
          UrlHost.WANANDROID_BASE_URL + "/wxarticle/list/$id/$currentPage/json",
    );
  }

  _buildTabBar() {
    if (_subscriptions?.data?.isEmpty ?? true) {
      return null;
    }
    return TabBar(
      tabs: _buildTabs(),
      isScrollable: true,
      controller: _tabController,
    );
  }

  List<Widget> _buildTabs() {
    return _subscriptions.data.map(_buildSingleTab).toList();
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
    WanAndroidApi()
        .getWechatSubscriptions(null)
        .then((list.WechatSubscriptionListModel value) {
      setState(() {
        this._subscriptions = value;
        int tabSize = _subscriptions?.data?.length ?? 0;
        _tabController = TabController(length: tabSize, vsync: this);
      });
    }).catchError((Object error) {
      ToastUtil.showToast(context, 'Tab 数据加载失败');
    }).whenComplete(() {});
  }

  @override
  bool get wantKeepAlive => true;
}
