import 'package:flutter/material.dart';

class RowBuilder {
  final ScrollController scrollController;
  final IndexedWidgetBuilder builders;
  final int itemCount;

  const RowBuilder({
    required this.scrollController,
    required this.builders,
    required this.itemCount,
  });
}
