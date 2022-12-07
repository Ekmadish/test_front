part of 'admin_cubit.dart';

class AdminState extends Equatable {
  final bool loading;
  final bool success;
  final bool error;
  final String errorStr;
  final AdminModel? adminModel;
  const AdminState(
      {this.adminModel,
      required this.error,
      required this.errorStr,
      required this.loading,
      required this.success});

  @override
  List<Object> get props => [loading, success, error, errorStr];

  factory AdminState.loading() => const AdminState(
      loading: true, success: false, error: false, errorStr: 'loading');

  factory AdminState.error(String erorstr) => AdminState(
      loading: false, success: false, error: true, errorStr: erorstr);
  factory AdminState.success(AdminModel m) => AdminState(
      loading: false,
      success: false,
      error: false,
      errorStr: 'success',
      adminModel: m);
  factory AdminState.init() => const AdminState(
      loading: false, success: false, error: false, errorStr: 'init');
}
