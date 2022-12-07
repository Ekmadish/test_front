part of 'login_cubit.dart';

@immutable
class LoginState extends Equatable {
  final LoginModel? loginModel;
  final bool loading;
  final bool haserror;
  final bool authorized;
  final String errStr;
  const LoginState(
      {this.loginModel,
      required this.loading,
      required this.haserror,
      required this.errStr,
      required this.authorized});

  @override
  List<Object> get props => [haserror, authorized, errStr, loading];
  factory LoginState.init() => const LoginState(
        errStr: 'init',
        haserror: false,
        loading: false,
        authorized: false,
      );
  factory LoginState.authorized(LoginModel loginModel) => LoginState(
        loginModel: loginModel,
        errStr: 'authorized',
        haserror: false,
        loading: false,
        authorized: true,
      );
  factory LoginState.error(String error) => LoginState(
        errStr: error,
        haserror: true,
        loading: false,
        authorized: false,
      );
  factory LoginState.loading() => const LoginState(
        errStr: 'loading',
        haserror: false,
        loading: true,
        authorized: false,
      );
  factory LoginState.unauthorized(String error) => LoginState(
        errStr: error,
        haserror: true,
        loading: false,
        authorized: false,
      );
}
