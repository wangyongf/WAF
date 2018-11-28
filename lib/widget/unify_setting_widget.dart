import 'package:flutter/material.dart';

/// 统一设置项
class UnifySettingWidget extends StatelessWidget {
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

  // 右侧图标
  final Icon trailing;

  // 底部是否显示短分割线
  final bool shortDivider;

  UnifySettingWidget(
      {Key key,
      this.leading,
      String title,
      String subTitle,
      String content,
      String subContent,
      this.trailing,
      shortDivider})
      : title = (title != null && title.isNotEmpty)
            ? Text(
                title,
                style: TextStyle(fontSize: 15.5),
              )
            : null,
        subTitle = (subTitle != null && subTitle.isNotEmpty)
            ? Text(
                subTitle,
                style: TextStyle(fontSize: 13),
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
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 16, right: 16),
          child: Container(
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
        ),
        Divider(
          height: 0.2,
          indent: this.shortDivider ? 20 : 0,
          color: const Color(0xFFDCDCDC),
        )
      ],
    );
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
    if (this.trailing != null) {
      return trailing;
    } else {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[content ?? Container(), subContent ?? Container()],
      );
    }
  }
}
