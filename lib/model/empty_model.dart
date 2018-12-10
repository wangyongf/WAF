import 'package:daily_purify/model/base_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'empty_model.g.dart';

@JsonSerializable()
class EmptyModel extends BaseModel<dynamic> {
  EmptyModel(int errorCode, String errorMsg, dynamic data)
  : super(errorCode, errorMsg, data);

  factory EmptyModel.fromJson(Map<String, dynamic> json) =>
    _$EmptyModelFromJson(json);

  toJson() => _$EmptyModelToJson(this);
}