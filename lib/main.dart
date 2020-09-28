import 'dart:io';

import 'package:demo/%E4%BB%BF%E5%BE%AE%E4%BF%A1%E8%81%8A%E5%A4%A9/main_chat.dart';
import 'package:demo/%E7%80%91%E5%B8%83%E6%B5%81/main.dart';
import 'package:flutter/material.dart';
import 'package:demo/homepage/ScaffoldRoute.dart';
import 'package:flutter/services.dart';

import 'tools/MyColors.dart';

void main() {
  //安卓沉浸式效果
  if (Platform.isAndroid) {
    SystemUiOverlayStyle systemUiOverlayStyle =
        SystemUiOverlayStyle(statusBarColor: Colors.transparent);
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  }
  //强制竖屏显示,打包apk时需要放开注释
  // SystemChrome.setPreferredOrientations([
  //   DeviceOrientation.portraitUp, //只能纵向
  //   DeviceOrientation.portraitDown, //只能纵向
  // ]);

  runApp(MyApp(
    title: "Flutter Demo",
  ));
}

class MyApp extends StatefulWidget {
  final String title;
  MyApp({Key key, this.title}) : super(key: key);
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  //底部导航栏
  var bottmBar = [ScaffoldRoute(title: "Flutter Demo"), LeaveMessage(),MyWeChatApp()];
  //底部导航栏 选择
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: widget.title,
        theme: ThemeData(
          // is not restarted.
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: Scaffold(
          body: bottmBar[_selectedIndex],
          bottomNavigationBar: 
          //悬浮式的底部导航
          // BottomAppBar(
          //   color: Colors.white,
          //   shape: CircularNotchedRectangle(), // 底部导航栏打一个圆形的洞
          //   child: Row(
          //     children: [
          //       IconButton(
          //         onPressed: () => _onItemTapped(0),
          //         icon: Icon(Icons.home),
          //         color:
          //             _selectedIndex == 0 ? Color(0xdd0ec5c9) : Colors.black26,
          //       ),
          //       SizedBox(), //中间位置空出
          //       IconButton(
          //         onPressed: () => _onItemTapped(1),
          //         icon: Icon(Icons.business),
          //         color:
          //             _selectedIndex == 1 ? Color(0xdd0ec5c9) : Colors.black26,
          //       ),
          //     ],
          //     mainAxisAlignment: MainAxisAlignment.spaceAround, //均分底部导航栏横向空间
          //   ),
          // ),
          // floatingActionButton: ClipOval(
          //   child: Container(
          //     width: 50,
          //     height: 50,
          //     decoration: myGradientColor,
          //     child: FloatingActionButton(
          //         shape: RoundedRectangleBorder(
          //             borderRadius: BorderRadius.circular(25)),
          //         backgroundColor: Colors.transparent, // 设为透明色
          //         elevation: 0, // 正常时阴影隐藏
          //         highlightElevation: 0, // 点击时阴影隐藏
          //         onPressed: () async {
          //           final result = await Navigator.of(context).push(
          //               MaterialPageRoute(builder: (context) => Message()));
          //           Scaffold.of(context)
          //             ..removeCurrentSnackBar()
          //             ..showSnackBar(SnackBar(content: Text('$result')));
          //         },
          //         child: Center(
          //           child: Container(
          //             alignment: Alignment.center,
          //             child: Icon(Icons.add, color: Colors.white),
          //           ),
          //         )),
          //   ),
          // ),
          // floatingActionButtonLocation:
          //     FloatingActionButtonLocation.centerDocked,


          //普通底部导航
           BottomNavigationBar(
            // 底部导航
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('首页')),
              BottomNavigationBarItem(
                  icon: Icon(Icons.message), title: Text('留言墙')),
              BottomNavigationBarItem(
                  icon: Icon(Icons.comment), title: Text('聊天')),
            ],
            currentIndex: _selectedIndex,
            fixedColor: Color(0xdd0ec5c9),
            onTap: _onItemTapped,
          ),
          
        ));
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
