import 'package:flutter/material.dart';
import 'package:wxfluuter/view/NavigatorUtils.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    print("Myapp build");

    return MaterialApp(
      title: 'WeiXin Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      routes: NavigatorUtils.getRoutes(context),
//      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}