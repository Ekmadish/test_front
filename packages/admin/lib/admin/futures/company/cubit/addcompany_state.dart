part of 'addcompany_cubit.dart';

class AddcompanyState extends Equatable {
  final bool loading;
  final bool success;
  final bool error;
  final String errorStr;
  final CreateCompanyModel? createCompanyModel;

  const AddcompanyState({
    required this.loading,
    required this.success,
    required this.error,
    required this.errorStr,
    this.createCompanyModel,
  });

  @override
  List<Object> get props => [loading, success, error, errorStr];

  factory AddcompanyState.loading() => const AddcompanyState(
      loading: true, success: false, error: false, errorStr: 'loading');

  factory AddcompanyState.error(String erorstr) => AddcompanyState(
      loading: false, success: false, error: true, errorStr: erorstr);
  factory AddcompanyState.success(CreateCompanyModel createCompanyModel) =>
      AddcompanyState(
          loading: false,
          success: false,
          error: false,
          errorStr: 'success',
          createCompanyModel: createCompanyModel);
  factory AddcompanyState.init() => const AddcompanyState(
      loading: false, success: false, error: false, errorStr: 'init');
}
