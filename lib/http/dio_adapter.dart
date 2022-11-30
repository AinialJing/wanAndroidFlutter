import 'package:dio/dio.dart';
import 'package:wan_android_flutter/http/base_adapter.dart';
import 'package:wan_android_flutter/http/base_request.dart';

class DioAdapter extends BaseAdapter {
  @override
  Future send(BaseRequest request) async {
    var response, options = Options(headers: request.header);
    var error;
    try {
      if (request.httpMethod() == HttpMethod.GET) {
            response = await Dio().get(request.url(), options: options);
          }else if(request.httpMethod()==HttpMethod.POST){
            response = await Dio().post(request.url(),data: request.params,options: options);
          }else if(request.httpMethod() == HttpMethod.DELETE){
            response= await Dio().delete(request.url(),data: request.params);
          }
    } on DioError catch (e) {
      print('catch error:${e.type}');
      error=e;
      response=e.response;
    }

    return response.data;
  }

}
