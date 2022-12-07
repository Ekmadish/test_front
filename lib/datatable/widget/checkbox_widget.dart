import 'package:flutter/material.dart';

class CheckBoxWidget extends StatelessWidget {
  final bool check;
  final ValueChanged<bool?> changed;
  const CheckBoxWidget({
    Key? key,
    required this.check,
    required this.changed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Semantics(
      container: true,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black12, width: 1.0),
        ),
        padding: const EdgeInsetsDirectional.all(8),
        child: Checkbox(
          autofocus: false,
          value: check,
          onChanged: changed,
        ),
      ),
    );
  }
}
