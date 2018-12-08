import 'dart:io';

import 'package:daily_purify/model/base_model.dart';
import 'package:daily_purify/model/wanandroid_article_list_model.dart';
import 'package:daily_purify/net/dio_factory.dart';
import 'package:daily_purify/util/log_util.dart';
import 'package:dio/dio.dart';

class WanAndroidApi {
  static final WanAndroidApi _singleton = _init();

  factory WanAndroidApi() {
    return _singleton;
  }

  static _init() {
    /// TODO: setup the WanAndroidApi.
  }

  static final String _baseUrl = "http://www.wanandroid.com";
  static final String _articleList = "";

  /// 获取首页文章列表
  /// page, 当前页数，默认为0
  Future<BaseModel<WanAndroidArticleListModel>> getArticles(int page) async {
    String url = _baseUrl + "/article/list/${page}/json";
    Dio dio = DioFactory().getDio();

    LogUtil.log('getArticles: ' + url);

    int code = -1;
    String errorMsg = "";
    WanAndroidArticleListModel articleListModel;
    BaseModel<WanAndroidArticleListModel> model;

    try {
      Response response = await dio.get(url);
      code = 200;
      if (response.statusCode == HttpStatus.ok) {
        /// TODO: 解析的逻辑
      } else {
        code = response.statusCode;
        errorMsg = '服务器异常';
      }
    } catch (exception) {
      code = -1;
      errorMsg = '您的网络似乎出了点问题';
    } finally {
      model = BaseModel(code: code, errorMsg: errorMsg, data: articleListModel);
    }

    return model;
  }
}
