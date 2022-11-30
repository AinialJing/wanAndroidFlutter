enum HttpMethod { GET, POST, DELETE }

abstract class BaseRequest {
  var useHttps = true;
  var restFullPath, pathParams, params;
  Map<String, dynamic> header = {};

  String host();

  HttpMethod httpMethod();

  bool restFull();

  bool needAddPathParams();

  String staticPath();

  String url() {
    Uri uri;
    String path;
    if (restFull()) {
      path = "${staticPath()}/$restFullPath";
    } else {
      path = staticPath();
    }
    if (useHttps) {
      if (needAddPathParams()) {
        uri = Uri.https(host(), path, pathParams);
      } else {
        uri = Uri.https(host(), path);
      }
    } else {
      if (needAddPathParams()) {
        uri = Uri.http(host(), path, pathParams);
      } else {
        uri = Uri.http(host(), path);
      }
    }

    return uri.toString();
  }

  BaseRequest addRESTFullPath(String restFullPath) {
    this.restFullPath = restFullPath;
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
