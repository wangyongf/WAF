class BaseModel<T> {
  /// code
  final int errorCode;

  /// 错误信息
  final String errorMsg;

  /// 实际的返回数据
  final T data;

  BaseModel(this.errorCode, this.errorMsg, this.data);
}
