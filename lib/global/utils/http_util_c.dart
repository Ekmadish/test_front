import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:tasu/client/data/repository.dart';
import 'package:tasu/global/config/constant/app_constant.dart';
import 'package:tasu/main.dart';

class HttpUtilC {
  HttpUtilC._() {
    init();
  }
  static final HttpUtilC _util = HttpUtilC._();
  factory HttpUtilC() => _util;
  final Dio _dio = Dio(AppConstant.options);

  Dio get d => _dio;
  final Utf8Decoder _utf8decoder = const Utf8Decoder();

  // final ClientRepository _repository = ClientRepository();
  String _accessToken = '';
  String _refreshToken = '';

  // final SecureStorage _storage = SecureStorage();

  void init() {
    _dio.interceptors.add(InterceptorsWrapper(
      onError: (e, handler) async {
        if (e.response?.statusCode == 403 || e.response?.statusCode == 401) {
          final refreshToken = await storage.read('c_rt');
          log('thre refresh token  $refreshToken ');
          _retry(
              refreshtoken: refreshToken,
              requestOptions: e.requestOptions,
              handler: handler);
        } else {}
      },
    ));
  }

  void close() {
    _dio.close();
  }

  void _retry({
    required String refreshtoken,
    required RequestOptions requestOptions,
    required ErrorInterceptorHandler handler,
  }) async {
    final response = await _dio.post('https://***.***.**/api/Login/RenewTokens',
        data: {"token": refreshtoken, "type": 2});

    if (response.statusCode == 200) {
      if (response.data['status'] == 'success') {
        _accessToken = response.data['data']['accessToken'];
        _refreshToken = response.data['data']['refreshToken'];
        ClientRepository().saveToken(_accessToken, _refreshToken);
        _redo(requestOptions, handler);
      }
    }
  }

  void _redo(
      RequestOptions requestOptions, ErrorInterceptorHandler handler) async {
    final options = Options(
      method: requestOptions.method,
      headers: _headers(),
    );
    _dio
        .request<dynamic>(requestOptions.path,
            data: requestOptions.data,
            queryParameters: requestOptions.queryParameters,
            options: options)
        .then((value) {
      handler.resolve(value);
    });
  }

  void _saveToken(String aat, String art) async {
    _accessToken = aat;
    await storage.write('c_at', aat);
    await storage.write('c_rt', art);
  }

  Map<String, String> _headers({String? token}) => {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${token ?? _accessToken}',
        'access-control-allow-origin': '*',
        'Accept': '*/*',
        'Accept-Encoding': 'gzip, deflate, br',
        'Connection': 'keep-alive'
      };

  static void _handleHttpError(int errorCode) {
    switch (errorCode) {
      case 400:
        break;
      case 401:
        break;
      case 403:
        break;
      case 404:
        break;
      case 408:
        break;
      case 500:
        break;
      case 501:
        break;
      case 502:
        break;
      case 503:
        break;
      case 504:
        break;
      case 505:
        break;
      default:
    }
  }

  Future<Map<String, dynamic>> postreq(String url,
      {dynamic data, required Map<String, dynamic> headers}) async {
    Response response;
    try {
      response =
          await _dio.post(url, data: data, options: Options(headers: headers));

      if (response.statusCode == 200) {
        return response.data;
      } else {
        throw response;
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<Map<String, dynamic>> getreq(String url,
      {Map<String, String>? params,
      required Map<String, dynamic> headers}) async {
    Response response;
    try {
      response = await _dio.get(url,
          queryParameters: params, options: Options(headers: headers));
      if (response.statusCode == 200) {
        return response.data;
      } else {
        throw response;
      }
    } catch (e) {
      rethrow;
    }
  }
}
