// import 'package:flutter/material.dart';
// import 'package:tasu/global/data/base_state.dart';

// class SettingsState extends BaseState {
//   SettingsState._();
//   static final SettingsState _state = SettingsState._();
//   factory SettingsState() => _state;
//   ValueNotifier<List<Section>> sectionIndex = ValueNotifier([
//     Section(index: 0, name: 'Companies'),
//     Section(index: 1, name: 'Departments'),
//     Section(index: 2, name: 'Employees'),
//     Section(index: 3, name: 'Groups of employees'),
//   ]);

//   @override
//   init() {}
//   @override
//   dispose() {
//     sectionIndex.dispose();
//   }
// }

// class Section {
//   final String name;
//   final int index;

//   Section({required this.name, required this.index});
// }
