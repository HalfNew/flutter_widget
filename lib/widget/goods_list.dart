import 'package:flutter/material.dart';
import '../http/http.dart';
import 'dart:convert';

class GoodsListView extends StatefulWidget {
  @override
  State createState() => GoodsListViewState();
}

class GoodsListViewState extends State<GoodsListView> {
  final goodsItem = <Widget>[];

  ScrollController _scrollController = ScrollController();

  bool isRequest = false;

  var minId = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("商品列表"),
        ),
        body: ListView.builder(
          itemCount: goodsItem.length,
          itemBuilder: (context, i) {
            if (i.isOdd) return Divider();
            return goodsItem[i];
          },
          controller: _scrollController,
        ));
  }

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        requestData();
      }
    });
    if (goodsItem.length == 0) {
      requestData();
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  //请求数据
  void requestData() {
    print('加载数据-->minId：$minId');
    if (!isRequest) {
      setState(() => isRequest = true);
      Future<String> data = httpUtil.getHttpData(
          "http://v2.api.haodanku.com/itemlist/apikey/uorder/nav/3/cid/0/back/10/min_id/$minId");
      data.then((str) {
        Map body = json.decode(str);
        if (body['code'] == 1) {
          minId = body['min_id'];
        }
        List goodsList = body['data'];
        goodsList.forEach((item) {
          setState(() => goodsItem.add(_buildRow(item)));
        });
        isRequest = false;
      });
    }
  }

//构建listView的每一项
  Widget _buildRow(Map item) {
    return Container(
      padding: const EdgeInsets.only(bottom: 8.0),
      height: 120,
      width: 480,
      child: Row(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(2),
            child: Image.network(
              item['itempic'],
              height: 120,
              width: 120,
              fit: BoxFit.fill,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                item['itemshorttitle'],
                style: TextStyle(
                  fontSize: 14.0,
                ),
                textAlign: TextAlign.left,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                softWrap: true,
              ),
              Row(
                children: <Widget>[
                  Text(
                    '￥',
                    style: TextStyle(fontSize: 12.0, color: Colors.red),
                  ),
                  Text(
                    '${item['itemprice']}',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                        color: Colors.red),
                  ),
                  Text(
                    '券后',
                    style: TextStyle(fontSize: 12.0, color: Colors.red),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
