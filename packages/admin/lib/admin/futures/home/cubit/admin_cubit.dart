import 'package:admin/admin/data/services/admin_repository.dart';
import 'package:admin/admin/model/admin_model.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:global/global/utils/utils.dart';

part 'admin_state.dart';

class AdminCubit extends Cubit<AdminState> {
  AdminCubit() : super(AdminState.init()) {
    getAdminInfo();
  }

  final AdminRepository _adminRepository = AdminRepository();

  void getAdminInfo() async {
    emit(AdminState.loading());
    await _adminRepository.currentAdmin().then((res) {
      if (res != null) {
        if (res.runtimeType == String) {
          emit(AdminState.error(res.toString()));
          Utils.toast(res.toString());
          // log(state.companyListModel!.toJson().toString());
        } else {
          emit(AdminState.success(res));
        }
      } else {
        emit(AdminState.error('internet error'));
        Utils.toast('Internet error');
      }
    });
  }
}
