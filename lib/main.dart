import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme:
          ThemeData(primaryColor: Colors.white, primarySwatch: Colors.orange),
      home: MyHomePage(title: 'Flutter'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final title;

  MyHomePage({Key key, this.title}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  ScrollController _scrollController;
  TextStyle _tabStyle = TextStyle(
      color: Colors.black87, fontSize: 15.0, fontWeight: FontWeight.w500);
  var _tabs = ['视频资源', '插件推荐', 'Codelabs', '中文社区', '使用镜像'];
  var hasEnoughTabSpace = true;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 5);
    _scrollController = ScrollController();
  }

  @override
  Widget build(BuildContext context) {
    hasEnoughTabSpace =
        MediaQuery.of(context).size.width > 800.0; //TODO 跟屏幕实际高度关联起来
    print('width:${MediaQuery.of(context).size.width}');
    return Scaffold(
      appBar: AppBar(
        actions: hasEnoughTabSpace
            ? null
            : <Widget>[
                IconButton(
                  icon: Icon(Icons.menu),
                  onPressed: () {},
                ),
                SizedBox(
                  width: 30.0,
                )
              ],
        centerTitle: true,
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 45.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Image.asset(
                'assets/images/icon.ico',
                height: 36.0,
              ),
              SizedBox(
                width: 18.0,
              ),
              Text(
                widget.title,
                style: TextStyle(fontSize: 25.0, color: Colors.black87),
              ),
              Expanded(
                child: Container(),
              ),
              if (hasEnoughTabSpace)
                Container(
                  width: 500.0,
                  child: TabBar(
                    indicatorSize: TabBarIndicatorSize.label,
                    indicatorColor: Colors.deepOrange,
                    controller: _tabController,
                    indicatorWeight: 4.0,
                    tabs: <Widget>[
                      for (int i = 0; i < _tabController.length; i++)
                        _buildTabs(i),
                    ],
                    onTap: (index) {},
                  ),
                ),
              if (hasEnoughTabSpace)
                SizedBox(
                  width: 15.0,
                ),
              if (hasEnoughTabSpace)
                FlatButton(
                  color: Colors.deepOrange,
                  child: Text(
                    '开始使用',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 16.0),
                  ),
                  onPressed: () {},
                )
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          children: <Widget>[
            Container(
              height: 330.0,
              color: Colors.green,
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text(
                      'Flutter 1.12 发布',
                      style: TextStyle(
                          fontSize: 60.0, fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      height: 8.0,
                    ),
                    Container(
                      width: 700.0,
                      child: Text(
                        'Flutter 是 Google开源的UI工具包，帮助开发者通过一套代码库高效构建多平台精美应用，支持移动、Web、桌面和嵌入式平台。',
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 20.0,
                            color: Colors.black87),
                      ),
                    ),
                    SizedBox(height: 20.0,),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        FlatButton(
                          color: Colors.deepOrange,
                          onPressed: () {},
                          child: Text(
                            '中文文档',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16.0
                                ,fontWeight: FontWeight.w500
                            ),
                          ),
                        ), SizedBox(width: 50.0,),FlatButton(
//                          color: Colors,
                            onPressed: () {},
                            child: Text(
                              '官方文档（英文）',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16.0
                                  ,fontWeight: FontWeight.w500
                              ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  _buildTabs(int index) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Text(_tabs[index], style: _tabStyle),
    );
  }
}
