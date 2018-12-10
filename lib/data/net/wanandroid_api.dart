import 'dart:io';

import 'package:daily_purify/data/net/url_host.dart';
import 'package:daily_purify/data/net/url_path.dart';
import 'package:daily_purify/model/article_list_model.dart';
import 'package:daily_purify/model/home_banner_model.dart';
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

  Future<HomeBannerModel> getHomeBanners() async {
    String url = UrlHost.WANANDROID_BASE_URL + UrlPath.HOME_BANNER;
    Dio dio = DioFactory().getDio();

    LogUtil.log('getArticles: ' + url);

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
}
