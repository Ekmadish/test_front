/// Package import
import 'package:flutter/material.dart';

abstract class BaseStateFullWidget extends StatefulWidget {
  const BaseStateFullWidget({Key? key}) : super(key: key);
}

abstract class BaseViewState<T extends BaseStateFullWidget> extends State<T> {
  late ValueNotifier<int> refreshTable;

  @override
  void initState() {
    super.initState();
    refreshTable = ValueNotifier(15);
  }

  /// Must call super.
  @override
  void dispose() {
    refreshTable.dispose();
    super.dispose();
  }

  /// Get the settings panel content.
  Widget? buildSettings(BuildContext context) {
    return null;
  }
}
