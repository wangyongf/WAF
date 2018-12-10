// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'article_list_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ArticleListModel _$ArticleListModelFromJson(Map<String, dynamic> json) {
  return ArticleListModel(
      json['data'] == null
          ? null
          : ArticleListDataModel.fromJson(json['data'] as Map<String, dynamic>),
      json['errorCode'] as int,
      json['errorMsg'] as String);
}

Map<String, dynamic> _$ArticleListModelToJson(ArticleListModel instance) =>
    <String, dynamic>{
      'errorCode': instance.errorCode,
      'errorMsg': instance.errorMsg,
      'data': instance.data
    };

ArticleListDataModel _$ArticleListDataModelFromJson(Map<String, dynamic> json) {
  return ArticleListDataModel(
      json['curpage'] as int,
      (json['datas'] as List)
          ?.map((e) => e == null
              ? null
              : ArticleItemModel.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      json['offset'] as int,
      json['over'] as bool,
      json['pageCount'] as int,
      json['size'] as int,
      json['total'] as int);
}

Map<String, dynamic> _$ArticleListDataModelToJson(
        ArticleListDataModel instance) =>
    <String, dynamic>{
      'curpage': instance.curpage,
      'datas': instance.datas,
      'offset': instance.offset,
      'over': instance.over,
      'pageCount': instance.pageCount,
      'size': instance.size,
      'total': instance.total
    };

ArticleItemModel _$ArticleItemModelFromJson(Map<String, dynamic> json) {
  return ArticleItemModel(
      json['apkLink'] as String,
      json['author'] as String,
      json['chapterId'] as int,
      json['chapterName'] as String,
      json['collect'] as bool,
      json['courseId'] as int,
      json['desc'] as String,
      json['envelopePic'] as String,
      json['fresh'] as bool,
      json['id'] as int,
      json['link'] as String,
      json['niceDate'] as String,
      json['origin'] as String,
      json['projectLink'] as String,
      json['publishTime'] as int,
      json['superChapterId'] as int,
      json['superChapterName'] as String,
      (json['tags'] as List)
          ?.map((e) => e == null
              ? null
              : ArticleTagModel.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      json['title'] as String,
      json['type'] as int,
      json['userId'] as int,
      json['visible'] as int,
      json['zan'] as int);
}

Map<String, dynamic> _$ArticleItemModelToJson(ArticleItemModel instance) =>
    <String, dynamic>{
      'apkLink': instance.apkLink,
      'author': instance.author,
      'chapterId': instance.chapterId,
      'chapterName': instance.chapterName,
      'collect': instance.collect,
      'courseId': instance.courseId,
      'desc': instance.desc,
      'envelopePic': instance.envelopePic,
      'fresh': instance.fresh,
      'id': instance.id,
      'link': instance.link,
      'niceDate': instance.niceDate,
      'origin': instance.origin,
      'projectLink': instance.projectLink,
      'publishTime': instance.publishTime,
      'superChapterId': instance.superChapterId,
      'superChapterName': instance.superChapterName,
      'tags': instance.tags,
      'title': instance.title,
      'type': instance.type,
      'userId': instance.userId,
      'visible': instance.visible,
      'zan': instance.zan
    };

ArticleTagModel _$ArticleTagModelFromJson(Map<String, dynamic> json) {
  return ArticleTagModel(json['name'] as String, json['url'] as String);
}

Map<String, dynamic> _$ArticleTagModelToJson(ArticleTagModel instance) =>
    <String, dynamic>{'name': instance.name, 'url': instance.url};
