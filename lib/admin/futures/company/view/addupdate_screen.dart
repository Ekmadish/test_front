import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasu/admin/futures/company/cubit/company_addupdate_cubit.dart';
import 'package:tasu/admin/view/screen/addorupdate_screen.dart';
import 'package:tasu/admin/view/widget/adaptive_scafold_widget.dart';
import 'package:tasu/global/widgets/textfileds_widget.dart';
import 'package:tasu/global/widgets/widgets.dart';

class AddUpdateCompanyScreen extends StatelessWidget {
  final String? companyGuid;

  // final ValueChanged<int>? onDestinationSelected;
  // final List<AdaptiveScaffoldDestination> destinations;
  // final int selectedIndex;
  // final Widget? drawerHeader;
  // ignore: prefer_const_constructors_in_immutables
  AddUpdateCompanyScreen({
    Key? key,
    this.companyGuid,
    //  this.drawerHeader,
    //   this.onDestinationSelected,
    //   required this.destinations,
    //   required this.selectedIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        lazy: true,
        create: (context) => CompanyAddUpdateCubit(),
        child: BlocBuilder<CompanyAddUpdateCubit, CompanyAddUpdateState>(
          buildWhen: (previous, current) => false,
          builder: (context, state) {
            // state.model ??= const CompanyAddUpdateModel();
            final cubit = context.read<CompanyAddUpdateCubit>();
            return AddOrUpdateScreen(
                centerChild: CenterWidget(companyGuid: companyGuid),
                addupdatenotifier: cubit.addupdatenotifier,
                btnPress: () {
                  context.read<CompanyAddUpdateCubit>().save();
                },
                isAdd: companyGuid == null);
          },
        ));
  }
}

class CenterWidget extends StatelessWidget {
  final String? companyGuid;
  // ignore: prefer_const_constructors_in_immutables
  CenterWidget({Key? key, this.companyGuid}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<CompanyAddUpdateCubit>();

    if (companyGuid != null) cubit.gettransCompany(companyGuid!);

    return BlocBuilder<CompanyAddUpdateCubit, CompanyAddUpdateState>(
      builder: (context, state) {
        if (state.loading) {
          return const LoadingWidget();
        } else {
          // cubit.dataChages(model: state.model);
          return Form(
            key: cubit.formKey,
            child: ListView(
              shrinkWrap: true,
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
              children: [
                StandartTextField(
                  label: 'l_CompanyName',
                  isRequired: true,
                  title: 'l_CompanyName',
                  hintText: state.model == null
                      ? null
                      : state.model!.currentCompany!.companyName,
                  onChanged: (str) {
                    cubit.dataChages(companyName: str);
                  },
                ),
                StandartTextField(
                  label: 'l_Bin',
                  isRequired: true,
                  title: 'l_Bin',
                  hintText: state.model == null
                      ? null
                      : state.model!.currentCompany!.bin,
                  onChanged: (str) {
                    cubit.dataChages(bin: str);
                  },
                ),
                StandartTextField(
                  isRequired: true,
                  title: 'l_Email',
                  label: 'l_Email',
                  hintText: state.model == null
                      ? null
                      : state.model!.superUser!.email,
                  onChanged: (str) {
                    cubit.dataChages(email: str);
                  },
                ),
                StandartTextField(
                  isRequired: true,
                  title: 'l_Phone',
                  label: 'l_Phone',
                  hintText: state.model == null
                      ? null
                      : state.model!.superUser!.phone,
                  onChanged: (str) {
                    cubit.dataChages(phone: str);
                  },
                ),
                StandartTextField(
                  isRequired: true,
                  title: 'l_GivenName',
                  label: 'l_GivenName',
                  hintText: state.model == null
                      ? null
                      : state.model!.superUser!.givenName,
                  onChanged: (str) {
                    cubit.dataChages(givenName: str);
                  },
                ),
                StandartTextField(
                  isRequired: true,
                  title: 'l_Surname',
                  label: 'l_Surname',
                  hintText: state.model == null
                      ? null
                      : state.model!.superUser!.surname,
                  onChanged: (str) {
                    cubit.dataChages(surname: str);
                  },
                ),
                StandartTextField(
                  isRequired: true,
                  title: 'l_UserName',
                  label: 'l_UserName',
                  hintText:
                      state.model == null ? null : state.model!.superUser!.name,
                  onChanged: (str) {
                    cubit.dataChages(name: str);
                  },
                ),
                PasswordTextField(
                  title: 'l_Password',
                  label: 'l_Password',
                  hintText: state.model == null
                      ? null
                      : state.model!.superUser!.password,
                  onChanged: (str) {
                    cubit.dataChages(password: str);
                  },
                ),
                // PasswordTextField(
                //   title: 'l_ConfirmPassword',
                //   label: 'l_ConfirmPassword',
                //   hintText: state.model == null
                //       ? null
                //       : state.model!.superUser!.password,
                //   onChanged: (str) {
                //     cubit.dataChages(password: str);
                //   },
                // ),
                StandartTextField(
                  isRequired: false,
                  title: 'l_businessLicenseUrl',
                  label: 'l_businessLicenseUrl',
                  hintText: state.model == null
                      ? null
                      : state.model!.currentCompany!.businessLicenseUrl,
                  onChanged: (str) {
                    cubit.dataChages(businessLicenseUrl: str);
                  },
                ),
                StandartTextField(
                  isRequired: false,
                  title: 'l_LegalName',
                  label: 'l_LegalName',
                  hintText: state.model == null
                      ? null
                      : state.model!.currentCompany!.legalRepresentativeName,
                  onChanged: (str) {
                    cubit.dataChages(legalRepresentativeName: str);
                  },
                ),
                StandartTextField(
                  isRequired: false,
                  title: 'l_LegalId',
                  label: 'l_LegalId',
                  hintText: state.model == null
                      ? null
                      : state.model!.currentCompany!.legalRepresentativeId,
                  onChanged: (str) {
                    cubit.dataChages(legalRepresentativeId: str);
                  },
                ),
                RichTextField(
                  isRequired: false,
                  title: 'l_Info',
                  label: 'l_Info',
                  hintText: state.model == null
                      ? null
                      : state.model!.currentCompany!.info,
                  maxLines: 10,
                  onChanged: (str) {
                    cubit.dataChages(info: str);
                  },
                  // maxLines: 30,
                ),
                PickFileWidget(
                  title: 'LogoUrl',
                  //image url
                ),
                StandartTextField(
                  isRequired: false,
                  title: 'Tin',
                  label: 'Tin',
                  hintText: state.model == null
                      ? null
                      : state.model!.currentCompany!.tin,
                  onChanged: (str) {
                    cubit.dataChages(tin: str);
                  },
                ),
                StandartTextField(
                  isRequired: false,
                  title: 'Ogrn',
                  label: 'Ogrn',
                  hintText: state.model == null
                      ? null
                      : state.model!.currentCompany!.ogrn,
                  onChanged: (str) {
                    cubit.dataChages(ogrn: str);
                  },
                ),
                StandartTextField(
                  isRequired: false,
                  title: 'Okpo',
                  label: 'Okpo',
                  hintText: state.model == null
                      ? null
                      : state.model!.currentCompany!.okpo,
                  onChanged: (str) {
                    cubit.dataChages(okpo: str);
                  },
                ),
                StandartTextField(
                  isRequired: false,
                  title: 'Trn',
                  label: 'Trn',
                  hintText: state.model == null
                      ? null
                      : state.model!.currentCompany!.trn,
                  onChanged: (str) {
                    cubit.dataChages(trn: str);
                  },
                ),
                StandartTextField(
                  isRequired: false,
                  title: 'Rrc',
                  label: 'Rrc',
                  hintText: state.model == null
                      ? null
                      : state.model!.currentCompany!.rrc,
                  onChanged: (str) {
                    cubit.dataChages(rrc: str);
                  },
                ),
                const Padding(padding: EdgeInsets.symmetric(vertical: 20))
              ],
            ),
          );
        }
      },
    );
  }
}
