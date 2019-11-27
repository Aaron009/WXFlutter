import 'dart:io';

import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:wxfluuter/view/NavigatorUtils.dart';
import 'index.dart';

void main() {
  // 初始化flustars
  SpUtil.getInstance();

  if (Platform.isAndroid) {
    // 透明状态栏
    SystemUiOverlayStyle systemUiOverlayStyle =
        SystemUiOverlayStyle(statusBarColor: Colors.transparent);
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  }

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    print("Myapp build");

    return MultiProvider(
      providers: <SingleChildCloneableWidget>[
        ChangeNotifierProvider.value(value: ThemeModel()),
        ChangeNotifierProvider.value(value: LocaleModel()),
      ],

      child: Consumer2<ThemeModel, LocaleModel>(builder:
          (BuildContext context, themeModel, localeModel, Widget child) {
        return MaterialApp(
            debugShowCheckedModeBanner: false,

            theme: themeModel.themeData,

            locale: localeModel.locale,
            supportedLocales: localeModel.supportedLocales,
            localizationsDelegates: localeModel.localizationsDelegates,
            localeResolutionCallback: localeModel.localeResolutionCallback,

            onGenerateTitle: (context) {
              return AppStrings.of(context).title();
            },

            routes: NavigatorUtils.getRoutes(context));
      }),
    );
  }
}
