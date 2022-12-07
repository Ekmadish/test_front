import 'package:flutter/material.dart';

class RouterState {
  RouterState._();
  static final RouterState _routerState = RouterState._();
  factory RouterState() => _routerState;

  ValueNotifier<double> selectedNotifire = ValueNotifier(0);
}
