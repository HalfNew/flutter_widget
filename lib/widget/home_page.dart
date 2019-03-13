import 'package:flutter/material.dart';
import 'goods_container.dart';
import 'goods_list.dart';


class MenuContainer extends StatefulWidget{

  @override
  State createState() => _MenuContainer();

}

class _MenuContainer extends State<MenuContainer> {
  //默认选中首页
  int _selectedIndex = 0;
  final _widgetOptions = [
    GoodsContainer(),
   GoodsListView(),
    Text('Index 2: School'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('首页')),
          BottomNavigationBarItem(icon: Icon(Icons.category), title: Text('分类')),
          BottomNavigationBarItem(icon: Icon(Icons.person), title: Text('我的')),
        ],
        currentIndex: _selectedIndex,
        fixedColor: Colors.orange,
        onTap: _onItemTapped,
      ),
    );
  }
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
