import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wxfluuter/Iconfont.dart';
import 'package:wxfluuter/view/home/HomeDrawer.dart';
import 'package:wxfluuter/view/home/SubView.dart';
import 'package:wxfluuter/widget/TabBarWidget.dart';
import 'package:wxfluuter/widget/TitleBar.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  Future<bool> _dialogExitApp(BuildContext context) async {
    return Future.value(false);
  }

  _renderTab(icon, text) {
    return new Tab(
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[new Icon(icon, size: 16.0), new Text(text)],
      ),
    );
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    List<Widget> tabs = [
      _renderTab(Iconfont.yonghu, '动态'),
      _renderTab(Iconfont.yonghu, '趋势'),
      _renderTab(Iconfont.yonghu, '我的'),
    ];

    ///增加返回按键监听
    return WillPopScope(
      onWillPop: () {
        return _dialogExitApp(context);
      },
      child: TabBarWidget(
        drawer: new HomeDrawer(),
        type: TabType.bottom,
        tabItems: tabs,
        tabViews: [
          SubView(title: "页面一"),
          SubView(title: "页面二"),
          SubView(title: "页面三"),
//          new DynamicPage(key: dynamicKey),
//          new TrendPage(key: trendKey),
//          new MyPage(key: myKey),
        ],
        onDoublePress: (index) {
          switch (index) {
//            case 0:
//              dynamicKey.currentState.scrollToTop();
//              break;
//            case 1:
//              trendKey.currentState.scrollToTop();
//              break;
//            case 2:
//              myKey.currentState.scrollToTop();
//              break;
          }
        },
        backgroundColor: Colors.black12,
        indicatorColor: Colors.white,
        title: TitleBar(
          'app_name',
          iconData: Iconfont.mima,
          needRightLocalIcon: true,
          onPressed: () {
//            NavigatorUtils.goSearchPage(context);
          },
        ),
      ),
    );
  }
}
