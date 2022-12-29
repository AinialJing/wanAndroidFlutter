import 'package:flutter/cupertino.dart';
import 'package:wan_android_flutter/home/entities/home_list_entity.dart';
import 'package:wan_android_flutter/home/request/home_banner_request.dart';
import 'package:wan_android_flutter/home/request/home_cancel_collect_request.dart';
import 'package:wan_android_flutter/home/request/home_do_collect.dart';
import 'package:wan_android_flutter/home/request/home_list_request.dart';
import 'package:wan_android_flutter/http/dio_adapter.dart';

import '../entities/home_banner_entity.dart';

class HomeDao {
  void getBanners(ValueSetter valueSetter) {
    HomeBannerRequest bannerRequest = HomeBannerRequest();
    DioAdapter adapter = DioAdapter();
    adapter.send(bannerRequest).then((value) {
      HomeBannerEntity bannerEntity = HomeBannerEntity.fromJson(value);
      if (bannerEntity.errorCode == 0) {
        valueSetter.call(bannerEntity.data);
      }
    });
  }

  void getListByPages(int page, ValueSetter<HomeListData> valueSetter) {
    HomeListRequest homeListRequest = HomeListRequest();
    homeListRequest.addRESTFullPath("$page/json");
    DioAdapter adapter = DioAdapter();
    adapter.send(homeListRequest).then((value) {
      HomeListEntity homeListEntity = HomeListEntity.fromJson(value);
      if (homeListEntity.errorCode == 0) {
        valueSetter.call(homeListEntity.data);
      }
    });
  }

  void doCollect(id, ValueSetter<bool> state) {
    DoCollectRequest collectRequest = DoCollectRequest();
    collectRequest.addRESTFullPath('$id/json');
    DioAdapter dioAdapter = DioAdapter();
    dioAdapter.send(collectRequest).then((value) {
      state.call(true);
    });
  }

  void cancelCollect(id, ValueSetter<bool> state){
    CancelCollectRequest collectRequest=CancelCollectRequest();
    collectRequest.addRESTFullPath('$id/json');
    DioAdapter dioAdapter = DioAdapter();
    dioAdapter.send(collectRequest).then((value) {
      state.call(false);
    });
  }
}
