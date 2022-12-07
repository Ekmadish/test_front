import 'package:flutter/material.dart';
import 'package:tasu/client/view/widget/appbar_widget.dart';

class ReportsScreen extends StatelessWidget {
  final Color colors;
  const ReportsScreen({Key? key, required this.colors}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(colors),
      body: const Center(
        child: Text('ReportsScren'),
      ),
    );
  }
}
