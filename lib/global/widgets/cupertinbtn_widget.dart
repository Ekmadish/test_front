import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Btn extends StatelessWidget {
  final Widget child;
  final String? text;
  final VoidCallback onPressed;

  const Btn({Key? key, required this.onPressed, required this.child, this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
        pressedOpacity: .2,
        color: Colors.transparent,
        padding: EdgeInsets.zero,
        onPressed: onPressed,
        child: child);
  }
}
