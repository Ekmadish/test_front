// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:tasu/global/widgets/tr_widget.dart';

class ErrorsWidget extends StatelessWidget {
 const ErrorsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return TrWidget(
      alignment: Alignment.center,
      trkey: 'l_Error',
      textAlign: TextAlign.center,
    );
  }
}
