part of 'company_cubit.dart';

class CompanyState extends Equatable {
  final bool loading;
  final bool success;
  final bool error;
  final String errorStr;
  final CompanyListModel? companyListModel;
  const CompanyState(
      {required this.loading,
      required this.success,
      required this.error,
      required this.errorStr,
      this.companyListModel});

  @override
  List<Object> get props => [loading, success, error, errorStr];

  factory CompanyState.loading() => const CompanyState(
      loading: true, success: false, error: false, errorStr: 'loading');

  factory CompanyState.error(String erorstr) => CompanyState(
      loading: false, success: false, error: true, errorStr: erorstr);
  factory CompanyState.success(CompanyListModel m) => CompanyState(
      loading: false,
      success: false,
      error: false,
      errorStr: 'success',
      companyListModel: m);
  factory CompanyState.init() => const CompanyState(
      loading: false, success: false, error: false, errorStr: 'init');
}
