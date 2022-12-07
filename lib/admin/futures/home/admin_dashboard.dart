import 'package:flutter/material.dart';
import 'package:tasu/global/data/db.dart';
import 'package:tasu/main.dart';

class AdminDashboardScreen extends StatelessWidget {
  const AdminDashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            // Center(
            //   child: DropdownButtonHideUnderline(
            //     child: DropdownButton2(
            //       dropdownWidth: 150,
            //       customButton: const Icon(
            //         Icons.list,
            //         size: 46,
            //         color: Colors.teal,
            //       ),
            //       customItemsIndexes: const [3],
            //       customItemsHeight: 8,
            //       items: [
            //         ...MenuItems.firstItems.map(
            //           (item) => DropdownMenuItem<MenuItem>(
            //             value: item,
            //             child: MenuItems.buildItem(item),
            //           ),
            //         ),
            //         const DropdownMenuItem<Divider>(
            //             enabled: false, child: Divider()),
            //         ...MenuItems.secondItems.map(
            //           (item) => DropdownMenuItem<MenuItem>(
            //             value: item,
            //             child: MenuItems.buildItem(item),
            //           ),
            //         ),
            //       ],
            //       onChanged: (value) {
            //         MenuItems.onChanged(context, value as MenuItem);
            //       },
            //       itemHeight: 48,
            //       // itemWidth: 160,
            //       itemPadding: const EdgeInsets.only(left: 16, right: 16),
            //       dropdownPadding: const EdgeInsets.symmetric(vertical: 6),
            //       offset: const Offset(0, 8),
            //     ),
            //   ),
            // ),
          ],
        ),
        body: Column(
          children: [
            Center(
                child: FutureBuilder(
              future: storage.read('a_at'),
              builder: (context, snapshot) => SelectableText(
                snapshot.data.toString(),
                textAlign: TextAlign.center,
              ),
            )),
            // Text(value.baseAdminModel!.toJson().toString())
          ],
        ));

    // ChangeNotifierProvider(
    //     lazy: true,
    //     create: (context) => AdminProvider(),
    //     child: Consumer<AdminProvider>(
    //       builder: (context, value, child) =>

    // ));
  }
}

class MenuItem {
  final String text;
  final IconData icon;

  const MenuItem({
    required this.text,
    required this.icon,
  });
}

class MenuItems {
  static const List<MenuItem> firstItems = [home, share, settings];
  static const List<MenuItem> secondItems = [logout];

  static const home = MenuItem(text: 'Home', icon: Icons.home);
  static const share = MenuItem(text: 'Share', icon: Icons.share);
  static const settings = MenuItem(text: 'Settings', icon: Icons.settings);
  static const logout = MenuItem(text: 'Log Out', icon: Icons.logout);

  static Widget buildItem(MenuItem item) {
    return Row(
      children: [
        Icon(item.icon, size: 22, color: Colors.black),
        const SizedBox(
          width: 10,
        ),
        Text(
          item.text,
          style: const TextStyle(),
        ),
      ],
    );
  }

  static onChanged(BuildContext context, MenuItem item) {
    switch (item) {
      case MenuItems.home:
        //Do something
        break;
      case MenuItems.settings:
        //Do something
        break;
      case MenuItems.share:
        //Do something
        break;
      case MenuItems.logout:
        //Do something
        break;
    }
  }
}
