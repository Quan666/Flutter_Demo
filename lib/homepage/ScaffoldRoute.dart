import 'package:demo/%E7%80%91%E5%B8%83%E6%B5%81/main.dart';
import 'package:demo/tools/MyColors.dart';
import 'package:flutter/material.dart';


import 'MyDrawer.dart';


class ScaffoldRoute extends StatefulWidget {
  final String title;
  ScaffoldRoute({Key key, this.title}) : super(key: key);
  @override
  _ScaffoldRouteState createState() => _ScaffoldRouteState();
}

class _ScaffoldRouteState extends State<ScaffoldRoute>
    with SingleTickerProviderStateMixin {
  //顶部选项卡
  TabController _tabController; //需要定义一个Controller
  List tabs = ["新闻", "历史", "图片"];

  @override
  void initState() {
    super.initState();
    // 创建Controller
    _tabController = TabController(length: tabs.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    _tabController.addListener(() {
      switch (_tabController.index) {
        case 1:
          ;
          break;
        case 2:
          ;
          break;
      }
    });
    return Scaffold(
      appBar: AppBar(
        //导航栏
        title: Text(widget.title),

        bottom: TabBar(
            //生成Tab菜单
            controller: _tabController,
            tabs: tabs.map((e) => Tab(text: e)).toList()),
        flexibleSpace: Container(
          decoration: myGradientColor,
        ),
        actions: <Widget>[
          //导航栏右侧菜单
          IconButton(icon: Icon(Icons.share), onPressed: () {}),
        ],
      ),

      drawer: new MyDrawer(), //抽屉
      body: TabBarView(
        controller: _tabController,
        children: tabs.map((e) {
          //创建3个Tab页
          return Container(
            alignment: Alignment.center,
            child: Text(e, textScaleFactor: 5),
          );
        }).toList(),
      ),
    );
  }

}

