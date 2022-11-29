enum HttpMethod { GET, POST, DELETE }

abstract class BaseRequest {
  var useHttps = true;
  var path, pathParams, params;
  Map<String, dynamic> header = {};

  String host();

  HttpMethod httpMethod();

  String url() {
    Uri uri;
    if (useHttps) {
      uri = Uri.https(host(), path, pathParams);
    } else {
      uri = Uri.http(host(), path, pathParams);
    }

    return uri.toString();
  }

  BaseRequest addPath(String path) {
    this.path = path;
    return this;
  }

  BaseRequest addPathParams(Map<String, dynamic> pathParams) {
    this.pathParams = pathParams;
    return this;
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
