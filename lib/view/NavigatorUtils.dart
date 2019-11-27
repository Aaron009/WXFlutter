import 'package:flutter/material.dart';
import 'package:wxfluuter/view/LanguagePage.dart';
import 'package:wxfluuter/view/home/HomePage.dart';
import 'package:wxfluuter/view/LoginPage.dart';
import 'package:wxfluuter/view/WelcomePage.dart';

class NavigatorUtils {

  /// 欢迎界面
  static const String welcome = "/";
  /// 登陆
  static const String login = "login";
  /// 主页
  static const String home = "home";
  static const String language = "language";

  static var currentContext;

  static getRoutes(context) {
      return {
        welcome: NavigatorHandler(routeName: welcome).execute,
        login: NavigatorHandler(routeName: login).execute,
        home: NavigatorHandler(routeName: home).execute,
        language: NavigatorHandler(routeName: language).execute,
      };
  }

  static handleRoute(routeName, content) {
    currentContext = content;

    switch(routeName) {
      case welcome:
          return WelcomePage();
      case login:
          return LoginPage();
      case home:
          return HomePage();
      case language:
        return LanguagePage();
    }
  }

  ///登录页
  static goLogin() {
    Navigator.pushReplacementNamed(currentContext, login);
  }

  static goView(String routeName) {
//    Navigator.pushReplacementNamed(currentContext, routeName);
    Navigator.pushNamed(currentContext, routeName);
  }
}

class NavigatorHandler {
  String routeName;

  NavigatorHandler({this.routeName});

  Widget execute(BuildContext content) {
    return NavigatorUtils.handleRoute(routeName, content);
  }
}
