// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'empty_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EmptyModel _$EmptyModelFromJson(Map<String, dynamic> json) {
  return EmptyModel(
      json['errorCode'] as int, json['errorMsg'] as String, json['data']);
}

Map<String, dynamic> _$EmptyModelToJson(EmptyModel instance) =>
    <String, dynamic>{
      'errorCode': instance.errorCode,
      'errorMsg': instance.errorMsg,
      'data': instance.data
    };
