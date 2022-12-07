import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasu/admin/data/services/admin_repository.dart';
import 'package:tasu/global/config/constant/auth_state.dart';
import 'package:tasu/global/data/app_state.dart';
import 'package:tasu/global/model/login_model.dart';
import 'package:tasu/global/utils/utils.dart';
import 'package:tasu/main.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginState.init());
  late String loginName;
  late String password;
  late GlobalKey<FormState> loginformKey = GlobalKey<FormState>();
  final AdminRepository _repository = AdminRepository();

  // final MainState mainState = MainState();

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
        log('the data ', error: res.toJson().toString());
        _emitState(LoginState.authorized(res));
        // getIt.get(MainState()).
        // getIt<MainState>()
       mainState.tasuAuth.setAuthSate(AuthState.authorized(true));
      }).catchError(onError);
    }
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    _emitState(LoginState.error(error.toString()));
    Utils.toast(error.toString());

    super.onError(error, stackTrace);
  }

  void _emitState(LoginState s) {
    emit(s);
  }
}
