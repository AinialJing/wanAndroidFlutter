import 'dart:async';

import 'package:event_bus/event_bus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:wan_android_flutter/cache/sharedpreferences_cache.dart';
import 'package:wan_android_flutter/consts.dart';
import 'package:wan_android_flutter/home/dao/home_dao.dart';
import 'package:wan_android_flutter/string_source.dart';

import '../../event/home_refresh_event.dart';
import '../entities/home_banner_entity.dart';
import '../entities/home_list_entity.dart';

EventBus eventBus = EventBus();

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

  Future<void> _loadData() async {
    eventBus.fire(HomeRefreshEvent());
  }
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

///??????
class HomeList extends StatefulWidget {
  const HomeList({Key? key}) : super(key: key);

  @override
  State<HomeList> createState() => _HomeListState();
}

class _HomeListState extends State<HomeList> {
  late StreamSubscription<HomeRefreshEvent> subscription;

  List<HomeListDataItem> listDatas = [];

  int pageIndex = 0;

  final ScrollController _controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    ///Expanded????????????????????????????????????
    return Expanded(
      child: ListView.builder(

          ///???????????????????????????????????????????????????????????????
          physics: const AlwaysScrollableScrollPhysics(),
          controller: _controller,
          itemCount: listDatas.length,
          itemBuilder: (BuildContext context, int index) =>
              HomeListItem(listDatas[index])),
    );
  }

  @override
  void initState() {
    super.initState();
    subscription = eventBus.on<HomeRefreshEvent>().listen((event) {
      pageIndex = 0;
      _loadListData();
    });
    _controller.addListener(() {
      if (_controller.position.pixels == _controller.position.maxScrollExtent) {
        pageIndex++;
        _loadListData();
      }
    });
    eventBus.fire(HomeRefreshEvent());
  }

  _loadListData() {
    HomeDao homeDao = HomeDao();
    homeDao.getListByPages(pageIndex, (value) {
      setState(() {
        if (pageIndex == 0) {
          listDatas = value.datas;
        } else {
          listDatas.addAll(value.datas);
        }
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    subscription.cancel();
  }
}

class HomeListItem extends StatefulWidget {
  final HomeListDataItem listData;

  const HomeListItem(this.listData, {super.key});

  @override
  State<HomeListItem> createState() => _HomeListItemState();
}

class _HomeListItemState extends State<HomeListItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, 'homeDetail', arguments: widget.listData.link);
      },
      child: Card(
        margin: const EdgeInsets.all(10),
        elevation: 5,
        child: Container(
          padding: const EdgeInsets.all(10),
          height: 130,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _header(widget.listData),
              Container(
                margin: const EdgeInsets.only(top: 10, bottom: 10),
                child: Text(widget.listData.title,
                    style: const TextStyle(color: Colors.blue, fontSize: 18)),
              ),
              _bottom(widget.listData)
            ],
          ),
        ),
      ),
    );
  }

  ///Item?????????
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
                '???',
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

  ///Item?????????
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
            bool loginState = SharedPreferencesUtil.getInstance()
                    .get(Consts.LOGIN_STATE) as bool ??
                false;
            if (loginState) {
              if (listData.collect) {
                _cancelCollect(listData.id, (state) {
                  setState(() {
                    listData.collect = state;
                  });
                });
              } else {
                _doCollect(listData.id, (state) {
                  setState(() {
                    listData.collect = state;
                  });
                });
              }
            } else {
              Navigator.pushNamed(context, 'login');
            }
          },
        )
      ],
    );
  }
}

void _doCollect(int id, ValueChanged<bool> changed) {
  HomeDao homeDao = HomeDao();
  homeDao.doCollect(id, (value) {
    changed.call(value);
  });
}

void _cancelCollect(int id, ValueChanged<bool> changed) {
  HomeDao homeDao = HomeDao();
  homeDao.cancelCollect(id, (value) {
    changed.call(value);
  });
}
