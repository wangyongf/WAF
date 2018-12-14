import 'package:flutter/material.dart';

class DividerHelper {
  /// 默认的分割线
  static Widget get() {
    return getD(0.2, 0, Color(0xFFDCDCDC));
  }

  /// 短分割线
  static Widget short() {
    return getD(0.2, 20, Color(0xFFDCDCDC));
  }

  static Widget getD(double height, double indent, Color color) {
    return Divider(
      height: height,
      indent: indent,
      color: color,
    );
  }
}
