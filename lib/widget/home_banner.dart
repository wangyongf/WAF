import 'dart:async';

import 'package:daily_purify/model/hot_news_model.dart';
import 'package:daily_purify/util/route_util.dart';
import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

class HomeBanner extends StatefulWidget {
  final _homeBannerHeight;

  final List<HotNewsTopStoriesModel> topList;

  HomeBanner(this.topList, this._homeBannerHeight);

  @override
  State<StatefulWidget> createState() {
    return _HomeBannerState();
  }
}

class _HomeBannerState extends State<HomeBanner> {
  static int fakeLength = 1000;

  int _curPageIndex = 0;

  int _curIndicatorsIndex = 0;

  PageController _pageController =
      PageController(initialPage: fakeLength ~/ 2, keepPage: true);

  List<Widget> _indicators = [];

  List<HotNewsTopStoriesModel> _fakeList = [];

  Duration _bannerDuration = Duration(seconds: 5);

  Duration _bannerAnimationDuration = Duration(milliseconds: 500);

  Timer _timer;

  bool reverse = false;

  bool _enableAutoScroll = true;

  @override
  void initState() {
    super.initState();
    _curPageIndex = fakeLength ~/ 2;

    initTimer();
  }

  @override
  void dispose() {
    super.dispose();
    _timer.cancel();
  }

  //通过时间timer做轮询，达到自动播放的效果
  initTimer() {
    _timer = Timer.periodic(_bannerDuration, (timer) {
      if (_enableAutoScroll) {
        _pageController.animateToPage(_curPageIndex + 1,
            duration: _bannerAnimationDuration, curve: Curves.linear);
      }
    });
  }

  //用于做banner循环
  _setupFakeList() {
    for (int i = 0; i < fakeLength; i++) {
      _fakeList.addAll(widget.topList);
    }
  }

  _setupIndicators() {
    _indicators.clear();
    for (int i = 0; i < widget.topList.length; i++) {
      _indicators.add(SizedBox(
        child: Container(
          width: 10.0,
          height: 10.0,
          // TODO: Flutter 中如何更好地实现圆角的指示器？（可以自由控制大小）
          decoration: BoxDecoration(
              color: i == _curIndicatorsIndex ? Colors.white : Colors.grey,
              shape: BoxShape.circle),
        ),
      ));
    }
  }

  _onBannerPageChanged(int index) {
    _curPageIndex = index;
    //获取指示器索引
    _curIndicatorsIndex = index % widget.topList.length;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return _buildBanner();
  }

  // 首页 Banner
  Widget _buildBanner() {
    return Container(
      height: widget._homeBannerHeight,
      //指示器覆盖在pagerview上，所以用Stack
      child: Stack(
        children: <Widget>[
          _buildPagerView(),
          _buildIndicators(),
        ],
      ),
    );
  }

  // 创建指示器
  Widget _buildIndicators() {
    _setupIndicators();
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
          color: Colors.black45,
          height: 20.0,
          child: Center(
            child: SizedBox(
              width: widget.topList.length * 16.0,
              height: 5.0,
              child: Row(
                children: _indicators,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              ),
            ),
          )),
    );
  }

  // 可滑动的 ViewPager
  Widget _buildPagerView() {
    _setupFakeList();
    //检查手指和自动播放的是否冲突，如果滚动停止开启自动播放，反之停止自动播放
    return NotificationListener(
        onNotification: (ScrollNotification scrollNotification) {
          if (scrollNotification is ScrollEndNotification ||
              scrollNotification is UserScrollNotification) {
            _enableAutoScroll = true;
          } else {
            _enableAutoScroll = false;
          }
          return false;
        },
        child: PageView.builder(
          controller: _pageController,
          itemBuilder: (BuildContext context, int index) {
            return _buildItem(context, index);
          },
          itemCount: _fakeList.length,
          onPageChanged: (index) {
            _onBannerPageChanged(index);
          },
        ));
  }

  Widget _buildItem(BuildContext context, int index) {
    HotNewsTopStoriesModel item = _fakeList[index];
    return GestureDetector(
      onTap: () {
        RouteUtil.route2Detail(context, '${item.id}'); // 通过路由跳转到详情
      },
      child: GestureDetector(
        onTapDown: (donw) {
          _enableAutoScroll = false;
        },
        onTapUp: (up) {
          _enableAutoScroll = true;
        },
        child: FadeInImage.memoryNetwork(
            placeholder: kTransparentImage,
            image: item.image,
            height: widget._homeBannerHeight,
            fit: BoxFit.fitWidth),
      ),
    );
  }
}
