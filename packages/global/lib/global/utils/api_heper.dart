import 'dart:convert';

import 'package:global/global/utils/http_client.dart';
import 'package:http/http.dart';

class HttpController {
  HttpController._();
  static final HttpController _httpController = HttpController._();
  factory HttpController() => _httpController;
  final NetworkUtil _networkUtil = NetworkUtil();
  final Utf8Decoder _utf8decoder = const Utf8Decoder();
  final String _baseUrl = 'https://***.***.**';
  final StringBuffer _sb = StringBuffer("?");
  Future<Map<String, dynamic>> get(
    String url, {
    Map<String, String>? params,
    Map<String, String>? headers,
    Function? callback,
    Function? errorCallback,
  }) async {
    if (params != null && params.isNotEmpty) {
      params.forEach((key, value) {
        // _sb.write(key "=$value&");
      });
      String paramStr = _sb.toString();
      paramStr = paramStr.substring(0, paramStr.length - 1);
      url += paramStr;
    }
    try {
      return _networkUtil.http
          .get(Uri.parse('$_baseUrl$url'), headers: headers)
          .then((response) {
        return _returnResponse(response);
      });
      // if (callback != null) {
      //   callback(_returnResponse(res));
      // }
    } catch (exception) {
      if (errorCallback != null) {
        errorCallback(exception);
      }
      return {};
    }
  }

  Future<Map<String, dynamic>> post(String url,
      {dynamic body,
      Function? callback,
      Function? errorCallback,
      Map<String, String>? headers}) async {
    try {
      return _networkUtil.http
          .post(
        Uri.parse('$_baseUrl$url'),
        body: json.encode(body),
        headers: headers,
      )
          .then((response) {
        // if (callback != null) {
        //   callback(response);
        // }
        return _returnResponse(response);
      });
    } catch (e) {
      if (errorCallback != null) {
        errorCallback(e);
      }
      return {};
    }
  }

  Map<String, dynamic> _returnResponse(Response response) {
    switch (response.statusCode) {
      case 200:
        return json.decode(_utf8decoder.convert(response.bodyBytes));
      case 400:
        throw BadRequestException(response.body.toString());
      case 401:
        throw UnauthorisedException(response.body.toString());
      case 403:
        throw UnauthorisedException(response.body.toString());
      case 500:
      default:
        throw FetchDataException(
            'Error occured while Communication with Server with StatusCode : ${response.statusCode}');
    }
  }
}

class AppException implements Exception {
  final message;
  final prefix;

  AppException([this.message, this.prefix]);

  @override
  String toString() {
    return "$prefix$message";
  }
}

class FetchDataException extends AppException {
  FetchDataException([String? message])
      : super(message, "Error During Communication: ");
}

class BadRequestException extends AppException {
  BadRequestException([message]) : super(message, "Invalid Request: ");
}

class UnauthorisedException extends AppException {
  UnauthorisedException([message]) : super(message, "Unauthorised: ");
}

class InvalidInputException extends AppException {
  InvalidInputException([String? message]) : super(message, "Invalid Input: ");
}
