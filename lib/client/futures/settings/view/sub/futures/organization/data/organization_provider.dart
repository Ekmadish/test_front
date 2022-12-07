import 'package:flutter/foundation.dart';

class Organization with ChangeNotifier {
  int _selectedIndex = 0;
  int get selectedIndex => _selectedIndex;


final List<String> organizationitems = [
  'Companies',
  'Departments',
  'Employees',
  'Groups of employees'
];


  void onSectionChange(int i) {
    _selectedIndex = i;
    notifyListeners();
  }
}
