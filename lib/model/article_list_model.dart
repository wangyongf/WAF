import 'package:daily_purify/model/base_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'article_list_model.g.dart';

@JsonSerializable()
class ArticleListModel extends BaseModel<ArticleListDataModel> {
  ArticleListModel(ArticleListDataModel data, int errorCode, String errorMsg)
      : super(errorCode, errorMsg, data);

  factory ArticleListModel.fromJson(Map<String, dynamic> json) =>
      _$ArticleListModelFromJson(json);
}

@JsonSerializable()
class ArticleListDataModel {
  int curpage;
  List<ArticleItemModel> datas;
  int offset;
  bool over;
  int pageCount;
  int size;
  int total;

  ArticleListDataModel(this.curpage, this.datas, this.offset, this.over,
      this.pageCount, this.size, this.total);

  factory ArticleListDataModel.fromJson(Map<String, dynamic> json) =>
      _$ArticleListDataModelFromJson(json);
}

@JsonSerializable()
class ArticleItemModel {
  String apkLink;
  String author;
  int chapterId;
  String chapterName;
  bool collect;
  int courseId;
  String desc;
  String envelopePic;
  bool fresh;
  int id;
  String link;
  String niceDate;
  String origin;
  String projectLink;
  int publishTime;
  int superChapterId;
  String superChapterName;
  List<ArticleTagModel> tags;
  String title;
  int type;
  int userId;
  int visible;
  int zan;

  ArticleItemModel(
      this.apkLink,
      this.author,
      this.chapterId,
      this.chapterName,
      this.collect,
      this.courseId,
      this.desc,
      this.envelopePic,
      this.fresh,
      this.id,
      this.link,
      this.niceDate,
      this.origin,
      this.projectLink,
      this.publishTime,
      this.superChapterId,
      this.superChapterName,
      this.tags,
      this.title,
      this.type,
      this.userId,
      this.visible,
      this.zan);

  factory ArticleItemModel.fromJson(Map<String, dynamic> json) =>
      _$ArticleItemModelFromJson(json);

  Map<String, dynamic> toJson() {
    return _$ArticleItemModelToJson(this);
  }
}

@JsonSerializable()
class ArticleTagModel {
  String name;
  String url;

  ArticleTagModel(this.name, this.url);

  factory ArticleTagModel.fromJson(Map<String, dynamic> json) =>
      _$ArticleTagModelFromJson(json);
}
