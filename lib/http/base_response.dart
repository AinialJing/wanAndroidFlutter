class BaseResponse<T> {
  BaseResponse(
      {required this.data,
      required this.code,
      required this.message,
      this.extral});

  T data;
  String code;
  String message;
  dynamic extral;
}
