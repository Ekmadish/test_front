// import 'package:admin/admin/futures/company/cubit/addcompany_cubit.dart';
// import 'package:admin/admin/futures/company/model/create_update_model.dart';
// import 'package:admin/admin/futures/company/model/create_update_model.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:global/global/widgets/cupertinbtn_widget.dart';
// import 'package:global/global/widgets/loading_widget.dart';
// import 'package:global/global/widgets/textfild_widget.dart';

// class AddCompanyScreen extends StatelessWidget {
//   const AddCompanyScreen({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       lazy: true,
//       create: (context) => AddcompanyCubit(),
//       child: BlocBuilder<AddcompanyCubit, AddcompanyState>(
//         buildWhen: (previous, current) => false,
//         builder: (context, state) {
//           var addcompanyCubit = context.read<AddcompanyCubit>();

//           return Scaffold(
//             body: Row(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               mainAxisAlignment: MainAxisAlignment.center,
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 Expanded(
//                   flex: 6,
//                   child: Form(
//                     key: context.read<AddcompanyCubit>().formKey,
//                     child: ListView(
//                       shrinkWrap: true,
//                       padding: const EdgeInsets.symmetric(horizontal: 10),
//                       children: [
//                         const Text('Add company',
//                             textAlign: TextAlign.center,
//                             style: TextStyle(fontSize: 20)),
//                         Row(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           mainAxisAlignment: MainAxisAlignment.start,
//                           children: [
//                             Expanded(
//                               child: Column(
//                                 children: [
//                                   TextFialdWidget(
//                                     hintText: 'CompanyGuid',
//                                     onChanged: (str) {
//                                       addcompanyCubit.onModlChages(
//                                           companyGuid: str);
//                                     },
//                                     validator: (str) {
//                                       return str!.isEmpty
//                                           ? 'CompanyGuid is empty'
//                                           : null;
//                                     },
//                                   ),
//                                   TextFialdWidget(
//                                     hintText: 'UserGuid',
//                                     onChanged: (str) {
//                                       addcompanyCubit.onModlChages(
//                                           userGuid: str);
//                                     },
//                                     validator: (str) {
//                                       return str!.isEmpty
//                                           ? 'UserGuid is empty'
//                                           : null;
//                                     },
//                                   ),
//                                   TextFialdWidget(
//                                     hintText: 'CompanyName',
//                                     onChanged: (str) {
//                                       addcompanyCubit.onModlChages(
//                                           companyName: str);
//                                     },
//                                     validator: (str) {
//                                       return str!.isEmpty
//                                           ? 'CompanyName is empty'
//                                           : null;
//                                     },
//                                   ),
//                                   TextFialdWidget(
//                                     hintText: 'Bin',
//                                     onChanged: (str) {
//                                       addcompanyCubit.onModlChages(bin: str);
//                                     },
//                                     validator: (str) {
//                                       return str!.isEmpty
//                                           ? 'Bin is empty'
//                                           : null;
//                                     },
//                                   ),
//                                   TextFialdWidget(
//                                     hintText: 'Email',
//                                     onChanged: (str) {
//                                       addcompanyCubit.onModlChages(email: str);
//                                     },
//                                     validator: (str) {
//                                       return str!.isEmpty
//                                           ? 'Email is empty'
//                                           : null;
//                                     },
//                                   ),
//                                   TextFialdWidget(
//                                     hintText: 'Phone',
//                                     onChanged: (str) {
//                                       addcompanyCubit.onModlChages(phone: str);
//                                     },
//                                     validator: (str) {
//                                       return str!.isEmpty
//                                           ? 'Phone is empty'
//                                           : null;
//                                     },
//                                   ),
//                                   TextFialdWidget(
//                                     hintText: 'Ogrn',
//                                     onChanged: (str) {
//                                       addcompanyCubit.onModlChages(ogrn: str);
//                                     },
//                                     validator: (str) {
//                                       return str!.isEmpty
//                                           ? 'Ogrn is empty'
//                                           : null;
//                                     },
//                                   ),
//                                   TextFialdWidget(
//                                     hintText: 'Okpo',
//                                     onChanged: (str) {
//                                       addcompanyCubit.onModlChages(okpo: str);
//                                     },
//                                     validator: (str) {
//                                       return str!.isEmpty
//                                           ? 'Okpo is empty'
//                                           : null;
//                                     },
//                                   ),
//                                   TextFialdWidget(
//                                     hintText: 'Trn',
//                                     onChanged: (str) {
//                                       addcompanyCubit.onModlChages(trn: str);
//                                     },
//                                     validator: (str) {
//                                       return str!.isEmpty
//                                           ? 'Trn is empty'
//                                           : null;
//                                     },
//                                   ),
//                                   TextFialdWidget(
//                                     hintText: 'Rrc',
//                                     onChanged: (str) {
//                                       addcompanyCubit.onModlChages(rrc: str);
//                                     },
//                                     validator: (str) {
//                                       return str!.isEmpty
//                                           ? 'Rrc is empty'
//                                           : null;
//                                     },
//                                   ),
//                                   TextFialdWidget(
//                                     hintText: 'UserName',
//                                     onChanged: (str) {
//                                       addcompanyCubit.onModlChages(
//                                           userName: str);
//                                     },
//                                     validator: (str) {
//                                       return str!.isEmpty
//                                           ? 'UserName is empty'
//                                           : null;
//                                     },
//                                   ),
//                                   TextFialdWidget(
//                                     hintText: 'GivenName',
//                                     onChanged: (str) {
//                                       addcompanyCubit.onModlChages(
//                                           givenName: str);
//                                     },
//                                     validator: (str) {
//                                       return str!.isEmpty
//                                           ? 'GivenName is empty'
//                                           : null;
//                                     },
//                                   ),
//                                 ],
//                               ),
//                             ),
//                             Expanded(
//                               child: Column(
//                                 children: [
//                                   TextFialdWidget(
//                                     hintText: 'Surname',
//                                     onChanged: (str) {
//                                       addcompanyCubit.onModlChages(
//                                           surname: str);
//                                     },
//                                     validator: (str) {
//                                       return str!.isEmpty
//                                           ? 'Surname is empty'
//                                           : null;
//                                     },
//                                   ),
//                                   TextFialdWidget(
//                                     hintText: 'Password',
//                                     onChanged: (str) {
//                                       addcompanyCubit.onModlChages(
//                                           password: str);
//                                     },
//                                     validator: (str) {
//                                       return str!.isEmpty
//                                           ? 'Password is empty'
//                                           : null;
//                                     },
//                                   ),
//                                   TextFialdWidget(
//                                     hintText: 'ConfirmPassword',
//                                     onChanged: (str) {
//                                       addcompanyCubit.onModlChages(
//                                           confirmPassword: str);
//                                     },
//                                     validator: (str) {
//                                       return str!.isEmpty
//                                           ? 'ConfirmPassword is empty'
//                                           : null;
//                                     },
//                                   ),
//                                   TextFialdWidget(
//                                     hintText: 'BusinessLicenseUrl',
//                                     onChanged: (str) {
//                                       addcompanyCubit.onModlChages(
//                                           businessLicenseUrl: str);
//                                     },
//                                     validator: (str) {
//                                       return str!.isEmpty
//                                           ? 'BusinessLicenseUrl is empty'
//                                           : null;
//                                     },
//                                   ),
//                                   TextFialdWidget(
//                                     hintText: 'LegalRepresentativeName',
//                                     onChanged: (str) {
//                                       addcompanyCubit.onModlChages(
//                                           legalRepresentativeName: str);
//                                     },
//                                     validator: (str) {
//                                       return str!.isEmpty
//                                           ? 'LegalRepresentativeName is empty'
//                                           : null;
//                                     },
//                                   ),
//                                   TextFialdWidget(
//                                     hintText: 'LegalRepresentativeId',
//                                     onChanged: (str) {
//                                       addcompanyCubit.onModlChages(
//                                           legalRepresentativeId: str);
//                                     },
//                                     validator: (str) {
//                                       return str!.isEmpty
//                                           ? 'LegalRepresentativeId is empty'
//                                           : null;
//                                     },
//                                   ),
//                                   TextFialdWidget(
//                                     hintText: 'Info',
//                                     onChanged: (str) {
//                                       addcompanyCubit.onModlChages(info: str);
//                                     },
//                                     validator: (str) {
//                                       return str!.isEmpty
//                                           ? 'Info is empty'
//                                           : null;
//                                     },
//                                   ),
//                                   TextFialdWidget(
//                                     hintText: 'LogoUrl',
//                                     onChanged: (str) {
//                                       addcompanyCubit.onModlChages(
//                                           logoUrl: str);
//                                     },
//                                     validator: (str) {
//                                       return str!.isEmpty
//                                           ? 'LogoUrl is empty'
//                                           : null;
//                                     },
//                                   ),
//                                   TextFialdWidget(
//                                     hintText: 'Tin',
//                                     onChanged: (str) {
//                                       addcompanyCubit.onModlChages(tin: str);
//                                     },
//                                     validator: (str) {
//                                       return str!.isEmpty
//                                           ? 'Tin is empty'
//                                           : null;
//                                     },
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//                 Expanded(
//                     flex: 4,
//                     child: Column(
//                       children: const [Textbuilder()],
//                     ))
//               ],
//             ),
//           );
//         },
//       ),
//     );
//   }
// }

// class Textbuilder extends StatelessWidget {
//   const Textbuilder({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     var tr = context.read<AddcompanyCubit>();
//     return ValueListenableBuilder<CompanyAddUpdateModel>(
//       valueListenable: tr.c,
//       builder: (BuildContext context, value, Widget? child) {
//         return Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             text('CompanyGuid ', value.companyGuid.toString()),
//             text('UserGuid ', value.userGuid.toString()),
//             text('CompanyName ', value.companyName.toString()),
//             text('Bin ', value.bin.toString()),
//             text('Email ', value.email.toString()),
//             text('Phone ', value.phone.toString()),
//             text('UserName ', value.userName.toString()),
//             text('GivenName ', value.givenName.toString()),
//             text('Surname ', value.surname.toString()),
//             text('Password ', value.password.toString()),
//             text('ConfirmPassword ', value.confirmPassword.toString()),
//             text('businessLicenseUrl ', value.businessLicenseUrl.toString()),
//             text('legalRepresentativeName ',
//                 value.legalRepresentativeName.toString()),
//             text('legalRepresentativeId ',
//                 value.legalRepresentativeId.toString()),
//             text('info', value.info.toString()),
//             text('logoUrl ', value.logoUrl.toString()),
//             text('tin ', value.tin.toString()),
//             text('ogrn ', value.ogrn.toString()),
//             text('okpo ', value.okpo.toString()),
//             text('trn ', value.trn.toString()),
//             text('rrc ', value.rrc.toString()),
//             BlocBuilder<AddcompanyCubit, AddcompanyState>(
//               builder: (context, state) {
//                 if (state.loading) {
//                   return const LoadingWidget();
//                 } else {
//                   return Btn(
//                     onPressed: () {
//                       tr.createCompany();
//                     },
//                     child: Container(
//                       margin: const EdgeInsets.only(top: 20),
//                       padding: const EdgeInsets.symmetric(
//                           horizontal: 8, vertical: 10),
//                       decoration: BoxDecoration(
//                         color: Colors.amber,
//                         borderRadius: BorderRadius.circular(4),
//                       ),
//                       child: const Text('save'),
//                     ),
//                   );
//                 }
//               },
//             ),
//           ],
//         );
//       },
//     );
//   }

//   Widget text(String title, String str) {
//     return Row(
//       children: [
//         Text(title,
//             style: const TextStyle(fontSize: 24, color: Colors.greenAccent)),
//         const Spacer(),
//         Text(
//           str,
//           style: const TextStyle(fontSize: 20, color: Colors.green),
//         )
//       ],
//     );
//   }
// }
