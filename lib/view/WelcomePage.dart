import 'package:flutter/material.dart';
import 'package:wxfluuter/view/NavigatorUtils.dart';

class WelcomePage extends StatefulWidget {
  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    new Future.delayed(const Duration(seconds: 2, milliseconds: 500), () {
        NavigatorUtils.goLogin();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Stack(
        children: <Widget>[
          new Center(
            child: Image(
              image: new AssetImage('assets/welcome/timg.jpg'),
            ),
          )
        ],
      ),
    );
  }
}
