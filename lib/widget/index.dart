import 'package:flutter/material.dart';

class Index extends StatelessWidget{

  @override
  Widget build(BuildContext context) {

    Widget titleSection = Container(
      padding: const EdgeInsets.all(32.0),
      //定义子部件:Row Icon Text
      child: Row(
        //row下面一共有两项
        children: <Widget>[
          Expanded(
            child: Column(
              //子部件左对齐
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  //底部添加8像素填充
                  padding: const EdgeInsets.only(bottom: 8.0),
                  //显示文本，显示成灰色
                  child: Text('Oeschinen Lake Campground',style: TextStyle(fontWeight: FontWeight.bold),),
                ),
                Text('Kandersteg, Switzerland',style: TextStyle(color: Colors.grey[500],),),
              ],
            ),
          ),
          //设置星星
          Icon(Icons.star,color: Colors.red[500],),
          //设置数量
          Text('41'),
        ],
      ),
    );

    //定义按钮部分
    Widget buttonSection = Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Index.buildButtonColumn(Icons.call, 'CALL', context),
          Index.buildButtonColumn(Icons.near_me, 'ROUTE', context),
          Index.buildButtonColumn(Icons.share, 'SHARE', context),
        ],
      ),
    );

    //定义文本部分
    Widget textSection = Container(
      padding: const EdgeInsets.all(32.0),
      child: Text(
        '''
        Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese Alps. Situated 1,578 meters above sea level, it is one of the larger Alpine Lakes. A gondola ride from Kandersteg, followed by a half-hour walk through pastures and pine forest, leads you to the lake, which warms to 20 degrees Celsius in the summer. Activities enjoyed here include rowing, and riding the summer toboggan run.
        ''',
        //是否应在软换行符（例如句点或逗号）之间断开
        softWrap: true,
      ),
    );

    return ListView(
      children: <Widget>[
        Image.asset(
          'images/qiutian_secai-003.jpg',
          width: 600.0,
          height: 240.0,
          fit: BoxFit.cover,
        ),
        titleSection,
        buttonSection,
        textSection,
      ],
    );


  }
  //定义按钮
  static Column buildButtonColumn(IconData icon, String label,BuildContext context){
    Color color = Theme.of(context).primaryColor;
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(icon,color: color,),
        Container(
          margin: const EdgeInsets.only(top: 8.0),
          child: Text(label,style: TextStyle(fontSize: 12,fontWeight: FontWeight.w400,color: color),),
        ),
      ],
    );
  }
}