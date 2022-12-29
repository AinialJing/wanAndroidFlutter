import 'package:dio/dio.dart';
import 'package:wan_android_flutter/cache/sharedpreferences_cache.dart';
import 'package:wan_android_flutter/http/base_adapter.dart';
import 'package:wan_android_flutter/http/base_request.dart';
import 'package:wan_android_flutter/http/dio_manager.dart';

import '../consts.dart';

class DioAdapter extends BaseAdapter {
  static const String TAG = "DioAdapter:";

  @override
  Future send(BaseRequest request) async {
    var options = Options(headers: request.header);
    List<String>? saveCookie =
        SharedPreferencesUtil.getInstance().getStringList(Consts.COOKIE_KEY);
    print('$TAG$saveCookie');
    String cookie = "";
    if (saveCookie != null) {
      for (var value in saveCookie!) {
        cookie += value;
      }
      options.headers?["Cookie"] = cookie;
    }
    Response? response;
    try {
      if (request.httpMethod() == HttpMethod.GET) {
        response =
            await DioManager.instance.dio.get(request.url(), options: options);
      } else if (request.httpMethod() == HttpMethod.POST) {
        response = await DioManager.instance.dio.post(request.url(),
            queryParameters: request.params, options: options);
      } else if (request.httpMethod() == HttpMethod.DELETE) {
        response = await DioManager.instance.dio
            .delete(request.url(), data: request.params);
      }
      if (request.url().contains('login') && response?.statusCode == 200) {
        List<String>? cookie = response?.headers.map['set-cookie'];
        SharedPreferencesUtil.getInstance()
            .setStringList(Consts.COOKIE_KEY, cookie!);
      }
    } on DioError catch (e) {
      response = e.response;
    }
    return response?.data;
  }
}
