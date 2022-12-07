
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasu/admin/futures/admin_list/cubit/admin_addupdate_cubit.dart';
import 'package:tasu/admin/futures/admin_list/model/admin_model.dart';
import 'package:tasu/admin/futures/admin_list/model/admintype_liset_model.dart';
import 'package:tasu/admin/view/screen/addorupdate_screen.dart';
import 'package:tasu/global/widgets/responsive.dart';
import 'package:tasu/global/widgets/textfileds_widget.dart';
import 'package:tasu/global/widgets/tr_widget.dart';
import 'package:tasu/global/widgets/widgets.dart';

class AdminAddUpdateScreen extends StatelessWidget {
  final String? adminGuid;
  // ignore: prefer_const_constructors_in_immutables
  AdminAddUpdateScreen({Key? key, this.adminGuid}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        lazy: true,
        create: (context) => AdminAddUpdateCubit(),
        child: BlocBuilder<AdminAddUpdateCubit, AdminAddUpdateState>(
          buildWhen: (previous, current) => false,
          builder: (context, state) {
            var apcubit = context.read<AdminAddUpdateCubit>();
            return AddOrUpdateScreen(
              addupdatenotifier: apcubit.addupdatenotifier,
              btnPress: () async {
                apcubit.save();
              },
              centerChild: Builder(builder: (context) {
                // if (adminGuid != null) apcubit.getAdmin(adminGuid!);
                return CenterWidget(
                  adminGuid: adminGuid,
                );
              }),
              isAdd: adminGuid == null,
            );
          },
        ));
  }
}

class CenterWidget extends StatelessWidget {
  final String? adminGuid;

  // ignore: prefer_const_constructors_in_immutables
  CenterWidget({Key? key, this.adminGuid}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<AdminAddUpdateCubit>();
    // print(admin!.gender.toString());
    return FutureBuilder(
      future: adminGuid == null ? null : cubit.getAdmin(adminGuid!),
      builder: (context, snapshot) =>
          BlocBuilder<AdminAddUpdateCubit, AdminAddUpdateState>(
        builder: (context, state) {
          if (state.loading) {
            return const LoadingWidget();
          } else {
            // if (adminGuid != null) {
            //   // cubit.dataChages(
            //   //   // password: admin!.,
            //   //   autograph: adminGuid!.autograph,
            //   //   avatarUrl: adminGuid!.avatarUrl,
            //   //   birthday: adminGuid!.birthday,
            //   // );
            // }
            return Form(
                key: cubit.formKey,
                child: ListView(
                  shrinkWrap: true,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                  children: [
                    StandartTextField(
                      label: 'l_Email',
                      isRequired: true,
                      title: 'l_Email',
                      hintText:
                          state.model == null ? null : state.model!.email!,
                      onChanged: (str) {
                        cubit.dataChages(email: str);
                      },
                    ),
                    StandartTextField(
                      label: 'l_Name',
                      isRequired: true,
                      title: 'l_Name',
                      hintText: state.model == null ? null : state.model!.name!,
                      onChanged: (str) {
                        cubit.dataChages(name: str);
                      },
                    ),
                    StandartTextField(
                      label: 'l_GivenName',
                      isRequired: true,
                      title: 'l_GivenName',
                      hintText:
                          state.model == null ? null : state.model!.givenName!,
                      onChanged: (str) {
                        cubit.dataChages(givenName: str);
                      },
                    ),
                    StandartTextField(
                      label: 'l_Surname',
                      isRequired: true,
                      title: 'l_Surname',
                      hintText:
                          state.model == null ? null : state.model!.surname!,
                      onChanged: (str) {
                        cubit.dataChages(surname: str);
                      },
                    ),
                    StandartTextField(
                      label: 'l_Phone',
                      isRequired: true,
                      title: 'l_Phone',
                      keyboardType: TextInputType.phone,
                      hintText:
                          state.model == null ? null : state.model!.phone!,
                      onChanged: (str) {
                        cubit.dataChages(phone: str);
                      },
                    ),
                    adminGuid == null
                        ? PasswordTextField(
                            title: 'l_Password',
                            label: 'l_Password',
                            onChanged: (str) {
                              cubit.dataChages(password: str);
                            },
                          )
                        : const SizedBox(),
                    RadioWidget(
                      val: adminGuid != null ? state.model!.gender : 0,
                      // admin != null ? admin!.gender : null,
                      onchange: (value) {
                        cubit.dataChages(gender: value);
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 4, horizontal: 0),
                      child: Row(
                        children: [
                          Responsive.isWebOrDesktop()
                              ? const Spacer(flex: 7)
                              : const SizedBox(),
                          Container(
                            constraints: const BoxConstraints(
                                maxHeight: 32, maxWidth: 400),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(2),
                                border:
                                    Border.all(color: const Color(0xffd9d9d9))),
                            child: FutureBuilder<AdminTypeModel>(
                              future: cubit.getAdminstratorTypeList(),
                              builder: (context, snapshot) {
                                // log('state inside ' +
                                //     state.model!.role.toString());
                                // log(adminGuid ?? 'null guid');
                                // log('out side ===>' +
                                //     snapshot.data!.adminTypeList!.first.typeName
                                //         .toString());
                                if (snapshot.data != null) {
                                  return DropdownButtonFormField<
                                      AdminTypeListModel>(
                                    alignment: AlignmentDirectional.center,
                                    autofocus: false,
                                    value:
                                        // adminGuid == null
                                        //     ?
                                        snapshot.data!.adminTypeList!.first
                                    //   : snapshot.data!.adminTypeList!.first
                                    // ..typeName = state.model!.role
                                    ,
                                    borderRadius: BorderRadius.circular(2),
                                    items: snapshot.data!.adminTypeList!
                                        .map((e) => DropdownMenuItem<
                                                AdminTypeListModel>(
                                              value: e,
                                              alignment: Alignment.center,
                                              child: Text(e.typeName!),
                                            ))
                                        .toList(),
                                    onChanged: (newValue) {
                                      cubit.dataChages(
                                          adminTypeGuid: newValue!.guid);
                                    },
                                    decoration: InputDecoration(
                                      label: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          const Text(
                                            "*",
                                            overflow: TextOverflow.fade,
                                            maxLines: 1,
                                            softWrap: false,
                                            style: TextStyle(color: Colors.red),
                                          ),
                                          Flexible(
                                            child: TrWidget(
                                              trkey: '',
                                              softWrap: false,
                                              alignment: null,
                                            ),
                                          ),
                                        ],
                                      ),

                                      constraints: const BoxConstraints(
                                          maxHeight: 32, maxWidth: 400),
                                      errorStyle: const TextStyle(height: .01),
                                      fillColor: const Color(0xffd9d9d9),
                                      focusColor: const Color(0xffd9d9d9),
                                      hoverColor: Colors.white,
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                              horizontal: 8),
                                      // suffixIcon: ,
                                      // suffix: Icon(Icons.view_agenda),
                                      filled: false,
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(2),
                                          borderSide: const BorderSide(
                                              color: Color(0xffd9d9d9))),
                                      hintText: 'admin type',
                                      // prefixIcon: ,
                                    ),
                                  );
                                }
                                return const SizedBox();
                              },
                            ),
                          ),
                          Responsive.isWebOrDesktop()
                              ? const Spacer(flex: 7)
                              : const SizedBox(),
                        ],
                      ),
                    )
                  ],
                ));
          }
        },
      ),
    );
  }
}
