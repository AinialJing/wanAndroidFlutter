import 'package:wan_android_flutter/http/base_request.dart';
import 'package:wan_android_flutter/http/wanAndroid_base_request.dart';

class DoCollectRequest extends WanAndroidBaseRequest{
  @override
  HttpMethod httpMethod() {
     return HttpMethod.POST;
  }

  @override
  String staticPath() {
    return "lg/collect";
  }

  @override
  bool restFull() {
    return true;
  }
}