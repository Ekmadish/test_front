import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tasu/admin/data/services/admin_repository.dart';
import 'package:tasu/admin/model/baseadmin_model.dart';
import 'package:tasu/global/utils/utils.dart';

part 'statistics_state.dart';

class StatisticsCubit extends Cubit<StatisticsState> {
  StatisticsCubit() : super(StatisticsState.init()) {
    // staticsBaseInfo();
  }

  final AdminRepository _adminRepository = AdminRepository();

  void staticsBaseInfo() async {
    if (state.baseAdminModel == null) {
      emit(StatisticsState.loading());
      _staticsBaseInfo();
    } else {
      _staticsBaseInfo();
    }
  }

  void _staticsBaseInfo() async {
    await _adminRepository.baseDataInfo().then((res) {
      if (res != null) {
        if (res.runtimeType == String) {
          emit(StatisticsState.error(res.toString()));
          Utils.toast(res.toString());
        } else {
          emit(StatisticsState.success(res));
        }
      } else {
        Utils.toast('Internet error');
      }
    }).catchError(onError);
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    emit(StatisticsState.error(error.toString()));
    super.onError(error, stackTrace);
  }
}
