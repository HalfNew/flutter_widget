import 'package:flutter/material.dart';
import 'index_swiper.dart';


class GoodsContainer extends StatelessWidget {
  final tabs = <Tab>[
    new Tab(
      text: '精选',
    ),
    new Tab(
      text: '男装',
    ),
    new Tab(
      text: '男鞋',
    ),
    new Tab(
      text: '箱包',
    ),
    new Tab(
      text: '数码',
    ),
    new Tab(
      text: '居家',
    ),
    new Tab(
      text: '家电',
    ),
    new Tab(
      text: '美食',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: tabs.length,
        //顶部标题
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
                tabs: tabs,
                isScrollable: true,
                indicatorWeight: 1.0,
            ),
            title: TextField(
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(5.0),
                prefixIcon: Icon(Icons.search),
                hintText: '输入搜索内容',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              keyboardType: TextInputType.text,
            ),
          ),
          body: TabBarView(
            children: tabs.map((tab) {
              return Column(
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      IndexSwiper(),
                    ],
                  ),
                ],
              );
            }).toList(),
          ),
        ));
  }
}
