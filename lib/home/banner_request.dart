import 'package:wan_android_flutter/http/base_request.dart';

import '../http/wanAndroid_base_request.dart';

class HomeBannerRequest extends WanAndroidBaseRequest {
  @override
  HttpMethod httpMethod() {
    return HttpMethod.GET;
  }

  @override
  String staticPath() {
    return "banner/json";
  }
}
