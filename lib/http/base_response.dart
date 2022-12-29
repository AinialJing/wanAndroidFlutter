class BaseResponse{
  late dynamic _data;
  late String _errorMsg;
  late int _errorCode;

  BaseResponse();
  dynamic get data => _data;

  set data(dynamic value) {
    _data = value;
  }

  String get errorMsg => _errorMsg;

  int get errorCode => _errorCode;

  set errorCode(int value) {
    _errorCode = value;
  }

  set errorMsg(String value) {
    _errorMsg = value;
  }

  factory BaseResponse.fromJson(Map<String, dynamic> json) =>
      BaseResponse()
        ..data=json['data']
        ..errorCode=json['errorCode'] as int
        ..errorMsg=json['errorMsg'] as String;

}