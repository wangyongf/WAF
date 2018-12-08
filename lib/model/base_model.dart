class BaseModel<T> {
  /// code
  final int code;

  /// 错误信息
  final String errorMsg;

  /// 实际的返回数据
  final T data;

  const BaseModel({this.code, this.errorMsg, this.data});
}
