// import 'dart:html' as sp;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

// class Storage {
//   // Storage._();
//   // static final Storage _sp = Storage._();
//   // factory Storage() => _sp;

//   // final _localStorage = sp.window.localStorage;

//   Future save(String id) async {
//     _localStorage['selected_id'] = id;
//     // _localStorage.update(key, (value) => value);
//   }

//   Future<String> getId() async => _localStorage['selected_id'];

//   Future invalidate() async {
//     await _localStorage.remove('selected_id');
//   }

//   final _storage =  FlutterSecureStorage();

//   void write(String key, String value) async {
//     log('write message  key $key\n value $value');
//     _localStorage.update(key, (value) => value);
//     // await _storage.write(key: key, value: value);
//   }

//   void delete(String key) async {
//     await _storage.delete(key: key);
//   }

//   Future<String?> read(String key) async {
//     return await _storage.read(key: key);
//   }
// }

class SecureStorage {
  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  Future<Map<String, String>> _readAll() async {
    var map = <String, String>{};
    try {
      map = await _storage.readAll(
        iOptions: _getIOSOptions(),
        aOptions: _getAndroidOptions(),
      );
    } catch (e) {}
    return map;
  }

  Future<void> deleteAll() async {
    try {
      await _storage.deleteAll(
        iOptions: _getIOSOptions(),
        aOptions: _getAndroidOptions(),
      );
      // _readAll();
    } catch (e) {}
  }

  Future<String?> readSecureData(String key) async {
    try {
      return await _storage.read(key: key) ?? "";
    } catch (e) {
      return '';
    }
  }

  Future<void> deleteSecureData(String key) async {
    try {
      await _storage.delete(key: key);
    } catch (e) {
      print(e);
    }
  }

  Future<void> writeSecureData(String key, String value) async {
    try {
      await _storage.write(
        key: key,
        value: value,
        iOptions: _getIOSOptions(),
        aOptions: _getAndroidOptions(),
      );
    } catch (e) {
      print(e);
    }
  }

  IOSOptions _getIOSOptions() => const IOSOptions(
        accessibility: IOSAccessibility.first_unlock,
      );

  AndroidOptions _getAndroidOptions() => const AndroidOptions(
        encryptedSharedPreferences: true,
      );
}
