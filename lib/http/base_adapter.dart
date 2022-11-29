import 'package:wan_android_flutter/http/base_request.dart';

abstract class BaseAdapter {
  Future send(BaseRequest request);
}
