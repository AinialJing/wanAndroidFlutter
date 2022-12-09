import 'package:flutter/cupertino.dart';
import 'package:wan_android_flutter/home/entities/home_list_entity.dart';
import 'package:wan_android_flutter/home/request/home_banner_request.dart';
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

  void getListByPages(int page, ValueSetter valueSetter) {
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
}
