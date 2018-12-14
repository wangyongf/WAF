import 'package:json_annotation/json_annotation.dart';

part 'wechat_subscription_list_model.g.dart';


@JsonSerializable()
class WechatSubscriptionListModel extends Object {

  @JsonKey(name: 'data')
  List<Data> data;

  @JsonKey(name: 'errorCode')
  int errorCode;

  @JsonKey(name: 'errorMsg')
  String errorMsg;

  WechatSubscriptionListModel(this.data,this.errorCode,this.errorMsg,);

  factory WechatSubscriptionListModel.fromJson(Map<String, dynamic> srcJson) => _$WechatSubscriptionListModelFromJson(srcJson);

  Map<String, dynamic> toJson() => _$WechatSubscriptionListModelToJson(this);

}


@JsonSerializable()
class Data extends Object {

  @JsonKey(name: 'children')
  List<dynamic> children;

  @JsonKey(name: 'courseId')
  int courseId;

  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'name')
  String name;

  @JsonKey(name: 'order')
  int order;

  @JsonKey(name: 'parentChapterId')
  int parentChapterId;

  @JsonKey(name: 'userControlSetTop')
  bool userControlSetTop;

  @JsonKey(name: 'visible')
  int visible;

  Data(this.children,this.courseId,this.id,this.name,this.order,this.parentChapterId,this.userControlSetTop,this.visible,);

  factory Data.fromJson(Map<String, dynamic> srcJson) => _$DataFromJson(srcJson);

  Map<String, dynamic> toJson() => _$DataToJson(this);

}


