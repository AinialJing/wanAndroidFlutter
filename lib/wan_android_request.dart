import 'package:wan_android_flutter/http/base_request.dart';

class WanAndroidRequest extends BaseRequest{
  @override
  String host() {
     return "www.wanandroid.com";
  }

  @override
  HttpMethod httpMethod() {
     return HttpMethod.GET;
  }

  @override
  String path() {
    // TODO: implement path
    throw UnimplementedError();
  }
}