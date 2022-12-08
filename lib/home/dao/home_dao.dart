import 'package:flutter/cupertino.dart';
import 'package:wan_android_flutter/home/request/home_banner_request.dart';
import 'package:wan_android_flutter/http/dio_adapter.dart';

import '../entities/home_banner_entity.dart';

class HomeDao{
 void getBanners(ValueSetter valueSetter){
    HomeBannerRequest bannerRequest=HomeBannerRequest();
    DioAdapter adapter=DioAdapter();
    adapter.send(bannerRequest).then((value){
      HomeBannerEntity bannerEntity=HomeBannerEntity.fromJson(value);
      if(bannerEntity.errorCode==0){
        valueSetter.call(bannerEntity.data);
      }
    });
  }
}