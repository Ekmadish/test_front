import 'package:admin/admin/futures/home/cubit/admin_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:global/global/widgets/widgets.dart';
import 'package:go_router/go_router.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AdminCubit>(
        create: (context) => AdminCubit(),
        child: Container(
          color: Colors.teal,
          height: 100,
          alignment: Alignment.center,
          child: BlocBuilder<AdminCubit, AdminState>(
            builder: (context, state) {
              if (state.loading) {
                return const LoadingWidget();
              } else {
                return Wrap(
                  // mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Padding(padding: EdgeInsets.symmetric(horizontal: 10)),
                    const Icon(Icons.person),
                    const Padding(padding: EdgeInsets.symmetric(horizontal: 10)),
                    Text(state.adminModel!.givenName.toString()),
                    Text(state.adminModel!.email.toString())
                  ],
                );
              }
            },
          ),
        ));

    Container(
      color: Colors.teal,
      height: 150,
      alignment: Alignment.center,
      child: IconButton(
          onPressed: () {
            context.goNamed('admin');
          },
          icon: const Icon(Icons.arrow_back)),
    );
  }
}
