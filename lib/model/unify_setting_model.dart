import 'package:flutter/material.dart';

class UnifySettingItem {
  final Icon leading;
  final String title;
  final String subTitle;
  final String content;
  final String subContent;
  final Icon trailing;
  final bool shortDivider;

  const UnifySettingItem(
      {this.leading,
      this.title,
      this.subTitle,
      this.content,
      this.subContent,
      this.trailing,
      this.shortDivider});
}

const List<UnifySettingItem> about = const <UnifySettingItem>[
  const UnifySettingItem(
      title: "网址", content: "https://www.wacai.com", shortDivider: true),
  const UnifySettingItem(
      title: "WAP", content: "https://wacai.cn", shortDivider: true),
  const UnifySettingItem(
      title: "邮箱", content: "kf@wacai.com", shortDivider: true),
  const UnifySettingItem(
      title: "挖财客服电话",
      content: "400-711-8718",
      subContent: "(工作日 9:00-18:00)",
      shortDivider: true),
  const UnifySettingItem(
      title: "杭州市互联网金融服务热线",
      content: "400-001-8078",
      subContent: "(工作日 9:00-17:00)",
      shortDivider: true),
  const UnifySettingItem(
      title: "微信公众号",
      content: "挖财宝",
      subContent: "(微信搜索：wacaibao)",
      shortDivider: true),
  const UnifySettingItem(title: "新浪官方微博", trailing: Icon(Icons.chevron_right))
];
