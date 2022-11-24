import 'package:wan_android_flutter/http/base_request.dart';
import 'package:wan_android_flutter/http/base_response.dart';

abstract class BaseAdapter {
  Future<BaseResponse<T>> send<T>(BaseRequest request);
}
