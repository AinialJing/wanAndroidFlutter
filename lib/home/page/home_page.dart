import 'package:flutter/material.dart';
import 'package:wan_android_flutter/home/dao/home_dao.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

import '../entities/home_banner_entity.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [HomeBannerWidget()],
    );
  }

  @override
  void initState() {
    super.initState();
  }
}

class HomeBannerWidget extends StatefulWidget {
  const HomeBannerWidget({Key? key}) : super(key: key);

  @override
  State<HomeBannerWidget> createState() => _HomeBannerWidgetState();
}

class _HomeBannerWidgetState extends State<HomeBannerWidget> {
  List<HomeBannerData> banners = [];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Swiper(
          key: UniqueKey(),
          itemCount: banners.length,
          itemBuilder: (BuildContext context, int index) {
            return Image.network(
              banners[index].imagePath,
              fit: BoxFit.fill,
            );
          },
          autoplay: true,
          pagination: const SwiperPagination()),
    );
  }

  @override
  void initState() {
    super.initState();
    HomeDao homeDao = HomeDao();
    homeDao.getBanners((values) {
      setState(() {
        banners = values;
      });
    });
  }
}
