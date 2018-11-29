import 'package:daily_purify/util/divider_helper.dart';
import 'package:flutter/material.dart';

/// 统一设置项
class UnifySettingWidget extends StatelessWidget {
  /// header
  final Widget header;

  /// 背景颜色
  final Color color;

  // 左侧的图标
  final Icon leading;

  // 标题
  final Text title;

  // 副标题
  final Text subTitle;

  // 右侧主文案
  final Text content;

  // 右侧副文案
  final Text subContent;

  // 放在 trailing 之前的，表状态，比如一个头像，或者是状态的文字描述
  final Widget trailingStatus;

  // trailing，比如 Icon
  final Widget trailing;

  // 底部是否显示短分割线，TODO: 换成 footer
  final bool shortDivider;

  /// margin
  final EdgeInsets margin;

  /// padding
  final EdgeInsets padding;

  UnifySettingWidget(
      {Key key,
      EdgeInsets margin,
      EdgeInsets padding,
      this.header,
      Color color,
      this.leading,
      @required String title,
      String subTitle,
      String content,
      String subContent,
      this.trailingStatus,
      this.trailing,
      shortDivider})
      : margin = margin ?? const EdgeInsets.all(0),
        padding = padding ?? const EdgeInsets.all(0),
        color = color ?? Colors.white,
        title = (title != null && title.isNotEmpty)
            ? Text(
                title,
                style: TextStyle(fontSize: 15.5),
              )
            : null,
        subTitle = (subTitle != null && subTitle.isNotEmpty)
            ? Text(
                subTitle,
                style: TextStyle(fontSize: 12),
              )
            : null,
        content = (content != null && content.isNotEmpty)
            ? Text(
                content,
                style: TextStyle(fontSize: 15.5),
              )
            : null,
        subContent = (subContent != null && subContent.isNotEmpty)
            ? Text(
                subContent,
                style: TextStyle(fontSize: 13),
              )
            : null,
        shortDivider = shortDivider ?? false,
        assert(title != null),
        assert((subContent != null && content != null) || subContent == null),
        assert((content == null && subContent == null) || content != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      padding: padding,
      color: color,
      child: Column(
        children: <Widget>[
          header ?? Container(),
          Container(
            padding: const EdgeInsets.only(left: 16, top: 0, right: 16),
            margin: const EdgeInsets.all(0),
            height: 52,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                _buildLeading(),
                _buildTitle(),
                _buildSpace(),
                _buildContent(),
              ],
            ),
          ),
          DividerHelper.getD(0.2, _getIndent(), const Color(0xFFDCDCDC)),
        ],
      ),
    );
  }

  double _getIndent() {
    return this.shortDivider ? 20 : 0;
  }

  Widget _buildLeading() {
    if (leading != null) {
      return Padding(
        padding: const EdgeInsets.only(right: 8),
        child: leading,
      );
    } else {
      return Container();
    }
  }

  Widget _buildTitle() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[title ?? Container(), subTitle ?? Container()],
    );
  }

  Widget _buildSpace() {
    return Expanded(child: Container());
  }

  Widget _buildContent() {
    if (trailing != null || trailingStatus != null) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          trailingStatus ?? Container(),
          trailing ?? Container(),
        ],
      );
    } else {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[content ?? Container(), subContent ?? Container()],
      );
    }
  }
}
