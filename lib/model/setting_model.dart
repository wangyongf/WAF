import 'package:flutter/material.dart';

enum SettingItemType {
  Title, // 标题栏
  Setting, // 普通的设置项
  Divider, // 分割线
  Space, // 空白空间
  ShortDivider, // 短分割线
}

class SettingItem {
  final SettingItemType type;
  final Icon leading;
  final String title;
  final String subTitle;
  final Icon trailing;

  const SettingItem(
      {this.type = SettingItemType.Setting,
      this.leading,
      this.title,
      this.subTitle,
      this.trailing});
}

const List<SettingItem> settings = const <SettingItem>[
  const SettingItem(type: SettingItemType.Title),
  const SettingItem(
      type: SettingItemType.Setting,
      leading: Icon(
        Icons.account_circle,
        size: 33,
      ),
      title: "立刻登录",
      trailing: Icon(Icons.chevron_right)),
  const SettingItem(type: SettingItemType.Space),
  const SettingItem(
      type: SettingItemType.Setting,
      title: "在线客服",
      trailing: Icon(Icons.chevron_right)),
  const SettingItem(type: SettingItemType.ShortDivider),
  const SettingItem(
    type: SettingItemType.Setting,
    title: "帮助与反馈",
    trailing: Icon(Icons.chevron_right),
  ),
  const SettingItem(type: SettingItemType.Space),
  const SettingItem(
      type: SettingItemType.Setting,
      title: "关于挖财宝",
      trailing: Icon(Icons.chevron_right)),
  const SettingItem(type: SettingItemType.ShortDivider),
  const SettingItem(
      type: SettingItemType.Setting,
      title: "了解挖财",
      trailing: Icon(Icons.chevron_right)),
  const SettingItem(type: SettingItemType.Divider)
];
