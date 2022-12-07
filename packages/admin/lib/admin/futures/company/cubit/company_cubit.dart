import 'package:admin/admin/data/services/admin_repository.dart';
import 'package:admin/admin/futures/company/model/compony_list_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:global/global/utils/utils.dart';
part 'company_state.dart';

class CompanyCubit extends Cubit<CompanyState> {
  CompanyCubit() : super(CompanyState.init());
  final AdminRepository _repository = AdminRepository();

  Future<void> getTranscompanyList() async {
    emit(CompanyState.loading());
    await _repository.transCompanyList().then((res) {
      if (res != null) {
        if (res.runtimeType == String) {
          emit(CompanyState.error(res.toString()));
          Utils.toast(res.toString()); 
        } else {
          emit(CompanyState.success(res));
        }
      } else {
        emit(CompanyState.error('internet error'));
        Utils.toast('Internet error');
      }
    });
  }
}
