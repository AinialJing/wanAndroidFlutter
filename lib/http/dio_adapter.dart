import 'package:dio/dio.dart';
import 'package:wan_android_flutter/http/base_adapter.dart';
import 'package:wan_android_flutter/http/base_request.dart';
import 'package:wan_android_flutter/http/base_response.dart';

class DioAdapter extends BaseAdapter {
  @override
  Future<BaseResponse<T>> send<T>(BaseRequest request) async {
    var response, options = Options(headers: request.header);
    if (request.httpMethod() == HttpMethod.GET) {
      response = await Dio().get(request.url(), options: options);
    }else if(request.httpMethod()==HttpMethod.POST){
      response = await Dio().post(request.url(),data: request.params,options: options);
    }else if(request.httpMethod() == HttpMethod.DELETE){
      response= await Dio().delete(request.url(),data: request.params);
    }
    return buildResponse(response);
  }

  BaseResponse<T> buildResponse<T>(Response response) {
    return BaseResponse(response.data, response.statusCode!!, response.statusMessage!!);
  }

}
