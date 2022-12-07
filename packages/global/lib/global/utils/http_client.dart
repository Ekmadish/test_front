// import 'package:http/http.dart' as h;
import 'dart:convert';

import 'package:http/http.dart' as h;

enum Method { POST, GET }

class NetworkUtil {
  NetworkUtil._();
  static final NetworkUtil _networkUtil = NetworkUtil._();
  factory NetworkUtil() => _networkUtil;

  static final _http = h.Client();
  h.Client get http => _http;

  Future<h.StreamedResponse> request({
    required Method method,
    required String url,
    required Map<String, String> headers,
    required dynamic body,
  }) async {
    var request = h.Request(method.name, Uri.parse(url));
    request.body = json.encode(body);
    request.headers.addAll(headers);
    return await request.send();
  }
}
