// import 'package:admin/admin/futures/home/cubit/home_cubit.dart';
// import 'package:dropdown_button2/dropdown_button2.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:global/global/data/provider/auth_provider.dart';
// import 'package:utils/utils/sp.dart';

// class AdminDashboardScreen extends StatelessWidget {
//    AdminDashboardScreen({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final SecureStorage secureStorage = SecureStorage();

//     return BlocProvider(
//         lazy: true,
//         create: (context) => HomeCubit(),
//         child: Scaffold(
//             appBar: AppBar(
//               actions: [
//                 Center(
//                   child: DropdownButtonHideUnderline(
//                     child: DropdownButton2(
//                       dropdownWidth: 150,
//                       customButton:  Icon(
//                         Icons.list,
//                         size: 46,
//                         color: Colors.teal,
//                       ),
//                       customItemsIndexes:  [3],
//                       customItemsHeight: 8,
//                       items: [
//                         ...MenuItems.firstItems.map(
//                           (item) => DropdownMenuItem<MenuItem>(
//                             value: item,
//                             child: MenuItems.buildItem(item),
//                           ),
//                         ),
//                          DropdownMenuItem<Divider>(
//                             enabled: false, child: Divider()),
//                         ...MenuItems.secondItems.map(
//                           (item) => DropdownMenuItem<MenuItem>(
//                             value: item,
//                             child: MenuItems.buildItem(item),
//                           ),
//                         ),
//                       ],
//                       onChanged: (value) {
//                         MenuItems.onChanged(context, value as MenuItem);
//                       },
//                       itemHeight: 48,
//                       // itemWidth: 160,
//                       itemPadding:  EdgeInsets.only(left: 16, right: 16),
//                       dropdownPadding:  EdgeInsets.symmetric(vertical: 6),

//                       offset:  Offset(0, 8),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             body: Column(
//               children: [
//                 Center(
//                     child: FutureBuilder(
//                   future: secureStorage.readSecureData('a_at'),
//                   builder: (context, snapshot) => SelectableText(
//                     snapshot.data.toString(),
//                     textAlign: TextAlign.center,
//                   ),
//                 )),
//                 // Text(value.baseAdminModel!.toJson().toString())
//               ],
//             )));

//     // ChangeNotifierProvider(
//     //     lazy: true,
//     //     create: (context) => AdminProvider(),
//     //     child: Consumer<AdminProvider>(
//     //       builder: (context, value, child) =>

//     // ));
//   }
// }

// class MenuItem {
//   final String text;
//   final IconData icon;

//    MenuItem({
//     required this.text,
//     required this.icon,
//   });
// }

// class MenuItems {
//   static  List<MenuItem> firstItems = [home, share, settings];
//   static  List<MenuItem> secondItems = [logout];

//   static  home = MenuItem(text: 'Home', icon: Icons.home);
//   static  share = MenuItem(text: 'Share', icon: Icons.share);
//   static  settings = MenuItem(text: 'Settings', icon: Icons.settings);
//   static  logout = MenuItem(text: 'Log Out', icon: Icons.logout);

//   static Widget buildItem(MenuItem item) {
//     return Row(
//       children: [
//         Icon(item.icon, size: 22, color: Colors.black),
//          SizedBox(
//           width: 10,
//         ),
//         Text(
//           item.text,
//           style:  TextStyle(),
//         ),
//       ],
//     );
//   }

//   static onChanged(BuildContext context, MenuItem item) {
//     switch (item) {
//       case MenuItems.home:
//         //Do something
//         break;
//       case MenuItems.settings:
//         //Do something
//         break;
//       case MenuItems.share:
//         //Do something
//         break;
//       case MenuItems.logout:
//         //Do something
//         break;
//     }
//   }
// }
