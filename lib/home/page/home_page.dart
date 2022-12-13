import 'package:flutter/material.dart';
import 'package:wan_android_flutter/cache/sharedpreferences_cache.dart';
import 'package:wan_android_flutter/consts.dart';
import 'package:wan_android_flutter/home/dao/home_dao.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:wan_android_flutter/string_source.dart';

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
          children: const [HomeBannerWidget(), HomeList()],
        ));
  }

  @override
  void initState() {
    super.initState();
  }

  Future<void> _loadData() async {}
}

///Banner
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

///列表
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

          ///该属性解决即使数据没有满屏，也可以触发滚动
          physics: const AlwaysScrollableScrollPhysics(),
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
      HomeListData homeListData = value;
      setState(() {
        listDatas = homeListData.datas;
      });
    });
  }

  ///列表Item
  _buildItem(HomeListDataItem listData) {
    return Card(
      margin: const EdgeInsets.all(10),
      elevation: 5,
      child: Container(
        padding: const EdgeInsets.all(10),
        height: 130,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _header(listData),
            Container(
              margin: const EdgeInsets.only(top: 10, bottom: 10),
              child: Text(listData.title,
                  style: const TextStyle(color: Colors.blue, fontSize: 18)),
            ),
            _bottom(listData)
          ],
        ),
      ),
    );
  }

  ///Item的顶部
  _header(HomeListDataItem listData) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
              padding: const EdgeInsets.only(left: 10, right: 10),
              decoration: BoxDecoration(
                  border: Border.all(
                      width: 1, color: Colors.red, style: BorderStyle.solid),
                  borderRadius: BorderRadius.circular(5)),
              child: const Text(
                '新',
                style: TextStyle(color: Colors.red, fontSize: 8),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 10),
              child: Text(
                listData.shareUser,
                style: const TextStyle(color: Colors.black, fontSize: 10),
              ),
            )
          ],
        ),
        Text(listData.niceDate)
      ],
    );
  }

  ///Item的底部
  _bottom(HomeListDataItem listData) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            const Text(Strings.HOME_LIST_CATEGORY,
                style: TextStyle(color: Colors.grey, fontSize: 10)),
            Text(listData.superChapterName,
                style: const TextStyle(color: Colors.grey, fontSize: 10))
          ],
        ),
        InkWell(
          child: Image(
              image: listData.collect
                  ? const AssetImage('images/icon_collect_2.png')
                  : const AssetImage('images/icon_collect_1.png'),
              width: 24,
              height: 24),
          onTap: () {
            var cookie =
                SharedPreferencesUtil.getInstance().get(Consts.COOKIE_KEY);
            if (cookie == null) {
              Navigator.pushNamed(context, 'login');
            }
          },
        )
      ],
    );
  }
}
