import 'dart:async';
import 'dart:io';

import 'package:daily_purify/common/constant.dart';
import 'package:daily_purify/model/base_model.dart';
import 'package:daily_purify/model/hot_news_model.dart';
import 'package:daily_purify/mvp/repository/stories_repository.dart';
import 'package:daily_purify/net/apis.dart';
import 'package:daily_purify/net/dio_factory.dart';
import 'package:dio/dio.dart';

class StoriesRepositoryImpl implements StoriesRepository {
  @override
  Future<BaseModel<HotNewsModel>> loadNews(String date) {
    return _getNews(date);
  }
}

Future<BaseModel<HotNewsModel>> _getNews(String date) async {
  Dio dio = DioFactory().getDio();

  String url;

  if (null == date) {
    url = Constant.baseUrl + Apis.LATEST;
  } else {
    url = Constant.baseUrl + Apis.before + date;
  }

  print(url);

  int code;

  String errorMsg;

  HotNewsModel hotNewsStoriesModel;

  BaseModel<HotNewsModel> model;

  try {
    Response response = await dio.get(url);

    code = 200;

    if (response.statusCode == HttpStatus.ok) {
      String date = response.data['date'];

      List stories = response.data['stories'];

      List topStories = response.data['top_stories'];

      List<HotNewsTopStoriesModel> topStoriesList;

      List<HotNewsStoriesModel> storiesList = stories.map((model) {
        return new HotNewsStoriesModel.fromJson(model);
      }).toList();

      //topStories根据接口只有当天有，过去时间的topStories为空
      if (topStories != null && topStories.isNotEmpty) {
        topStoriesList = topStories.map((model) {
          return new HotNewsTopStoriesModel.fromJson(model);
        }).toList();
      }

      hotNewsStoriesModel = new HotNewsModel(
          date: date, stories: storiesList, topStories: topStoriesList);
    } else {
      errorMsg = '服务器异常';
    }
  } catch (exception) {
    errorMsg = '您的网络似乎出了什么问题';
  } finally {
    model = new BaseModel(code, errorMsg, hotNewsStoriesModel);
  }

  return model;
}
