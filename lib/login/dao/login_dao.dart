import 'package:flutter/material.dart';
import 'package:wan_android_flutter/http/base_response.dart';
import 'package:wan_android_flutter/http/dio_adapter.dart';
import 'package:wan_android_flutter/login/request/login_request.dart';

class LoginDao {
  static doLogin(username,password, ValueSetter<BaseResponse> callBack) {
    LoginRequest loginRequest = LoginRequest();
    Map<String, String> params = {};
    params['username'] = username;
    params['password'] = password;
    loginRequest.addParams(params);
    DioAdapter adapter = DioAdapter();
    adapter.send(loginRequest).then((value) {
      BaseResponse response = BaseResponse.fromJson(value);
      callBack.call(response);
    });
  }
}
