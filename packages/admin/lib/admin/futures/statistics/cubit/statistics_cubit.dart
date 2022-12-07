import 'package:admin/admin/data/services/admin_repository.dart';
import 'package:admin/admin/model/baseadmin_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:global/global/utils/utils.dart';

part 'statistics_state.dart';

class StatisticsCubit extends Cubit<StatisticsState> {
  StatisticsCubit() : super(StatisticsState.init()) {
    staticsBaseInfo();
  }

  final AdminRepository _adminRepository = AdminRepository();

  void staticsBaseInfo() async {
    emit(StatisticsState.loading());
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
    });
  }
}
