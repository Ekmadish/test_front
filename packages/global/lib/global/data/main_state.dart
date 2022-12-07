import 'package:flutter/material.dart';

class MainState {
  MainState._() {
    init();
  }
  static final MainState _mainState = MainState._();
  factory MainState() => _mainState;

  late final ValueNotifier<bool> _open;
  ValueNotifier<bool> get childDraweIsOpen => _open;

  void init() {
    _open = ValueNotifier(true);
  }

  void dispose() {
    _open.dispose();
  }
}
