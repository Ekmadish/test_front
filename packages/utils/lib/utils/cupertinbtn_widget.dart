import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Btn extends StatelessWidget {
  final Widget? child;
  final String? text;
  final VoidCallback onPressed;

  const Btn({Key? key, required this.onPressed, required this.child, this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      pressedOpacity: .2,
      color: Colors.transparent,
      alignment: Alignment.center,
      borderRadius: BorderRadius.circular(12),
      padding: EdgeInsets.zero,
      onPressed: onPressed,
      child: child ??
          Container(
              width: double.infinity,
              margin: const EdgeInsets.symmetric(vertical: 8),
              padding: const EdgeInsets.symmetric(vertical: 15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(29),
                color: const Color(0xff9D7EF3),
                border: Border.all(color: const Color(0xff00000000), width: 1),
                boxShadow: const [
                  BoxShadow(
                    blurRadius: 2,
                    spreadRadius: 1,
                    color: Color(0xff0000000d),
                  ),
                ],
              ),
              child: Text(text ?? '',
                  style: const TextStyle(color: Colors.white, fontSize: 16),
                  textAlign: TextAlign.center)),
    );
  }
}
