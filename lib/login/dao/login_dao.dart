import 'package:wan_android_flutter/http/dio_adapter.dart';
import 'package:wan_android_flutter/login/request/login_request.dart';

class LoginDao {
  static doLogin(String username, String password) {
    LoginRequest loginRequest = LoginRequest();
    Map<String, String> params = {};
    params['username'] = username;
    params['password'] = password;
    loginRequest.addParams(params);
    DioAdapter adapter = DioAdapter();
    adapter.send(loginRequest);
  }
}
