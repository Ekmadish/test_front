import 'package:flutter/material.dart';
import 'package:tasu/client/view/widget/appbar_widget.dart';

class RequestScreen extends StatelessWidget {
  final Color colors;
  const RequestScreen({required this.colors, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(
        colors,
      ),
      body: Container(
        alignment: Alignment.center,
        child: const Text('RequestScreen'),
      ),
    );
  }
}
