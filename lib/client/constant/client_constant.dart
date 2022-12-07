import 'package:flutter/material.dart';
import 'package:tasu/client/model/tabdestanation.dart';

class ClientConstant {
  ClientConstant._();
  static final ClientConstant _clientConstant = ClientConstant._();
  factory ClientConstant() => _clientConstant;

  static List<String> languages = [
    'Kazah',
    'English',
    'Russian',
  ];

  static const List<TapDestanation> tabDestination = [
    TapDestanation(
      icon: Icons.question_answer,
      id: 1,
      routeName: 'l_Request',
      routepath: 'request',
      color: Color(0xff2a839d),
    ),
    TapDestanation(
      icon: Icons.description,
      id: 2,
      routeName: 'l_Orders',
      routepath: 'orders',
      color: Color(0xff3e9d2c),
    ),
    TapDestanation(
      icon: Icons.account_balance_wallet,
      id: 3,
      routeName: 'l_Finance',
      routepath: 'finance',
      color: Color(0xff2b8276),
    ),
    TapDestanation(
      icon: Icons.account_box,
      id: 4,
      routeName: 'l_Clients',
      routepath: 'clients',
      color: Color(0xffb58204),
    ),
    TapDestanation(
      icon: Icons.local_shipping,
      id: 5,
      routeName: 'l_Carries',
      routepath: 'carries',
      color: Color(0xffb29806),
    ),
    TapDestanation(
      icon: Icons.summarize,
      id: 6,
      routeName: 'l_Reports',
      routepath: 'reports',
      color: Color(0xff9f2725),
    ),
    TapDestanation(
      icon: Icons.receipt_long,
      id: 7,
      routeName: 'l_Documents',
      routepath: 'documents',
      color: Color(0xff004300),
    ),
    TapDestanation(
      icon: Icons.calendar_month,
      id: 8,
      routeName: 'l_Calendar',
      routepath: 'calendar',
      color: Color(0xff12309b),
    ),
    TapDestanation(
      icon: Icons.task,
      id: 9,
      routeName: 'l_Task',
      routepath: 'task',
      color: Color(0xff12309b),
    ),
    TapDestanation(
      icon: Icons.settings,
      id: 10,
      routeName: 'l_Settings',
      routepath: 'settings',
      color: Color(0xff561893),
    ),
  ];
}

enum Lang { Kazah, English, Russian }
