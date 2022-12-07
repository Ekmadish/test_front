import 'package:flutter/material.dart';

Widget tListviewBuilder(
    {required Widget Function(BuildContext context, int index) itemBuilder,
    int? itemCount}) {
  if (itemCount == 0) {
    return const Padding(
      padding: EdgeInsets.all(4),
      child: Text(
        'List is empty...',
        textAlign: TextAlign.left,
        style: TextStyle(color: Colors.white, fontSize: 12),
      ),
    );
  } else {
    return ListView.builder(
      itemBuilder: itemBuilder,
      itemCount: itemCount,
      shrinkWrap: true,
      padding: const EdgeInsets.only(bottom: 100),
    );
  }
}
