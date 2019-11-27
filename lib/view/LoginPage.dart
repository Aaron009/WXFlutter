import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wxfluuter/Iconfont.dart';
import 'package:wxfluuter/view/NavigatorUtils.dart';
import 'package:wxfluuter/widget/FlexButton.dart';
import 'package:wxfluuter/widget/InputWidget.dart';
import 'package:wxfluuter/index.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController userController = new TextEditingController();
  final TextEditingController pwController = new TextEditingController();
  var _userName = "";
  var _password = "";

  @override
  void initState() {
    super.initState();

    userController.text = "1111111";
    pwController.text = "22222";
  }

  @override
  Widget build(BuildContext context) {
    print("build  _userName:$_userName    _password:$_password");

    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: (){FocusScope.of(context);},
      child: Scaffold(
        body: Container(
          color: Theme.of(context).primaryColor,
          child: Center(
            child: SafeArea(
              child: SingleChildScrollView(
                child: Card(
                  elevation: 5.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                  color: Colors.white,
                  margin: EdgeInsets.only(left: 30, right: 30),
                  child: Padding(
                      padding: EdgeInsets.only(left: 30, top: 40, right: 30, bottom: 0),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            InputWidget(
                              hintText: "请输入账号",
                              iconData: Iconfont.yonghu,
                              obscureText: false,
                              onChanged: (String value) {
                                _userName = value;
                              },
                              controller: userController,
                            ),
                            Padding(padding: new EdgeInsets.all(30.0)),
                            InputWidget(
                              hintText: "请输入密码",
                              iconData: Iconfont.mima,
                              obscureText: true,
                              onChanged: (String value) {
                                _password = value;
                              },
                              controller: pwController,
                            ),
                            Padding(padding: new EdgeInsets.all(30.0)),
                            FlexButton(
                              text: '登陆',
                              color: Theme.of(context).primaryColor,
                              textColor: Colors.white,
                              onPress: pressLogin,
                            ),
                            Padding(padding: new EdgeInsets.only(top:5.0)),
                            RaisedButton(
                              color: Theme.of(context).primaryColor,
                              padding: new EdgeInsets.only(
                                  left: 20.0, top: 10.0, right: 20.0, bottom: 10.0),
                              child: Flex(
                                direction: Axis.horizontal,
                                children: <Widget>[
                                  Expanded(child: Text("注册", textAlign: TextAlign.center, style: new TextStyle(fontSize: 20),)),
                                ],
                              ),
                              textColor: Colors.white,
                              onPressed: pressRegister,
                            ),
                            Padding(padding: new EdgeInsets.only(top:30.0)),
                            InkWell(
                              onTap: () {
                                NavigatorUtils.goView(NavigatorUtils.language);
                              },
                              child: Text(
                                AppStrings.of(context).switchLanguage,
                              ),
                            ),
                            new Padding(padding: new EdgeInsets.all(15.0)),
                          ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      );
  }

  void pressLogin() {
      print('开始登陆 $_userName  $_password');
      NavigatorUtils.goView(NavigatorUtils.home);
  }

  void pressRegister() {
    print('注册 $_userName  $_password');

    ThemeModel themeMode = Provider.of<ThemeModel>(NavigatorUtils.currentContext);
    themeMode.changeTheme();
  }
}
