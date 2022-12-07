import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasu/admin/data/services/admin_repository.dart';
import 'package:tasu/admin/futures/admin_list/model/admin_model.dart';
import 'package:tasu/admin/model/admin_model.dart';
import 'package:tasu/global/utils/utils.dart';

part 'admin_state.dart';

class AdminCubit extends Cubit<AdminState> {
  AdminCubit() : super(AdminState.init());

  final AdminRepository _adminRepository = AdminRepository();

  void getAdminInfo() async {
    if (state.adminModel == null) {
      emit(AdminState.loading());
      await _adminRepository.currentAdmin().then((res) {
        emit(AdminState.success(res));
      }).catchError(onError);
    }
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    emit(AdminState.error(error.toString()));
    Utils.toast(error.toString());
    super.onError(error, stackTrace);
  }

  @override
  Future<void> close() {
    return super.close();
  }
}
