import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasu/client/data/repository.dart';
import 'package:tasu/global/config/constant/auth_state.dart';
import 'package:tasu/global/data/app_state.dart';
import 'package:tasu/global/model/login_model.dart';
import 'package:tasu/global/utils/utils.dart';
import 'package:tasu/main.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginState.init());

  String _loginName = '';
  String _password = '';
  late GlobalKey<FormState> loginformKey = GlobalKey<FormState>();
  final ClientRepository _repository = ClientRepository();

  void onChangeInfo({String? loginName, String? password}) {
    if (loginName != null) _loginName = loginName;
    if (password != null) _password = password;
  }

  void reset() {
    if (!state.authorized) {
      emit(LoginState.init());
    }
  }

  void login() async {
    if (loginformKey.currentState!.validate()) {
      emit(LoginState.loading());
      _repository.login(loginName: _loginName, password: _password).then((res) {
        log('the data ${res.toJson().toString()}');
        emit(LoginState.authorized(res));
        // getIt<MainState>().tasuAuth.setAuthSate(AuthState.authorized(false));
        // MainState().tasuAuth.setAuthSate(AuthState.authorized(false));
        mainState.tasuAuth.setAuthSate(AuthState.authorized(false));
      }).catchError(onError);
    }
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    Utils.toast(error.toString());
    emit(LoginState.unauthorized(error.toString()));
    super.onError(error, stackTrace);
  }
}
