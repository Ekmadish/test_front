import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasu/admin/futures/home/cubit/admin_cubit.dart'; 
import 'package:tasu/global/widgets/widgets.dart';

class HeaderWidget extends StatelessWidget {
  // ignore: prefer_const_constructors_in_immutables
  HeaderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var adminCubit = context.read<AdminCubit>();
    adminCubit.getAdminInfo();

    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 20,
      ),
      alignment: Alignment.center,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          BlocBuilder<AdminCubit, AdminState>(
            builder: (context, state) {
              if (state.loading) {
                return const LoadingWidget();
              } else if (state.error) {
                return const ErrorsWidget();
              } else {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                        margin: const EdgeInsets.only(bottom: 4),
                        padding: const EdgeInsets.all(16),
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle, color: Color(0xffcccccc)),
                        child: Builder(builder: (context) {
                          return const Icon(
                            Icons.person,
                            color: Colors.white,
                            size: 32,
                          );
                        })),
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Text(
                        state.adminModel!.givenName.toString(),
                        style: const TextStyle(fontSize: 18),
                      ),
                    ),
                    Text(
                      state.adminModel!.email.toString(),
                      textAlign: TextAlign.center,
                      maxLines: 1,
                      style: const TextStyle(fontSize: 16),
                    ),
                  ],
                );
              }
            },
          ),
          
          const LanDropdwonButton()
        ],
      ),
    );
  }
}
