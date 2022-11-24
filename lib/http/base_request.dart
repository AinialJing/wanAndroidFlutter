enum HttpMethod { GET, POST, DELETE }

abstract class BaseRequest {
  var useHttps = true;
  var params;
  Map<String, dynamic> header = {};

  String host();

  HttpMethod httpMethod();

  String path();

  String url() {
    Uri uri;
    if (useHttps) {
      uri = Uri.https(host(), path());
    } else {
      uri = Uri.http(host(), path(), params);
    }

    return uri.toString();
  }

  BaseRequest addParams(Map<String, dynamic> params) {
    this.params = params;
    return this;
  }

  BaseRequest addHeader(String k, Object v) {
    header[k] = v;
    return this;
  }
}
