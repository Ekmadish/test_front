// import 'package:admin/admin/futures/auth/login/cubit/login_cubit.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:global/global/config/ant/app_ant.dart';
// import 'package:global/global/widgets/cupertinbtn_widget.dart';
// import 'package:global/global/widgets/textfild_widget.dart';
// import 'package:go_router/go_router.dart';

// class LoginScreen extends StatelessWidget {
//   LoginScreen({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       lazy: true,
//       create: (context) => LoginCubit(),
//       child: BlocBuilder<LoginCubit, LoginState>(
//         buildWhen: (previous, current) => false,
//         builder: (context, state) {
//           var authCubit = context.read<LoginCubit>();
//           return Scaffold(
//             body: Center(
//               child: Container(
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.circular(5),
//                   boxShadow: [
//                     BoxShadow(
//                       color: Color.fromRGBO(0, 0, 0, 0.25),
//                       offset: Offset(0, 0),
//                       blurRadius: 5,
//                     ),
//                   ],
//                 ),
//                 width: MediaQuery.of(context).size.width * 0.35,
//                 height: MediaQuery.of(context).size.height * 0.6,
//                 alignment: Alignment.center,
//                 child: Form(
//                   key: authCubit.loginformKey,
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                       Text(
//                         "Welcome Back",
//                         style: TextStyle(
//                           fontSize: 48,
//                           fontWeight: FontWeight.w700,
//                           color: Color.fromRGBO(21, 34, 72, 1),
//                         ),
//                         textAlign: TextAlign.center,
//                       ),
//                       SizedBox(
//                         height: 30,
//                       ),
//                       TextFialdWidget(
//                         prefixIcon: Icon(Icons.email),
//                         hintText: "Email",
//                         keyboardType: TextInputType.emailAddress,
//                         width: MediaQuery.of(context).size.width * 0.28,
//                         height: 50,
//                         onChanged: (str) {
//                           if (str.isNotEmpty) {
//                             authCubit.loginName = str;
//                           }
//                         },
//                         validator: (str) {
//                           return str!.isEmpty ? ' ' : null;
//                         },
//                       ),
//                       SizedBox(
//                         height: 20,
//                       ),
//                       TextFialdWidget(
//                         prefixIcon: Icon(Icons.password),
//                         hintText: "Password",
//                         keyboardType: TextInputType.visiblePassword,
//                         width: MediaQuery.of(context).size.width * 0.28,
//                         height: 50,
//                         onChanged: (str) {
//                           if (str.isNotEmpty) {
//                             authCubit.password = str;
//                           }
//                         },
//                         validator: (str) {
//                           return str!.isEmpty ? ' ' : null;
//                         },
//                       ),
//                       SizedBox(
//                         height: 20,
//                       ),
//                       SizedBox(
//                         width: 400,
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Spacer(),
//                             Text(
//                               "Forgot password?",
//                               style: TextStyle(
//                                 fontWeight: FontWeight.w400,
//                                 fontSize: 16,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                       SizedBox(
//                         height: 20,
//                       ),
//                       BlocConsumer<LoginCubit, LoginState>(
//                         listener: (context, state) {
//                           if (state.authorized) {
//                             // authProvider
//                             //     .setAuthState(AuuthStateEnum.authorized);
//                             context.go('/admin');
//                           }
//                         },
//                         buildWhen: (previous, current) => previous != current,
//                         builder: (context, state) {
//                           if (state.loading) {
//                             return Center(
//                               child: CircularProgressIndicator(),
//                             );
//                           } else {
//                             return Btn(
//                               child: Container(
//                                 color: Colors.cyan,
//                                 child: Text("Log in"),
//                               ),
//                               onPressed: () {
//                                 authCubit.login();
//                               },
//                             );
//                           }
//                         },
//                       ),
//                       SizedBox(
//                         height: 20,
//                       ),
//                       RichText(
//                         text: TextSpan(
//                           text: "Don't have an account yet?",
//                           children: [
//                             TextSpan(
//                               text: " Sign Up",
//                               style: TextStyle(
//                                 color: primaryBtnColor,
//                               ),
//                             ),
//                           ],
//                         ),
//                       )
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
