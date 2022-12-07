import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:localization/localization.dart';
import 'package:tasu/main.dart';

class LanDropdwonButton extends StatelessWidget {
  const LanDropdwonButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    mainState.language.value.languageCode;
    return Container(
      // margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(4)),
      child: DropdownButton<String>(
        autofocus: false,
        borderRadius: BorderRadius.circular(4),
        value: mainState.language.value.languageCode, //locale.languageCode,
        dropdownColor: Colors.white,
        icon: const Icon(Icons.language),
        style: const TextStyle(color: Colors.black),
        underline: const SizedBox(),
        onChanged: (newValue) async {
          mainState.setLanguage(newValue!);
        },
        items: <String>[
          'kk',
          'ru',
          'en',
        ].map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
              value: value,
              alignment: Alignment.center,
              child: Text(
                _getLanstr(value),
                style: const TextStyle(color: Colors.black),
              ));
        }).toList(),
      ),
    );
  }

  String _getLanstr(String code) {
    switch (code) {
      case 'kk':
        return "Қазақша";
      case 'ru':
        return "Русский";
      default:
        return "English";
    }
  }
}
