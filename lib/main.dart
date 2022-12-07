import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get_it/get_it.dart';
import 'package:localization/localization.dart';
import 'package:tasu/global/config/router/route.dart';
import 'package:tasu/global/config/router/route_custom_transition.dart';
import 'package:tasu/global/data/app_state.dart';
import 'package:tasu/global/data/db.dart';

final getIt = GetIt.instance;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  GestureBinding.instance.resamplingEnabled = true;
  _registerSingletons();
  runApp(const AppRoot());
  await mainState.init();
}

void _registerSingletons() async {
  getIt.registerSingleton<SecureStorage>(SecureStorage());
  getIt.registerLazySingleton<MainState>(() => MainState(), dispose: (param) {
    param.dispose();
  });
  getIt.registerLazySingleton<AppRoute>(
      () => AppRoute(tasuAuth: mainState.tasuAuth), dispose: (param) {
    param.routes.dispose();
  });
  LocalJsonLocalization.delegate.directories = ['assets/langs'];
}

SecureStorage get storage => getIt.get<SecureStorage>();
MainState get mainState => getIt.get<MainState>();
AppRoute get appRoute => getIt.get<AppRoute>();

class AppRoot extends StatelessWidget {
  const AppRoot({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return

        // TasuAuthScope(
        //   notifier: mainState.tasuAuth,
        // child:
        //   ValueListenableBuilder<Locale>(
        // key: key,
        // valueListenable: mainState.language,
        // builder: (context, locale, child) {
        // return
        MaterialApp.router(
      // builder: (context, child) {
      //   Responsive(context: context);
      //   return child!;
      // },
      debugShowCheckedModeBanner: false,
      showPerformanceOverlay: false,
      routeInformationParser: appRoute.routes.routeInformationParser,
      routeInformationProvider: appRoute.routes.routeInformationProvider,
      routerDelegate: appRoute.routes.routerDelegate,
      // locale: locale, //mainState.language.value,
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        DefaultMaterialLocalizations.delegate,
        LocalJsonLocalization.delegate,
      ],
      supportedLocales: const [
        Locale('kk', 'KK'),
        Locale('en', 'US'),
        Locale('ru', 'RU'),
      ],
      localeResolutionCallback: (locale, supportedLocales) {
        if (supportedLocales.contains(locale)) {
          return locale;
        }
        if (locale!.languageCode == 'kk') {
          return const Locale('kk', 'KK');
        } else if (locale.languageCode == 'ru') {
          return const Locale('ru', 'RU');
        } else {
          return const Locale('en', 'US');
        }
      },
      theme: ThemeData(
        pageTransitionsTheme: const PageTransitionsTheme(
          builders: {
            TargetPlatform.android: OpenUpwardsPageTransitionsBuilder(),
            TargetPlatform.iOS: FadeUpwardsPageTransitionsBuilder(),
            TargetPlatform.macOS: CustomTransitionBuilder(),
          },
        ),
      ),
      title: "TASU",
      key: const ValueKey("T"),
    );
    //   },
    //   // ),
    // );
  }
}
