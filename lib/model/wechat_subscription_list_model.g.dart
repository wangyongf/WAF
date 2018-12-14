// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wechat_subscription_list_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WechatSubscriptionListModel _$WechatSubscriptionListModelFromJson(
    Map<String, dynamic> json) {
  return WechatSubscriptionListModel(
      (json['data'] as List)
          ?.map((e) =>
              e == null ? null : Data.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      json['errorCode'] as int,
      json['errorMsg'] as String);
}

Map<String, dynamic> _$WechatSubscriptionListModelToJson(
        WechatSubscriptionListModel instance) =>
    <String, dynamic>{
      'data': instance.data,
      'errorCode': instance.errorCode,
      'errorMsg': instance.errorMsg
    };

Data _$DataFromJson(Map<String, dynamic> json) {
  return Data(
      json['children'] as List,
      json['courseId'] as int,
      json['id'] as int,
      json['name'] as String,
      json['order'] as int,
      json['parentChapterId'] as int,
      json['userControlSetTop'] as bool,
      json['visible'] as int);
}

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'children': instance.children,
      'courseId': instance.courseId,
      'id': instance.id,
      'name': instance.name,
      'order': instance.order,
      'parentChapterId': instance.parentChapterId,
      'userControlSetTop': instance.userControlSetTop,
      'visible': instance.visible
    };
