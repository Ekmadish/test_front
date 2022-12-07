import 'package:flutter/material.dart';
import 'package:tasu/admin/data/services/admin_repository.dart';
import 'package:tasu/admin/model/baseadmin_model.dart';
import 'package:tasu/global/utils/utils.dart';

class AdminProvider with ChangeNotifier {
  AdminProvider() {
    adminBaseInfo();
  }
  final ValueNotifier<bool> _open = ValueNotifier(true);
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
