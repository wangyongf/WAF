import 'dart:io';

import 'package:daily_purify/data/net/url_host.dart';
import 'package:daily_purify/data/net/url_path.dart';
import 'package:daily_purify/model/article_list_model.dart';
import 'package:daily_purify/model/home_banner_model.dart';
import 'package:daily_purify/model/knowledge_articles_model.dart';
import 'package:daily_purify/model/knowledge_tree_list_model.dart';
import 'package:daily_purify/model/project_detail_model.dart';
import 'package:daily_purify/model/project_list_model.dart';
import 'package:daily_purify/model/wechat_subscription_list_model.dart';
import 'package:daily_purify/net/dio_factory.dart';
import 'package:daily_purify/util/log_util.dart';
import 'package:dio/dio.dart';

class WanAndroidApi {
  factory WanAndroidApi() => _getInstance();
  static WanAndroidApi _instance;

  WanAndroidApi._internal() {
    /// TODO: setup the WanAndroidApi.
  }

  static WanAndroidApi _getInstance() {
    if (_instance == null) {
      _instance = WanAndroidApi._internal();
    }
    return _instance;
  }

  /// 获取首页文章列表
  /// page, 当前页数，默认为0
  Future<ArticleListModel> getArticles(int page) async {
    String url = UrlHost.WANANDROID_BASE_URL + UrlPath.HOME_ARTICLES;
    Dio dio = DioFactory().getDio();

    LogUtil.log('getArticles: ' + url);

    int code = -1;
    String errorMsg = "";
    ArticleListModel model;

    try {
      Response response = await dio.get(url);
      code = 200;
      if (response.statusCode == HttpStatus.ok) {
        model = ArticleListModel.fromJson(response.data);
      } else {
        code = response.statusCode;
        errorMsg = '服务器异常';
      }
    } catch (exception) {
      code = -1;
      errorMsg = '您的网络似乎出了点问题';
      model = ArticleListModel(null, code, errorMsg);
    }

    print(model.toString());
    return model;
  }

  /// 获取首页 Banner 数据
  Future<HomeBannerModel> getHomeBanners() async {
    String url = UrlHost.WANANDROID_BASE_URL + UrlPath.HOME_BANNER;
    Dio dio = DioFactory().getDio();

    LogUtil.log('getHomeBanners: ' + url);

    int code = -1;
    String errorMsg = "";
    HomeBannerModel model;

    try {
      Response response = await dio.get(url);
      code = 200;
      if (response.statusCode == HttpStatus.ok) {
        model = HomeBannerModel.fromJson(response.data);
      } else {
        code = response.statusCode;
        errorMsg = '服务器异常';
      }
    } catch (exception) {
      code = -1;
      errorMsg = '您的网络似乎出了点问题';
      model = HomeBannerModel(null, code, errorMsg);
    }

    print(model.toString());
    return model;
  }

  /// 获取项目分类
  Future<ProjectListModel> getProjectList(String url) async {
    url = url ?? UrlHost.WANANDROID_BASE_URL + UrlPath.PROJECT_CATEGORY;
    Dio dio = DioFactory().getDio();

    LogUtil.log('getProjectList: ' + url);

    int code = -1;
    String errorMsg = "";
    ProjectListModel model;

    try {
      Response response = await dio.get(url);
      code = 200;
      if (response.statusCode == HttpStatus.ok) {
        model = ProjectListModel.fromJson(response.data);
      } else {
        code = response.statusCode;
        errorMsg = '服务器异常';
      }
    } catch (exception) {
      code = -1;
      errorMsg = '您的网络似乎出了点问题';
      model = ProjectListModel(null, code, errorMsg);
    }

    print(model.toString());
    return model;
  }

  /// 获取项目详情数据
  Future<ProjectDetailModel> getProjectDetail(String url) async {
    url = url ?? UrlHost.WANANDROID_BASE_URL + UrlPath.PROJECT_DETAILS;
    Dio dio = DioFactory().getDio();

    LogUtil.log('getProjectDetail: ' + url);

    int code = -1;
    String errorMsg = "";
    ProjectDetailModel model;

    try {
      Response response = await dio.get(url);
      code = 200;
      if (response.statusCode == HttpStatus.ok) {
        model = ProjectDetailModel.fromJson(response.data);
      } else {
        code = response.statusCode;
        errorMsg = '服务器异常';
      }
    } catch (exception) {
      code = -1;
      errorMsg = '您的网络似乎出了点问题';
      model = ProjectDetailModel(null, code, errorMsg);
    }

    print(model.toString());
    return model;
  }

  /// 获取微信公众号列表
  Future<WechatSubscriptionListModel> getWechatSubscriptions(String url) async {
    url = url ?? UrlHost.WANANDROID_BASE_URL + UrlPath.WECHAT_SUBSCRIPTIONS;
    Dio dio = DioFactory().getDio();

    LogUtil.log('getWechatSubscriptions: ' + url);

    int code = -1;
    String errorMsg = "";
    WechatSubscriptionListModel model;

    try {
      Response response = await dio.get(url);
      code = 200;
      if (response.statusCode == HttpStatus.ok) {
        model = WechatSubscriptionListModel.fromJson(response.data);
      } else {
        code = response.statusCode;
        errorMsg = '服务器异常';
      }
    } catch (exception) {
      code = -1;
      errorMsg = '您的网络似乎出了点问题';
      model = WechatSubscriptionListModel(null, code, errorMsg);
    }

    print(model.toString());
    return model;
  }

  /// 获取知识体系列表
  Future<KnowledgeTreeListModel> getKnowledgeTree(String url) async {
    url = url ?? UrlHost.WANANDROID_BASE_URL + UrlPath.KNOWLEDGE_TREE;
    Dio dio = DioFactory().getDio();

    LogUtil.log('getWechatSubscriptions: ' + url);

    int code = -1;
    String errorMsg = "";
    KnowledgeTreeListModel model;

    try {
      Response response = await dio.get(url);
      code = 200;
      if (response.statusCode == HttpStatus.ok) {
        model = KnowledgeTreeListModel.fromJson(response.data);
      } else {
        code = response.statusCode;
        errorMsg = '服务器异常';
      }
    } catch (exception) {
      code = -1;
      errorMsg = '您的网络似乎出了点问题';
      model = KnowledgeTreeListModel(null, code, errorMsg);
    }

    print(model.toString());
    return model;
  }

  /// 获取知识体系详情数据
  Future<KnowledgeArticlesModel> getKnowledgeArticles(String url) async {
    url = url ?? UrlHost.WANANDROID_BASE_URL + UrlPath.PROJECT_DETAILS;
    Dio dio = DioFactory().getDio();

    LogUtil.log('getKnowledgeArticles: ' + url);

    int code = -1;
    String errorMsg = "";
    KnowledgeArticlesModel model;

    try {
      Response response = await dio.get(url);
      code = 200;
      if (response.statusCode == HttpStatus.ok) {
        model = KnowledgeArticlesModel.fromJson(response.data);
      } else {
        code = response.statusCode;
        errorMsg = '服务器异常';
      }
    } catch (exception) {
      code = -1;
      errorMsg = '您的网络似乎出了点问题';
      model = KnowledgeArticlesModel(null, code, errorMsg);
    }

    print(model.data.datas[0].toJson());
    return model;
  }
}
