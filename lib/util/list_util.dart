/// 沉淀列表相关的工具类
class Lists {
  /// 判断是否空列表
  /// 可以用 ?. 语法来替代
  static isEmpty(List list) {
    return list == null || list.length == 0;
  }
}
