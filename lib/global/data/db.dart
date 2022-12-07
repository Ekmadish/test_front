import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

@immutable
// ignore: must_be_immutable
class SecureStorage {
  // final FlutterSecureStorage storage = const FlutterSecureStorage();

  // SecureStorage() {
  //   init();
  // }

  // Future<void> init() async {
  //   storage = await SharedPreferences.getInstance();
  // }

  // Future<Map<String, String>> _readAll() async {
  //   var map = <String, String>{};
  //   try {
  //     map = await storage.readAll(
  //       iOptions: _getIOSOptions(),
  //       aOptions: _getAndroidOptions(),
  //     );
  //   } catch (e) {}
  //   return map;
  // }

  Future<void> deleteAll() async {
    SharedPreferences storage = await SharedPreferences.getInstance();

    try {
      await storage.clear();
      // await storage.deleteAll(
      //   iOptions: _getIOSOptions(),
      //   aOptions: _getAndroidOptions(),
      // );
    } catch (e) {}
  }

  Future<String> read(String key) async {
    SharedPreferences storage = await SharedPreferences.getInstance();

    bool containsKey = storage.containsKey(key);
    // await storage.containsKey(key: key);

    try {
      if (containsKey) {
        return Future.value(storage.getString(key) ?? '');
        // return await storage.read(key: key) ?? '';
      } else {
        return '';
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<void> delete(String key) async {
    SharedPreferences storage = await SharedPreferences.getInstance();

    bool containsKey = storage.containsKey(key);
    try {
      if (containsKey) {
        await storage.remove(key); //delete(key: key);
      }
    } catch (e) {
      log(e.toString(), error: e);
    }
  }

  Future<void> write(String key, String value) async {
    SharedPreferences storage = await SharedPreferences.getInstance();

    try {
      await storage.setString(key, value);

      //  write(
      //   key: key,
      //   value: value,
      //   iOptions: _getIOSOptions(),
      //   aOptions: _getAndroidOptions(),
      // );
    } catch (e) {
      log(e.toString(), error: e);
    }
  }

  // IOSOptions _getIOSOptions() => const IOSOptions(
  //       accessibility: KeychainAccessibility.first_unlock,
  //     );

  // AndroidOptions _getAndroidOptions() => const AndroidOptions(
  //       encryptedSharedPreferences: true,
  //     );
}
