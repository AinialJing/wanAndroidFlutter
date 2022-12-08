import 'package:wan_android_flutter/home/request/home_banner_request.dart';
import 'package:wan_android_flutter/http/dio_adapter.dart';

import '../entitis/home_banner_entity.dart';

class HomeDao{
  List<HomeBannerData>? getBanners(){
    HomeBannerRequest bannerRequest=HomeBannerRequest();
    DioAdapter adapter=DioAdapter();
    adapter.send(bannerRequest).then((value){
      HomeBannerEntity bannerEntity=HomeBannerEntity.fromJson(value);
      if(bannerEntity.errorCode==0){
        return bannerEntity.data;
      }
    });
    return null;
  }
}