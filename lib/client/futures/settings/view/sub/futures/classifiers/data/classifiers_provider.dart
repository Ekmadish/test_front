import 'package:flutter/material.dart';

class ClassifiersProvider with ChangeNotifier {
  int _selectedIndex = 0;
  int get selectedIndex => _selectedIndex;
  final List<String> classifiersItems = [
    'Deferred payment conditions',
    'Activity area',
    'Banks',
    'Breaking rule',
    'Cargo statuses',
    'Carriers types',
    'Categories of other expenses',
    'Client types',
    'Contact persons\' posts',
    'Contact types',
    'Contries',
    'Document statuses',
    'Driving licence categories',
    'Exchange rate',
    'Federal district',
    'FlexFormPresets',
    'Group',
    'Loading method',
    'Measurement Name',
    'Order statuses',
    'Packagings',
    'Payment types',
    'Permissions',
    'Railway stations',
    'Regions',
    'Request purposes',
    'Request source',
    'Request statuses',
    'Sales funnel result',
    'Sales funnel status',
    'Subcategories of other expenses',
    'Tags',
    'Task statuses',
    'Transport types',
    'Trip statuses',
    'Truck body types',
    'VAT rates',
    'Workers\' posts',
  ];

//  deferredpaymentconditions
//! activityarea
//!  
//!  
//!  
//!  
//!  
//!  
//!  
//!  
//!  
//!  
//!  
//!  
//!  
//!  
//!  
//!  
//!  
//!  
//!  
//!  
//!  
//!  
//!  
//!  
//!  
//!  
//!  
//!  
//!  
//!  
//!  
//!  
//!  
//!  

  void onSectionChange(int i) {
    _selectedIndex = i;
    notifyListeners();
  }
}
