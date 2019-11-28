import 'package:flutter/material.dart';
import 'package:wxfluuter/index.dart';
import 'package:wxfluuter/style/StyleConstant.dart';

class HomeDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    Size size = mediaQueryData.size;
    return Material(
      child: Builder(
        builder: (context) {
          return SizedBox(
            width: size.width,
            //侧边栏按钮Drawer
            child: Drawer(
              child: new Container(
                child: new SingleChildScrollView(
                  ///item 背景
                  child: Container(
                    constraints: new BoxConstraints(
                        minWidth: size.width, minHeight: size.height),
                    child: new Material(
                      color: Colors.grey,
                      child: new Column(
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(
                                left: 10, top: 25, right: 10, bottom: 10),
                            child: Flex(
                              direction: Axis.horizontal,
                              children: <Widget>[
                                Expanded(
                                  flex: 1,
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Row(
                                      children: <Widget>[
                                        Icon(Icons.color_lens),
                                        Container(
                                          margin: EdgeInsets.only(left: 10),
                                          child: Text('打卡'),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Align(
                                    alignment: Alignment.centerRight,
                                    child: InkWell(
                                      onTap: () {
                                        Navigator.pop(context);
                                      },
                                      child: Icon(Icons.clear),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          UserAccountsDrawerHeader(
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
                                backgroundImage:
                                    AssetImage('assets/welcome/timg.jpg'),
                              ),
                            ),
                            decoration: new BoxDecoration(
                              //用一个BoxDecoration装饰器提供背景图片
                              color: Colors.white,
                            ),
                          ),

                          ListTile(
                              leading: Icon(Icons.home),
                              title: new Text(
                                "点我了解会员",
                                style: StyleConstant.normalText,
                              ),
                              trailing: Icon(Icons.keyboard_arrow_right),
                              onTap: () {}),

                          ListTile(
                              leading: Icon(Icons.home),
                              title: new Text(
                                "我的钱包",
                                style: StyleConstant.normalText,
                              ),
                              trailing: Icon(Icons.keyboard_arrow_right),
                              onTap: () {}),

                          ListTile(
                              leading: Icon(Icons.home),
                              title: new Text(
                                "我的个性装扮",
                                style: StyleConstant.normalText,
                              ),
                              trailing: Icon(Icons.keyboard_arrow_right),
                              onTap: () {}),

                          ListTile(
                              leading: Icon(Icons.home),
                              title: new Text(
                                "我的个性装扮",
                                style: StyleConstant.normalText,
                              ),
                              trailing: Icon(Icons.keyboard_arrow_right),
                              onTap: () {}),

                          ListTile(
                              leading: Icon(Icons.home),
                              title: new Text(
                                "我的收藏",
                                style: StyleConstant.normalText,
                              ),
                              trailing: Icon(Icons.keyboard_arrow_right),
                              onTap: () {}),

//                          ListTile(
//                              leading: Icon(Icons.home),
//                              title: new Text(
//                                "我的相册",
//                                style: StyleConstant.normalText,
//                              ),
//                              trailing: Icon(Icons.keyboard_arrow_right),
//                              onTap: () {}),

//                          ListTile(
//                              leading: Icon(Icons.home),
//                              title: new Text(
//                                "我的文件",
//                                style: StyleConstant.normalText,
//                              ),
//                              trailing: Icon(Icons.keyboard_arrow_right),
//                              onTap: () {}),


                          Container(
                            margin: EdgeInsets.only(left: 20),
                            child: Row(
                              children: <Widget>[
                                Column(
                                  children: <Widget>[
                                    Icon(Icons.ac_unit,size: 40,),
                                    Text('设置'),
                                  ],
                                ),
                                SizedBox(width: 20,),
                                Column(
                                  children: <Widget>[
                                    Icon(Icons.ac_unit,size: 40,),
                                    Text('夜间'),
                                  ],
                                ),
                                SizedBox(width: 20,),
                                Column(
                                  children: <Widget>[
                                    Icon(Icons.ac_unit,size: 40,),
                                    Text('浦东新区'),
                                  ],
                                ),
                              ],
                            ),
                          )

                        ],
                      ),
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
