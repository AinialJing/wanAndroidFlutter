import 'package:wan_android_flutter/http/dio_adapter.dart';
import 'package:wan_android_flutter/login/request/register_request.dart';

class RegisterDao {
  static doRegister(username, password, repassword) {
    RegisterRequest request = RegisterRequest();
    Map<String, String> params = {};
    params['username'] = username;
    params['password'] = password;
    params['repassword'] = repassword;
    DioAdapter adapter = DioAdapter();
    adapter.send(request);
  }
}
