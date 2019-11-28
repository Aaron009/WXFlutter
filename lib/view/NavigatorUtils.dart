import 'package:flutter/material.dart';
import 'package:wxfluuter/view/LanguagePage.dart';
import 'package:wxfluuter/view/home/HomePage.dart';
import 'package:wxfluuter/view/LoginPage.dart';
import 'package:wxfluuter/view/WelcomePage.dart';
import 'package:wxfluuter/view/login_screen.dart';

class NavigatorUtils {
  /// 欢迎界面
  static const String welcome = "/";

  /// 登陆
  static const String login = "login";

  /// 主页
  static const String home = "home";
  static const String language = "language";

  static getRoutes(context) {
    return {
      welcome: NavigatorHandler(routeName: welcome).execute,
      login: NavigatorHandler(routeName: login).execute,
      home: NavigatorHandler(routeName: home).execute,
      language: NavigatorHandler(routeName: language).execute,
    };
  }

  static handleRoute(routeName, content) {
    switch (routeName) {
      case welcome:
        return WelcomePage();
      case login:
<<<<<<< HEAD
          return LoginScreen();
          // return LoginPage();
=======
        return LoginPage();
>>>>>>> 53122602def4cdbf0faa02dd266160a1b5b8f1d4
      case home:
        return HomePage();
      case language:
        return LanguagePage();
    }
  }

  ///登录页
  static goLogin(content) {
    Navigator.pushReplacementNamed(content, login);
  }

  static goView(content, String routeName) {
    Navigator.pushNamed(content, routeName);
  }
}

class NavigatorHandler {
  String routeName;

  NavigatorHandler({this.routeName});

  Widget execute(BuildContext content) {
    return NavigatorUtils.handleRoute(routeName, content);
  }
}
