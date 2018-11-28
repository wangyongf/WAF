import 'package:flutter/material.dart';

class DividerHelper {
  /// 默认的分割线
  static Widget get() {
    return getD(1, 0, const Color(0xFFDCDCDC));
  }

  /// 短分割线
  static Widget short() {
    return getD(1, 20, const Color(0xFFDCDCDC));
  }

  static Widget getD(double height, double indent, Color color) {
    return Divider(
      height: height,
      indent: indent,
      color: color,
    );
  }
}
