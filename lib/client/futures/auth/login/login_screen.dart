//  ;

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasu/client/futures/auth/cubit/login_cubit.dart';
import 'package:tasu/global/widgets/widgets.dart';

class ClientLoginScreen extends StatelessWidget {
  const ClientLoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        lazy: true,
        create: (context) => LoginCubit(),
        child: Scaffold(
          backgroundColor: Colors.black87, //const Color(0xff202223),
          appBar: AppBar(
            backgroundColor: const Color(0xff1e2326),
            toolbarHeight: 40,
            elevation: 0,
            actions: const [LanDropdwonButton()],
          ),

          body: BlocBuilder<LoginCubit, LoginState>(
            buildWhen: (previous, current) => false,
            builder: (context, state) {
              var cubit = context.read<LoginCubit>();
              return Stack(
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: IntrinsicWidth(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 60,
                          ),
                          SizedBox(
                              height: 150,
                              child: Image.asset(
                                'assets/images/logo.png',
                                filterQuality: FilterQuality.high,
                              )),
                          title('l_UserName'),
                          Form(
                            key: cubit.loginformKey,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                StandartTextField(
                                  isRequired: false,
                                  mustValidate: true,
                                  title: 'l_Email',
                                  textInputAction: TextInputAction.next,
                                  style: const TextStyle(color: Colors.white),
                                  onChanged: (s) {
                                    cubit.onChangeInfo(loginName: s);
                                  },
                                ),
                                title('l_Password'),
                                PasswordTextField(
                                  title: 'l_Password',
                                  style: const TextStyle(color: Colors.white),
                                  textInputAction: TextInputAction.done,
                                  onChanged: (s) {
                                    cubit.onChangeInfo(password: s);
                                  },
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.symmetric(vertical: 8),
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(2),
                              color: const Color(0xff72d05f),
                            ),
                            height: 33,
                            child: BlocBuilder<LoginCubit, LoginState>(
                              builder: (context, state) {
                                if (state.loading) {
                                  return const LoadingWidget();
                                } else {
                                  return TextButton(
                                      autofocus: true,
                                      onPressed: () {
                                        cubit.login();
                                      },
                                      child: title(
                                        'l_Login',
                                        const TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ));
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ));
  }
}

TrWidget title(String str, [TextStyle? style]) => TrWidget(
      trkey: str,
      style: style ?? const TextStyle(color: Color(0xff9d9488)),
    );
