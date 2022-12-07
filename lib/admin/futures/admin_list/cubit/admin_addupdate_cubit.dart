import 'dart:async';
import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasu/admin/constant/admin_constant.dart';
import 'package:tasu/admin/data/services/admin_repository.dart';
import 'package:tasu/admin/futures/admin_list/model/admin_addupdate_model.dart';
import 'package:tasu/admin/futures/admin_list/model/admin_model.dart';
import 'package:tasu/admin/futures/admin_list/model/admintype_liset_model.dart';
import 'package:tasu/global/utils/utils.dart';

part 'admin_addupdate_state.dart';

class AdminAddUpdateCubit extends Cubit<AdminAddUpdateState> {
  AdminAddUpdateCubit() : super(AdminAddUpdateState.init());
  final AdminRepository _repository = AdminRepository();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final ValueNotifier<AddOrUpdateSate> _addupdatenotifier =
      ValueNotifier(AddOrUpdateSate.Init);
  ValueNotifier<AddOrUpdateSate> get addupdatenotifier => _addupdatenotifier;
  AdminModel _updateModel = AdminModel();
  void save() {
    if (formKey.currentState!.validate()) {
      _addupdatenotifier.value = AddOrUpdateSate.Loading;
      _repository.adminCreateOrUpdate(state.model!).then((res) {
        _addupdatenotifier.value = AddOrUpdateSate.Success;
      }).catchError(onSaveError);
    }
  }

  void onSaveError(Object error, StackTrace stackTrace) {
    log('the error is', error: error);
    _addupdatenotifier.value = AddOrUpdateSate.Error;
    Utils.toast(error.toString());
    super.onError(error, stackTrace);
  }

  Future<void> getAdmin(String aguid) async {
    emit(AdminAddUpdateState.loading());
    _repository.adminId(aguid).then((res) {
      // var string = rs
      emit(AdminAddUpdateState.success(res));
      _updateModel = res;
    }).catchError(onError);
  }

  Future<AdminTypeModel> getAdminstratorTypeList() async {
    return await _repository.adminstratorTypeList();
  }

  void dataChages(
      {String? guid,
      String? adminTypeGuid,
      String? name,
      String? givenName,
      String? surname,
      String? phone,
      String? email,
      String? autograph,
      String? avatarUrl,
      int? birthday,
      int? gender,
      String? password}) {
    state.model = _updateModel = _updateModel.copyWith(
      guid: guid,
      adminTypeGuid: adminTypeGuid ?? state.model?.adminTypeGuid ?? '',
      name: name,
      givenName: givenName,
      surname: surname,
      phone: phone,
      email: email,
      password: password ?? state.model?.password ?? '',
      autograph: autograph ?? state.model?.autograph ?? '',
      avatarUrl: avatarUrl ?? state.model?.avatarUrl ?? '',
      birthday: birthday,
      gender: gender,
    );
    print(_updateModel.toJson().toString());
  }

  @override
  Future<void> close() {
    return super.close();
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    log('the error is', error: error);
    emit(AdminAddUpdateState.error(error.toString()));
    super.onError(error, stackTrace);
  }
}
