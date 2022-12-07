import 'package:admin/admin/data/services/admin_repository.dart';
import 'package:admin/admin/model/admin_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:global/global/utils/utils.dart'; 

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeState.init()) {
    // getAdminInfo(); 
  }

  final AdminRepository _adminRepository = AdminRepository();

  void getAdminInfo() async {
    _adminRepository.currentAdmin().then((res) {
      if (res != null) {
        if (res.runtimeType == String) {
          emit(HomeState.error(res.toString()));
          Utils.toast(res.toString());
          // log(state.companyListModel!.toJson().toString());
        } else {
          emit(HomeState.success(res));
        }
      } else {
        emit(HomeState.error('internet error'));
        Utils.toast('Internet error');
      }
    });
  }
}
