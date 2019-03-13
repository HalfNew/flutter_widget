import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class IndexSwiper extends StatefulWidget {
  @override
  State createState() => IndexSwiperState();
}

class IndexSwiperState extends State<IndexSwiper> {
  final _imageList = <String>[
  'images/qiutian_secai-003.jpg',
  'images/qiutian_secai-004.jpg',
  'images/qiutian_secai-005.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      width: 480,
      child: Swiper(
        itemBuilder: (context, index) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(1),
            child: Image.asset(
              _imageList[index],
              width: 480.0,
              height: 120.0,
              fit: BoxFit.fill,
            ),
          );
        },
        itemCount: 3,
        pagination: SwiperPagination(),
        control: SwiperControl(),
        autoplay: true,
        duration: 400,
        itemWidth: 480,
        itemHeight: 240,
        scale: 0.95,
      ),
    );
  }
}
