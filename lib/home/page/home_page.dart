import 'package:flutter/material.dart';
import 'package:wan_android_flutter/home/dao/home_dao.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

import '../entities/home_banner_entity.dart';
import '../entities/home_list_entity.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
        onRefresh: _loadData,
        color: Colors.blue,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: const [HomeBannerWidget(),HomeList()],
        ));
  }

  @override
  void initState() {
    super.initState();
  }

  Future<void> _loadData() async {}
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

class HomeList extends StatefulWidget {
  const HomeList({Key? key}) : super(key: key);

  @override
  State<HomeList> createState() => _HomeListState();
}

class _HomeListState extends State<HomeList> {
  List<HomeListDataItem> listDatas = [];

  @override
  Widget build(BuildContext context) {
    ///Expanded会使该控件平铺填满父布局
    return Expanded(
      child: ListView.builder(
          itemCount: listDatas.length,
          itemBuilder: (BuildContext context, int index) =>
              _buildItem(listDatas[index])),
    );
  }

  @override
  void initState() {
    super.initState();
    HomeDao homeDao = HomeDao();
    homeDao.getListByPages(0, (value) {
      HomeListData homeListData=value;
      setState(() {
        listDatas=homeListData.datas;
      });
    });
  }

  _buildItem(HomeListDataItem listData) {
    return SizedBox(
      height: 80,
      child: Text(listData.chapterName),
    );
  }
}
