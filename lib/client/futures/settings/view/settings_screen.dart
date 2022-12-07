import 'dart:developer';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:localization/localization.dart';
import 'package:tasu/client/view/widget/tabbar_widget.dart';
import 'package:tasu/main.dart';
import 'sub/sub.dart';

class SettingsScreen extends StatelessWidget {
  final String routerName;
  final Color colors;
  const SettingsScreen({
    Key? key,
    required this.colors,
    required this.routerName,
  }) : super(key: key);
  static final List<String> _settingstab = [
    'organization',
    'templates',
    'classifiers',
    'system',
    'payment',
    'log'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xff202223),
        body: ListView(
          physics: const NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.only(bottom: 50),
          children: [
            TabbarWidget(
              colors: colors,
              routerName: routerName,
              tabs: _settingstab,
              onTap: (routerName) {
                _bodytap(routerName, context);
              },
            ),
            _body(routerName),
          ],
        ));
  }
}

Widget _body(String s) {
  switch (s) {
    case 'organization':
      return const OrganizationScreen();
      break;
    case 'templates':
      return const TemplatesScreen();
      break;
    case 'classifiers':
      return const ClassifiersScreen();
      break;
    case 'system':
      return const SystemScreen();
      break;
    case 'payment':
      return const PaymentScreen();
      break;
    default:
      return const LogScreen();
  }
}

void _bodytap(String routeName, BuildContext context) {
  context.go('/tasu/settings/tab/$routeName', extra: routeName);
}
