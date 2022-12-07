import 'package:flutter/material.dart';
import 'package:tasu/datatable/table_head.dart';

class ColumBuilder {
  final ScrollController scrollController;
  final List<HeadrColumn> children;

  ColumBuilder({
    required this.scrollController,
    required this.children,
  });
}
