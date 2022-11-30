import 'package:wan_android_flutter/http/base_request.dart';
import 'package:wan_android_flutter/http/wanAndroid_base_request.dart';

class ProgectDetailListRequest extends WanAndroidBaseRequest{
  @override
  HttpMethod httpMethod() {
   return HttpMethod.GET;
  }

  @override
  String staticPath() {
   return "project/list";
  }

  @override
  bool restFull() {
    return true;
  }
}