part of 'statistics_cubit.dart';

class StatisticsState extends Equatable {
  final bool loading;
  final bool success;
  final bool error;
  final String errorStr;
  final BaseAdminModel? baseAdminModel;
  const StatisticsState(
      {required this.loading,
      required this.success,
      required this.error,
      required this.errorStr,
      this.baseAdminModel});
  @override
  List<Object> get props => [loading, success, error, errorStr];

  factory StatisticsState.loading() => const StatisticsState(
      loading: true, success: false, error: false, errorStr: 'loading');

  factory StatisticsState.error(String erorstr) => StatisticsState(
      loading: false, success: false, error: true, errorStr: erorstr);
  factory StatisticsState.success(BaseAdminModel m) => StatisticsState(
      loading: false,
      success: false,
      error: false,
      errorStr: 'success',
      baseAdminModel: m);
  factory StatisticsState.init() => const StatisticsState(
      loading: false, success: false, error: false, errorStr: 'init');
}
