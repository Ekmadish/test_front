import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

// class AppConstant {
//   AppConstant._();
//   static final AppConstant _appConstant = AppConstant._();
//   factory AppConstant() => _appConstant;

Color bgColor = Colors.white;
Color navColor = Colors.black87;
Color navTextColor = Colors.white;
Color settingsBarColor = Colors.black;
Color primaryColor = Colors.white;
Color colorDangerColor = Colors.red;
Color primaryBtnColor = Colors.blue;
Color darkColor = Colors.black;
// }

class AppConstant {
  AppConstant._();
  static final BaseOptions options = BaseOptions(
      baseUrl: 'https://***.***.**',
      connectTimeout: 50000,
      receiveTimeout: 30000,
      headers: {
        'Content-Type': 'application/json',
        // 'Authorization': 'Bearer ${token ?? _accessToken}',
        // 'access-control-allow-origin': '*',
        // 'Accept': '*/*',
        // 'Accept-Encoding': 'gzip, deflate, br',
        // 'Connection': 'keep-alive'
      });
}
