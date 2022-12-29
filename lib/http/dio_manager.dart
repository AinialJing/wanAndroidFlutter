import 'package:dio/dio.dart';

class DioManager {
  static const int TIME_OUT = 30000;
  static Dio? _dio;
  static DioManager? _instance;

  factory DioManager() => _getInstance();

  static DioManager get instance => _getInstance();

  Dio get dio => _getDio();

  DioManager._() {
    BaseOptions options = BaseOptions(
        sendTimeout: TIME_OUT,
        receiveTimeout: TIME_OUT,
        connectTimeout: TIME_OUT);
    _dio = Dio(options);
    _dio!.interceptors
        .add(LogInterceptor(requestBody: true, responseBody: true));
  }

  static DioManager _getInstance() {
    _instance ??= DioManager._();
    return _instance!!;
  }

  static _getDio() {
    return _dio;
  }
}
