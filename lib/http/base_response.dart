class BaseResponse<T> {
  BaseResponse(this.data, this.code, this.message);

  T data;
  int code;
  String message;
  dynamic extral;
}
