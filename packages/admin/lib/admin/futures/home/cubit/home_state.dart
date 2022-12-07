part of 'home_cubit.dart';

class HomeState extends Equatable {
  final bool loading;
  final bool success;
  final bool error;
  final String errorStr;
  final AdminModel? adminModel;
  const HomeState(
      {this.adminModel,
      required this.error,
      required this.errorStr,
      required this.loading,
      required this.success});

  @override
  List<Object> get props => [loading, success, error, errorStr];

  factory HomeState.loading() => const HomeState(
      loading: true, success: false, error: false, errorStr: 'loading');

  factory HomeState.error(String erorstr) =>
      HomeState(loading: false, success: false, error: true, errorStr: erorstr);
  factory HomeState.success(AdminModel m) => HomeState(
      loading: false,
      success: false,
      error: false,
      errorStr: 'success',
      adminModel: m);
  factory HomeState.init() =>
      const HomeState(loading: false, success: false, error: false, errorStr: 'init');
}
