part of 'company_addupdate_cubit.dart';

// ignore: must_be_immutable
class CompanyAddUpdateState extends Equatable {
  final bool init;
  final bool loading;
  final bool success;
  final bool error;
  final String errorStr;
  CompanyAddUpdateModel? model;
  CompanyAddUpdateState(
      {this.model,
      required this.init,
      required this.error,
      required this.errorStr,
      required this.loading,
      required this.success});

  @override
  List<Object> get props => [error, errorStr, loading, success, model ?? 'nil'];

  CompanyAddUpdateState copyWith(CompanyAddUpdateModel? model) {
    return CompanyAddUpdateState(
      model: model ?? this.model,
      loading: loading,
      error: error,
      errorStr: errorStr,
      init: init,
      success: success,
    );
  }

  factory CompanyAddUpdateState.loading() => CompanyAddUpdateState(
      init: false,
      loading: true,
      success: false,
      error: false,
      errorStr: 'loading');
  factory CompanyAddUpdateState.error(String erorstr) => CompanyAddUpdateState(
      init: false,
      loading: false,
      success: false,
      error: true,
      errorStr: erorstr);
  factory CompanyAddUpdateState.success(CompanyAddUpdateModel m) => CompanyAddUpdateState(
        init: false,
        loading: false,
        success: true,
        error: false,
        errorStr: 'success',
        model: m,
      );
  factory CompanyAddUpdateState.init() => CompanyAddUpdateState(
        init: true,
        loading: false,
        success: false,
        error: false,
        errorStr: 'init',
      );
}
