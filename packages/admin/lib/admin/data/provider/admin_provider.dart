import 'package:admin/admin/data/services/admin_repository.dart';
import 'package:admin/admin/model/baseadmin_model.dart';
import 'package:flutter/material.dart';
import 'package:utils/utils/utils.dart';

class AdminProvider with ChangeNotifier {
  AdminProvider() {
    adminBaseInfo();
  }
  // final ValueNotifier<bool> _open = ValueNotifier(true);w
  final AdminRepository _adminRepository = AdminRepository();
  BaseAdminModel? baseAdminModel = BaseAdminModel();
  adminBaseInfo() async {
    // log('called base ingo ');
    await _adminRepository.baseDataInfo().then((res) {
      if (res != null) {
        if (res.runtimeType == String) {
          Utils.toast(res.toString());
        } else {
          baseAdminModel = res;
        }
      } else {
        Utils.toast('Internet error');
      }
    });
    notifyListeners();
  }
}
