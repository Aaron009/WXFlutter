import 'dart:async';

import 'package:intl/intl.dart';
import 'package:flutter/widgets.dart';
import 'package:wxfluuter/l10n/messages_all.dart';

// 使用教程地址： https://www.jianshu.com/p/82c6656462b8
class AppStrings {
  AppStrings(Locale locale) : _localeName = locale.toString();

  final String _localeName;

  static Future<AppStrings> load(Locale locale) {
    return initializeMessages(locale.toString())
        .then((Object _) {
      return new AppStrings(locale);
    });
  }

  static AppStrings of(BuildContext context) {
    return Localizations.of<AppStrings>(context, AppStrings);
  }

  String title() {
    return Intl.message(
      'Localization Demo',
      name: 'title',
      desc: '应用标题',
      locale: _localeName,
    );
  }

  String click() => Intl.message(
    'Click',
    name: 'click',
    desc: '点击',
    locale: _localeName,
  );

  String helloFromDemo() => Intl.message(
    'Hello~',
    name: 'helloFromDemo',
    desc: '一句问候',
    locale: _localeName,
  );

  String get language {
    return Intl.message(
      'Language',
      name: 'language',
      desc: '语言',
      locale: _localeName,
    );
  }

  String get switchLanguage {
    return Intl.message(
      'Switch Language',
      name: 'switchLanguage',
      desc: '切换语言',
      locale: _localeName,
    );
  }

  String get login {
    return Intl.message(
      'Login',
      name: 'login',
      desc: '登陆',
      locale: _localeName,
    );
  }

  String get registered {
    return Intl.message(
      'Registered',
      name: 'registered',
      desc: '注册',
      locale: _localeName,
    );
  }

  String get enterYourAccount {
    return Intl.message(
      'Please enter your account',
      name: 'enterYourAccount',
      desc: '请输入账号',
      locale: _localeName,
    );
  }

  String get enterYourPassword {
    return Intl.message(
      'Please enter your password',
      name: 'enterYourPassword',
      desc: '请输入密码',
      locale: _localeName,
    );
  }

}