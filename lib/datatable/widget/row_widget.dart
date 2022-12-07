import 'package:flutter/material.dart';

class RowWidget extends StatelessWidget {
  final String value;
  final Function()? onTap;
  final Function()? onLongPress;
  final Color? color;
  final Widget? child;
  final double? rowHeight;
  const RowWidget({
    Key? key,
    required this.value,
    this.onLongPress,
    this.onTap,
    this.color,
    this.child,
    this.rowHeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Material(
        type: MaterialType.transparency,
        child: child ??
            InkWell(
              onTap: onTap,
              child: Container(
                height: rowHeight ?? 50,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black12, width: 1.0),
                ),
                alignment: Alignment.center,
                child: Text(value, style: const TextStyle(fontSize: 16.0)),
              ),
            ),
      ),
    );
  }
}
