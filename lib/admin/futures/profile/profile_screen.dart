
import 'package:flutter/material.dart';
import 'package:tasu/admin/data/services/admin_repository.dart';
import 'package:tasu/admin/futures/admin_list/model/admin_model.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<AdminModel>(
        future: AdminRepository().currentAdmin(),
        initialData: null,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const SizedBox();
          } else if (snapshot.hasData) {
            return Center(
              child: Card(
                child: Container(
                  height: MediaQuery.of(context).size.height * .2,
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    // mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const CircleAvatar(
                        child: Icon(Icons.person),
                      ),
                      Text(snapshot.data!.name!),
                      Text(snapshot.data!.email!),
                      Text(snapshot.data!.phone!)
                    ],
                  ),
                ),
              ),
            );
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}
