import 'package:daily_purify/data/net/wanandroid_api.dart';
import 'package:daily_purify/model/knowledge_tree_list_model.dart';
import 'package:daily_purify/pages/wanandroid_knowledge_detail_page.dart';
import 'package:daily_purify/util/toast_utils.dart';
import 'package:daily_purify/widget/empty_holder.dart';
import 'package:flutter/material.dart';

class WanAndroidKnowledgePage extends StatefulWidget {
  @override
  _WanAndroidKnowledgePageState createState() =>
      _WanAndroidKnowledgePageState();
}

class _WanAndroidKnowledgePageState extends State<WanAndroidKnowledgePage>
    with AutomaticKeepAliveClientMixin {
  KnowledgeTreeListModel _knowledge;

  @override
  void initState() {
    super.initState();

    _fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('知识体系'),
        centerTitle: true,
      ),
      body: _buildBody(),
    );
  }

  _buildBody() {
    return ListView(
      children: _buildCategories(),
    );
  }

  _buildCategories() {
    return _knowledge?.data?.map(_buildCategory)?.toList() ?? [EmptyHolder()];
  }

  Widget _buildCategory(Data knowledge) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => WanAndroidKnowledgeDetailPage(
                  knowledgeTree: knowledge,
                )));
      },
      child: Card(
        child: ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.redAccent,
            child: Text(
              knowledge.name[0],
              style: TextStyle(color: Colors.white),
            ),
            radius: 18,
          ),
          title: Text(
            knowledge.name,
            style: TextStyle(fontSize: 20, color: Color(0xA6000000)),
          ),
        ),
      ),
    );
  }

  _fetchData() {
    WanAndroidApi().getKnowledgeTree(null).then((KnowledgeTreeListModel value) {
      setState(() {
        this._knowledge = value;
      });
    }).catchError((Object error) {
      ToastUtils.showToast(context, '知识体系数据加载失败');
    }).whenComplete(() {});
  }

  @override
  bool get wantKeepAlive => true;
}
