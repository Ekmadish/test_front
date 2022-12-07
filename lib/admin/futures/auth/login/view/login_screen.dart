import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tasu/admin/futures/auth/login/cubit/login_cubit.dart';
import 'package:tasu/global/config/constant/app_constant.dart';
import 'package:tasu/global/widgets/textfileds_widget.dart';
import 'package:tasu/global/widgets/widgets.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        lazy: true,
        create: (context) => LoginCubit(),
        child: BlocBuilder<LoginCubit, LoginState>(
          buildWhen: (previous, current) => false,
          builder: (context, state) {
            var authCubit = context.read<LoginCubit>();
            return Scaffold(
              body: Center(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5),
                    boxShadow: const [
                      BoxShadow(
                        color: Color.fromRGBO(0, 0, 0, 0.25),
                        offset: Offset(0, 0),
                        blurRadius: 5,
                      ),
                    ],
                  ),
                  width: MediaQuery.of(context).size.width * 0.35,
                  // height: MediaQuery.of(context).size.height * 0.6,
                  alignment: Alignment.center,
                  child: Form(
                    key: authCubit.loginformKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text(
                          "Welcome Back",
                          style: TextStyle(
                            fontSize: 48,
                            fontWeight: FontWeight.w700,
                            color: Color.fromRGBO(21, 34, 72, 1),
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: StandartTextField(
                            isRequired: false,
                            title: "l_Email",
                            prefixIcon: const Icon(Icons.email),
                            hintText: "Email",
                            keyboardType: TextInputType.emailAddress,
                            // width: MediaQuery.of(context).size.width * 0.28,
                            // height: 50,
                            onChanged: (str) {
                              if (str.isNotEmpty) {
                                authCubit.loginName = str;
                              }
                            },

                            // validator: (str) {
                            //   return str!.isEmpty ? ' ' : null;
                            // },
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: PasswordTextField(
                            prefixIcon: const Icon(Icons.password),
                            hintText: "Password",
                            keyboardType: TextInputType.visiblePassword,
                            // width: MediaQuery.of(context).size.width * 0.28,
                            // height: 50,
                            onChanged: (str) {
                              if (str.isNotEmpty) {
                                authCubit.password = str;
                              }
                            },
                            // validator: (str) {
                            //   return str!.isEmpty ? ' ' : null;
                            // },
                            title: 'l_Password',
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          width: 400,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Spacer(),
                              Text(
                                "Forgot password?",
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        BlocConsumer<LoginCubit, LoginState>(
                          listener: (context, state) {
                            if (state.authorized) {
                              // authProvider
                              //     .setAuthState(AuuthStateEnum.authorized);
                              context.go('/admin');
                            }
                          },
                          buildWhen: (previous, current) => previous != current,
                          builder: (context, state) {
                            if (state.loading) {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            } else {
                              return Btn(
                                child: Container(
                                  color: Colors.cyan,
                                  child: const Text("Log in"),
                                ),
                                onPressed: () {
                                  authCubit.login();
                                },
                              );
                            }
                          },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        RichText(
                          text: TextSpan(
                            text: "Don't have an account yet?",
                            children: [
                              TextSpan(
                                text: " Sign Up",
                                style: TextStyle(
                                  color: primaryBtnColor,
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
