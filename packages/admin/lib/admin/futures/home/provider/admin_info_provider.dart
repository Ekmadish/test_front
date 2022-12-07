// import 'package:flutter/material.dart';
// import 'package:tasu/admin/data/services/admin_repository.dart';
// import 'package:tasu/admin/model/admin_model.dart';
// import 'package:tasu/global/utils/utils.dart';

// class AdminProvider with ChangeNotifier {
//   AdminProvider._() {
//     getAdminInfo();
//   }
//   static final AdminProvider _adminProvider = AdminProvider._();
//   factory AdminProvider() => _adminProvider;
//   final AdminRepository _adminRepository = AdminRepository();
//   AdminModel? _adminModel;
//   AdminModel? get adminModel => _adminModel;
//   void getAdminInfo() async {
//     _adminRepository.currentAdmin().then((res) {
//       if (res != null) {
//         if (res.runtimeType == String) {
//           Utils.toast(res.toString());
//         } else {
//           _adminModel = res;
//           notifyListeners();
//         }
//       } else {
//         Utils.toast('Internet error');
//       }
//     });
//   }
// }
