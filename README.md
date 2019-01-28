
# WAF - WanAndroid Flutter

- WanAndroid: http://www.wanandroid.com
- API: [玩Android 开放API](http://www.wanandroid.com/blog/show/2)

## Announcing WAF - WanAndroid Flutter

WAF - WanAndroid Flutter, yet another WanAndroid Client written in Flutter.

感谢[玩Android 开放API](http://www.wanandroid.com/blog/show/2) 提供的 API，
WAF 项目完全开源，单纯为了学习 Flutter，在开发的过程中参考了大量的开源项目，希望大家喜欢。

后续会将未来学到的 Flutter 新知识点应用到该项目，争取持续更新~

## 页面截图

<img src="https://raw.githubusercontent.com/wangyongf/blog-imgs/master/picgo/20181222232327.png" width="200"><img src="https://raw.githubusercontent.com/wangyongf/blog-imgs/master/picgo/20181222232733.png" width="200"><img src="https://raw.githubusercontent.com/wangyongf/blog-imgs/master/picgo/20181223001342.png" width="200"><img src="https://raw.githubusercontent.com/wangyongf/blog-imgs/master/picgo/20181223001403.png" width="200"><img src="https://raw.githubusercontent.com/wangyongf/blog-imgs/master/picgo/20181223001422.png" width="200"><img src="https://raw.githubusercontent.com/wangyongf/blog-imgs/master/picgo/20181223001438.png" width="200"><img src="https://raw.githubusercontent.com/wangyongf/blog-imgs/master/picgo/20181223001456.png" width="200"><img src="https://raw.githubusercontent.com/wangyongf/blog-imgs/master/picgo/20181223001525.png" width="200"><img src="https://raw.githubusercontent.com/wangyongf/blog-imgs/master/picgo/20181223001547.png" width="200"><img src="https://raw.githubusercontent.com/wangyongf/blog-imgs/master/picgo/20181223001602.png" width="200"><img src="https://raw.githubusercontent.com/wangyongf/blog-imgs/master/picgo/20181223001633.png" width="200"><img src="https://raw.githubusercontent.com/wangyongf/blog-imgs/master/picgo/20181223001652.png" width="200"><img src="https://raw.githubusercontent.com/wangyongf/blog-imgs/master/picgo/20181223001728.png" width="200"><img src="https://raw.githubusercontent.com/wangyongf/blog-imgs/master/picgo/20181223001744.png" width="200"><img src="https://raw.githubusercontent.com/wangyongf/blog-imgs/master/picgo/20181223001811.png" width="200"><img src="https://raw.githubusercontent.com/wangyongf/blog-imgs/master/picgo/20181223001855.png" width="200">

## 功能列表

- [x] 首页
    - [x] 首页 Banner
    - [x] 首页文章列表
    - [x] 文章列表页下拉刷新支持
    - [ ] 文章列表数据缓存 (using flutter-mmkv?)
- [x] 项目
    - [x] 项目列表
    - [x] 项目文章详情
- [x] 公众号
    - [x] 公众号列表
    - [x] 公众号文章详情
- [x] 知识体系
    - [x] 知识体系列表
    - [x] 知识体系详情
- [x] 个人中心
    - [x] 用户信息
    - [x] 我的收藏
        - [x] 收藏文章列表
        - [ ] 修复收藏页面取消收藏后收藏状态不正确的问题
    - [x] 登录/注册
        - [x] 登录/注册页
        - [x] 退出登录
        - [x] 登录/注册页的小灰线修复
        - [x] 登录/注册页面适配
    - [x] 意见反馈
        - [x] UI
        - [x] 意见反馈页面自动新建 issue
    - [x] 设置
        - [x] 关于
            - [x] 应用市场评分
        - [ ] 检查更新
        - [ ] 主题
            - [ ] 基本的主题功能
            - [ ] 变色龙，参考IT之家
- [ ] 其他
    - [ ] 侧滑关闭当前页面
    - [ ] WebView 功能优化

## How to build locally

1. Android: `flutter build apk`
2. iOS: 暂未测试

## 站在巨人的肩膀上

0. [Flutter](https://flutter.io)
1. [玩Android 开放API](http://www.wanandroid.com/blog/show/2)
2. [daily_purify（知乎日报Flutter版）](https://github.com/izzyleung/ZhihuDailyPurify)
3. [hurshi/wanandroid](https://github.com/hurshi/wanandroid)
4. [samarthagarwal/FlutterScreens](https://github.com/samarthagarwal/FlutterScreens)

## License

Copyright 2018 wangyongf

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express
or implied. See the License for the specific language governing
permissions and limitations under the License.
