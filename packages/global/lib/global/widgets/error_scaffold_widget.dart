import 'package:flutter/material.dart';

class ErrorScaffold extends StatelessWidget {
  const ErrorScaffold({
    required this.body,
    Key? key,
  }) : super(key: key);

  final Widget body;
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: const Text('Page Not Found')),
        body: body,
      );
}
