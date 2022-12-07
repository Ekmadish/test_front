part of 'admin_addupdate_cubit.dart';

// ignore: must_be_immutable
class AdminAddUpdateState extends Equatable {
  final bool init;
  final bool loading;
  final bool success;
  final bool error;
  final String errorStr;
  AdminModel? model = AdminModel();
  AdminAddUpdateState(
      {required this.init,
      required this.error,
      required this.errorStr,
      required this.loading,
      required this.success,
      this.model});

  @override
  List<Object> get props => [error, errorStr, loading, success, model ?? 'nil'];

  factory AdminAddUpdateState.loading() => AdminAddUpdateState(
      init: false,
      loading: true,
      success: false,
      error: false,
      errorStr: 'loading');
  factory AdminAddUpdateState.error(String erorstr) => AdminAddUpdateState(
      init: false,
      loading: false,
      success: false,
      error: true,
      errorStr: erorstr);
  factory AdminAddUpdateState.success(AdminModel m) => AdminAddUpdateState(
      init: false,
      loading: false,
      success: true,
      error: false,
      errorStr: 'success',
      model: m);
  factory AdminAddUpdateState.init() => AdminAddUpdateState(
      init: true,
      loading: false,
      success: false,
      error: false,
      errorStr: 'init');
}
