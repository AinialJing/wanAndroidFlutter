import 'package:wan_android_flutter/http/base_request.dart';
import 'package:wan_android_flutter/http/wanAndroid_base_request.dart';

class LoginRequest extends WanAndroidBaseRequest{
  @override
  HttpMethod httpMethod() {
   return HttpMethod.POST;
  }

  @override
  String staticPath() {
     return 'user/login';
  }
}