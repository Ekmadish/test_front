import 'package:flutter/material.dart';
import 'package:localization/localization.dart';

Widget title(String s) => Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Text(
        s.i18n(),
        style: const TextStyle(
            color: Color(0XFFc8c3bc),
            fontSize: 12,
            fontWeight: FontWeight.w400),
      ),
    );
