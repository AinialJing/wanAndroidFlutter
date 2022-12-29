import 'package:flutter/material.dart';
import 'package:wan_android_flutter/http/base_response.dart';
import 'package:wan_android_flutter/http/dio_adapter.dart';
import 'package:wan_android_flutter/login/request/register_request.dart';

class RegisterDao {
  static doRegister(username, password, repassword,ValueSetter setterCallBack) {
    RegisterRequest request = RegisterRequest();
    Map<String, String> params = {};
    params['username'] = username;
    params['password'] = password;
    params['repassword'] = repassword;
    request.addParams(params);
    DioAdapter adapter = DioAdapter();
    adapter.send(request).then((value){
       BaseResponse baseResponse=BaseResponse.fromJson(value);
       setterCallBack.call(baseResponse);
    });
  }
}
