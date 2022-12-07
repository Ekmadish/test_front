import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:tasu/admin/constant/admin_constant.dart';
import 'package:tasu/admin/data/services/admin_repository.dart';
import 'package:tasu/admin/futures/company/model/create_update_model.dart';
import 'package:tasu/global/utils/utils.dart';

part 'company_addupdate_state.dart';

class CompanyAddUpdateCubit extends Cubit<CompanyAddUpdateState> {
  CompanyAddUpdateCubit() : super(CompanyAddUpdateState.init());
  final AdminRepository _repository = AdminRepository();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final ValueNotifier<AddOrUpdateSate> _addupdatenotifier =
      ValueNotifier(AddOrUpdateSate.Init);
  ValueNotifier<AddOrUpdateSate> get addupdatenotifier => _addupdatenotifier;
  late final CompanyAddUpdateModel _addUpdateModel = CompanyAddUpdateModel();
  CurrentCompany _company = CurrentCompany();
  SuperUser _superUser = SuperUser();

  void delte() async {}
  void save() {
    if (formKey.currentState!.validate()) {
      _addupdatenotifier.value = AddOrUpdateSate.Loading;
      _repository
          .transCompanyCreateOrUpdate(state.model ?? _addUpdateModel)
          .then((res) {
        if (res != null) {
          if (res.runtimeType == String) {
            _addupdatenotifier.value = AddOrUpdateSate.Error;
            Utils.toast(res.toString());
          } else {
            _addupdatenotifier.value = AddOrUpdateSate.Success;
            Utils.toast(
                state.model == null ? 'Added company' : 'Update company');
            formKey.currentState!.save();
          }
        } else {
          Utils.toast('Internet error');
        }
      });
    }
  }

  void gettransCompany(String cguid) async {
    emit(CompanyAddUpdateState.loading());
    await _repository.transCompanyId(cguid).then((res) {
      // print('company info ${res.toJson().toString()}');
      if (res != null) {
        if (res.runtimeType == String) {
          emit(CompanyAddUpdateState.error(res.toString()));
          Utils.toast(res.toString());
        } else {
          emit(CompanyAddUpdateState.success(res));
          dataChages(
            companyGuid: res.currentCompany!.guid,
            userguid: res.superUser!.guid,
            companyName: res.currentCompany!.companyName,
            bin: res.currentCompany!.bin,
            email: res.superUser!.email,
            phone: res.superUser!.phone,
            name: res.superUser!.name,
            givenName: res.superUser!.givenName,
            surname: res.superUser!.surname,
            password: res.superUser!.password,
            businessLicenseUrl: res.currentCompany!.businessLicenseUrl,
            legalRepresentativeName:
                res.currentCompany!.legalRepresentativeName,
            legalRepresentativeId: res.currentCompany!.legalRepresentativeId,
            info: res.currentCompany!.info,
            logoUrl: res.currentCompany!.logoUrl,
            tin: res.currentCompany!.tin,
            ogrn: res.currentCompany!.ogrn,
            okpo: res.currentCompany!.okpo,
            trn: res.currentCompany!.trn,
            rrc: res.currentCompany!.rrc,
          );
        }
      } else {
        Utils.toast('Internet error');
      }
    }).catchError(onError);
  }

  void dataChages({
    String? companyGuid,
    String? userguid,
    String? companyName,
    String? bin,
    String? email,
    String? phone,
    String? name,
    String? givenName,
    String? surname,
    String? password,
    String? businessLicenseUrl,
    String? legalRepresentativeName,
    String? legalRepresentativeId,
    String? info,
    String? logoUrl,
    String? tin,
    String? ogrn,
    String? okpo,
    String? trn,
    String? rrc,
  }) {
    state.model = _addUpdateModel.copyWith(
        c: _company = _company.copyWith(
          guid: companyGuid,
          companyName: companyName,
          bin: bin,
          logoUrl: logoUrl,
          tin: tin,
          ogrn: ogrn,
          okpo: okpo,
          trn: trn,
          rrc: rrc,
          info: info,
          businessLicenseUrl: businessLicenseUrl,
          legalRepresentativeName: legalRepresentativeName,
          legalRepresentativeId: legalRepresentativeId,
        ),
        s: _superUser = _superUser.copyWith(
          guid: userguid,
          companyGuid: companyGuid,
          info: info,
          phone: phone,
          email: email,
          password: password,
          name: name,
          givenName: givenName,
          surname: surname,
        ));
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    emit(CompanyAddUpdateState.error(error.toString()));
    super.onError(error, stackTrace);
  }

  @override
  Future<void> close() {
    _addupdatenotifier.dispose();
    return super.close();
  }
}
