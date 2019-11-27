import 'package:flutter/material.dart';
import 'package:wxfluuter/style/StyleConstant.dart';

class HomeDrawer extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Builder(builder: (context) {
          return new Drawer(
            ///侧边栏按钮Drawer
            child: new Container(
              ///默认背景
              color: Colors.white,
              child: new SingleChildScrollView(
                ///item 背景
                child: Container(
                  constraints: new BoxConstraints(
                      minHeight: MediaQuery.of(context).size.height),
                  child: new Material(
                    color: Colors.white,
                    child: new Column(
                      children: <Widget>[
                        new UserAccountsDrawerHeader(
                          //Material内置控件
                          accountName: new Text(
                            'admin',
                            style: StyleConstant.normalTextLight,
                          ),
                          accountEmail: new Text(
                            "12321@qq.com",
                            style: StyleConstant.normalTextLight,
                          ),

                          currentAccountPicture: new GestureDetector(
                            //用户头像
                            onTap: () {},
                            child: new CircleAvatar(
                              //圆形图标控件
                              //backgroundImage: NetworkImage(),
                              backgroundImage: AssetImage('assets/welcome/timg.jpg'),
                            ),
                          ),
                          decoration: new BoxDecoration(
                            //用一个BoxDecoration装饰器提供背景图片
                            color: Colors.white,
                          ),
                        ),
                        new ListTile(
                            title: new Text(
                              "我的钱包",
                              style: StyleConstant.normalText,
                            ),
                            onTap: () {}
                            ),
                        new ListTile(
                            title: new Text(
                              "个性装扮",
                              style: StyleConstant.normalText,
                            ),
                            onTap: () {}
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
