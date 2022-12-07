import 'package:flutter/material.dart';

@immutable
class DialogEditModel {
  final List<Widget> body;
  final List<String> title;
  const DialogEditModel({required this.body, required this.title});
}
