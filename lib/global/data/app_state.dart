import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:localization/localization.dart';
import 'package:tasu/admin/data/services/admin_repository.dart';
import 'package:tasu/admin/futures/home/cubit/admin_cubit.dart';
import 'package:tasu/admin/futures/statistics/cubit/statistics_cubit.dart';
import 'package:tasu/client/data/repository.dart';
import 'package:tasu/global/config/constant/auth_state.dart';
import 'package:tasu/global/data/auth.dart';
import 'package:tasu/main.dart';

@immutable
class MainState {
  final AdminRepository _adminRepository = AdminRepository();
  final ClientRepository _clientRepository = ClientRepository();
  // final SecureStorage _storage = SecureStorage();
  final TasuAuth _tasuAuth = TasuAuth();
  TasuAuth get tasuAuth => _tasuAuth;

  Future<void> _checkAuth() async {
    await storage.read('isAdmin').then((str) {
      if (str.isNotEmpty) {
        if (str == '1') {
          _adminRepository.checkAuth().then((boool) {
            if (boool) {
              _tasuAuth.setAuthSate(AuthState.authorized(true));
            } else {
              _tasuAuth.setAuthSate(AuthState.unAuthorized());
            }
          });
        } else {
          _clientRepository.checkAuth().then((boool) {
            if (boool) {
              _tasuAuth.setAuthSate(AuthState.authorized(false));
            } else {
              _tasuAuth.setAuthSate(AuthState.unAuthorized());
            }
          });
        }
      } else {
        _tasuAuth.setAuthSate(AuthState.unAuthorized());
      }
    });
  }

  late final AdminCubit _adminCubit;
  AdminCubit get adminCubit => _adminCubit;
  late final StatisticsCubit _statisticsCubit;
  StatisticsCubit get statisticsCubit => _statisticsCubit;
  // final SecureStorage storage = SecureStorage();
  final ValueNotifier<Locale> _language =
      ValueNotifier(const Locale('en', 'US'));
  ValueNotifier<Locale> get language => _language;

  Future<void> init() async {
    await _getlanguage();
    _adminCubit = AdminCubit();
    _statisticsCubit = StatisticsCubit();

    await _checkAuth();
    await bootstrap();
  }

  //! /////////////////////////
  //!app logic
  //! ////////////////////////
  Future<void> bootstrap() async {
    // Default error handler
    FlutterError.onError = _handleFlutterError;
    // Default to only allowing portrait mode
    setDeviceOrientation(Axis.vertical);
    // // Set preferred refresh rate to the max possible (the OS may ignore this)
    // if (Platform.isAndroid || Platform.isIOS) {
    //   await FlutterDisplayMode.setHighRefreshRate();
    // }
  }

  void setDeviceOrientation(Axis? axis) {
    final orientations = <DeviceOrientation>[];
    if (axis == null || axis == Axis.vertical) {
      orientations.addAll([
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ]);
    }
    if (axis == null || axis == Axis.horizontal) {
      orientations.addAll([
        DeviceOrientation.landscapeLeft,
        DeviceOrientation.landscapeRight,
      ]);
    }
    SystemChrome.setPreferredOrientations(orientations);
  }

  void _handleFlutterError(FlutterErrorDetails details) {
    FlutterError.dumpErrorToConsole(details);
  }

  Future<void> _getlanguage() async {
    await storage.read('lan').then((lan) {
      if (lan.isNotEmpty) {
        _language.value = Locale(lan);
      }
    });
  }

  Future<void> setLanguage(String tag) async {
    await storage.write('lan', tag);
    _language.value = Locale(tag);
    // await Future.delayed(const Duration(milliseconds: 100)).whenComplete(() {
    //   appRoute.routes.refresh();
    // });

    //  Locale('kk', 'KK'),
    //         Locale('en', 'US'),
    //         Locale('ru', 'RU'),

    await LocalJsonLocalization.delegate
        .load(
      _demo(tag),
    )
        .whenComplete(() {
      Future.delayed(const Duration(milliseconds: 100)).whenComplete(() {
        appRoute.routes.refresh();
      });
      // appRoute.routes.refresh();
    });
  }

  Locale _demo(String s) {
    switch (s) {
      case 'kk':
        return const Locale('kk', 'KK');
        break;
      case 'ru':
        return const Locale('ru', 'RU');
        break;
      default:
        return const Locale('en', 'US');
    }
  }

  void logout() async {
    _adminRepository.logout();
    _clientRepository.logout();
    _tasuAuth.setAuthSate(AuthState.unAuthorized());
  }

  void dispose() {
    _adminCubit.close();
    _statisticsCubit.close();
  }
}
