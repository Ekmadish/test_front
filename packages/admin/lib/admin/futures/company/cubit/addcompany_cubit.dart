import 'package:admin/admin/data/services/admin_repository.dart';
import 'package:admin/admin/futures/company/model/create_company_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:global/global/utils/utils.dart';

import '../model/create_update_model.dart';

part 'addcompany_state.dart';

class AddcompanyCubit extends Cubit<AddcompanyState> {
  AddcompanyCubit() : super(AddcompanyState.init());

  final AdminRepository _repo = AdminRepository();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  // ignore: non_constant_identifier_names
  late final ValueNotifier<CompanyAddUpdateModel> _CompanyAddUpdateModel =
      ValueNotifier(CompanyAddUpdateModel());

  ValueNotifier<CompanyAddUpdateModel> get sCompanyAddUpdateModel =>
      _CompanyAddUpdateModel;

  void createCompany() async {
    // if (formKey.currentState!.validate()) {
    emit(AddcompanyState.loading());
    await _repo.transCompanyCreateOrUpdate().then((res) {
      if (res != null) {
        if (res.runtimeType == String) {
          emit(AddcompanyState.error(res.toString()));
          Utils.toast(res.toString());
        } else {
          emit(AddcompanyState.success(res));
        }
      } else {
        emit(AddcompanyState.error('internet error'));

        Utils.toast('Internet error');
      }
    });
    // }
  }

  void onModlChages({
    int? id,
    String? companyGuid,
    String? givenName,
    String? companyName,
    String? userGuid,
    String? email,
    String? userName,
    String? bin,
    String? phone,
    String? surname,
    String? password,
    String? confirmPassword,
    int? role,
    int? status,
    int? isVerify,
    int? addTime,
    int? updateTime,
    int? qStatus,
    String? logoUrl,
    String? tin,
    String? ogrn,
    String? okpo,
    String? trn,
    String? rrc,
    String? info,
    String? businessLicenseUrl,
    String? legalRepresentativeName,
    String? legalRepresentativeId,
  }) {
    _CompanyAddUpdateModel.value = _CompanyAddUpdateModel.value.copyWith(
      companyGuid: companyGuid,
      bin: bin,
      businessLicenseUrl: businessLicenseUrl,
      companyName: companyName,
      surname: surname,
      password: password,
      userGuid: userGuid,
      email: email,
      phone: phone,
      userName: userName,
      givenName: givenName,
      confirmPassword: confirmPassword,
      info: info,
      legalRepresentativeId: legalRepresentativeId,
      legalRepresentativeName: legalRepresentativeName,
      logoUrl: logoUrl,
      ogrn: ogrn,
      okpo: okpo,
      rrc: rrc,
      tin: tin,
      trn: trn,
    );
    // log('oncahnge     ${_CompanyAddUpdateModel.toJson()}');
  }
}
