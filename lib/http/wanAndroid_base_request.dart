import 'package:wan_android_flutter/http/base_request.dart';

abstract class WanAndroidBaseRequest extends BaseRequest{
  @override
  String host() {
    return "www.wanandroid.com";
  }

  @override
  bool restFull() {
    return false;
  }

  @override
  bool needAddPathParams() {
     return false;
  }
}