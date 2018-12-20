import 'dart:io';

import 'package:cookie_jar/cookie_jar.dart';
import 'package:daily_purify/data/net/url_host.dart';
import 'package:daily_purify/data/net/url_path.dart';
import 'package:daily_purify/manager/user_manager.dart';
import 'package:daily_purify/model/article_collections_model.dart';
import 'package:daily_purify/model/article_list_model.dart';
import 'package:daily_purify/model/home_banner_model.dart';
import 'package:daily_purify/model/knowledge_articles_model.dart';
import 'package:daily_purify/model/knowledge_tree_list_model.dart';
import 'package:daily_purify/model/project_detail_model.dart';
import 'package:daily_purify/model/project_list_model.dart';
import 'package:daily_purify/model/wechat_subscription_list_model.dart';
import 'package:daily_purify/net/dio_factory.dart';
import 'package:daily_purify/util/log_utils.dart';
import 'package:daily_purify/util/sp_utils.dart';
import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';

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
    Dio dio = await _getDio();

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
    Dio dio = await _getDio();

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
    Dio dio = await _getDio();

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
    Dio dio = await _getDio();

    LogUtil.log('getProjectDetail: ' + url);

    int code = -1;
    String errorMsg = "";
    ProjectDetailModel model;

    try {
      Response response = await dio.get(url, options: _getOptions());
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
    Dio dio = await _getDio();

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
    Dio dio = await _getDio();

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
    Dio dio = await _getDio();

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

  /// 收藏文章的列表
  Future<ArticleCollectionsModel> getArticleCollections(String url) async {
    url = url ?? UrlHost.WANANDROID_BASE_URL + UrlPath.COLLECTION_ARTICLES;
    Dio dio = await _getDio();

    LogUtil.log('getArticleCollections: ' + url);

    int code = -1;
    String errorMsg = "";
    ArticleCollectionsModel model;

    try {
      Response response = await dio.get(url);
      code = 200;
      if (response.statusCode == HttpStatus.ok) {
        model = ArticleCollectionsModel.fromJson(response.data);
      } else {
        code = response.statusCode;
        errorMsg = '服务器异常';
      }
    } catch (exception) {
      code = -1;
      errorMsg = '您的网络似乎出了点问题';
      model = ArticleCollectionsModel(null, code, errorMsg);
    }

    print(model.data.datas[0].toJson());
    return model;
  }

  /// 登录接口
  Future<Response> login(String username, String password) async {
    FormData formData = new FormData.from({
      "username": "$username",
      "password": "$password",
    });
    Dio dio = await _getDio();
    return dio.post(UrlHost.WANANDROID_BASE_URL + UrlPath.LOGIN,
        data: formData);
  }

  /// 注册接口
  Future<Response> register(String username, String password) async {
    FormData formData = FormData.from({
      "username": "$username",
      "password": "$password",
      "repassword": "$password",
    });
    Dio dio = await _getDio();
    return dio.post(UrlHost.WANANDROID_BASE_URL + UrlPath.REGISTER,
        data: formData);
  }

  /// 收藏站内文章
  Future<Response> collectArticleInner(String url) async {
    url =
        url ?? UrlHost.WANANDROID_BASE_URL + UrlPath.COLLECTION_ARTICLES_INNER;
    Dio dio = await _getDio();
    return await dio.post(url);
  }

  /// 收藏站外文章
  Future<Response> collectArticleOuter(
      String url, String title, String author, String link) async {
    url =
        url ?? UrlHost.WANANDROID_BASE_URL + UrlPath.COLLECTION_ARTICLES_OUTER;
    Dio dio = await _getDio();
    FormData formData =
        FormData.from({"title": title, "author": author, "link": link});
    return await dio.post(url, data: formData);
  }

  /// 取消收藏（文章列表）
  Future<Response> uncollectOriginId(String url) async {
    url = url ??
        UrlHost.WANANDROID_BASE_URL + UrlPath.UNCOLLECT_ARTICLES_ORIGINID;
    Dio dio = await _getDio();
    return await dio.post(url);
  }

  /// 取消收藏（我的收藏页面）
  Future<Response> uncollect(String url, int originId) async {
    url = url ?? UrlHost.WANANDROID_BASE_URL + UrlPath.UNCOLLECT_ARTICLES;
    Dio dio = await _getDio();
    FormData formData = FormData.from({
      "originId": originId,
    });
    return await dio.post(url, data: formData);
  }

  Future<Dio> _getDio() async {
    Dio dio = DioFactory().getDio();
    bool isProxy = await SpUtils.getBool('enableDioProxy') ?? false;
//    String proxy = '192.168.2.163:8888';
    String proxy = '172.18.107.196:8888';
    dio.onHttpClientCreate = (client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) {
        return isProxy && Platform.isAndroid;
      };
      client.findProxy = (url) {
        return isProxy ? 'PROXY $proxy' : 'DIRECT';
      };
    };
    Directory tempDir = await getTemporaryDirectory();
    String tempPath = tempDir.path + "/cookie";
    dio.cookieJar = PersistCookieJar(tempPath);
    return dio;
  }

  Options _getOptions() {
    return Options(headers: UserManager().getHeader());
  }
}
