import 'package:admin/admin/data/services/admin_repository.dart';
import 'package:admin/admin/futures/auth/login/model/login_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:global/global/data/provider/auth_provider.dart';
import 'package:utils/utils/utils.dart';
part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginState.init());
  late String loginName;
  late String password;
  late GlobalKey<FormState> loginformKey = GlobalKey<FormState>();
  final AdminRepository _repository = AdminRepository();

  void reset() {
    if (!state.authorized) {
      _emitState(LoginState.init());
    }
  }

  void login() async {
    if (loginformKey.currentState!.validate()) {
      _emitState(LoginState.loading());
      _repository
          .login(
        loginName: loginName,
        password: password,
      )
          .then((res) {
        // Future.delayed( Duration(seconds: 4), () {
        //   _emitState(LoginState.authorized(LoginModel()));
        // });
        if (res != null) {
          if (res.runtimeType == String) {
            Utils.toast(res.toString());
            _emitState(LoginState.unauthorized(res.toString()));
          } else {
            _emitState(LoginState.authorized(res));
            AuthProvider().setAuthState(true);
          }
        } else {
          _emitState(LoginState.error('internet error '));
          Utils.toast('internet error ');
        }
      });
    }
  }

  void _emitState(LoginState s) {
    emit(s);
  }

  Future<void> logOut() async {
    // _repository.logOut();
    _emitState(LoginState.unauthorized('logOut'));
  }
}
