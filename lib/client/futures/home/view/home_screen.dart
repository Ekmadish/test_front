// import 'package:flutter/material.dart';

// class NavBarWidget extends StatelessWidget {
//   const NavBarWidget({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     var size = MediaQuery.of(context).size;
//     return SizedBox(
//       width: size.width < 1200 ? 1200 : size.width,
//       child: Row(
//           children: itemsList
//               .map(
//                 (e) => Expanded(
//                   child: InkWell(
//                     onTap: () {
//                       navIndex.value = e.id;
//                     },
//                     hoverColor: e.color,
//                     child: Container(
//                       constraints: const BoxConstraints(),
//                       height: 80,
//                       decoration: BoxDecoration(
//                         color: navIndex.value == e.id
//                             ? e.color
//                             : Colors.transparent,
//                         border: Border.symmetric(
//                             vertical: BorderSide(color: Colors.grey.shade300)),
//                       ),
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                         children: [
//                           const Spacer(),
//                           Icon(
//                             e.icon,
//                             color:
//                                 navIndex.value != e.id ? e.color : Colors.white,
//                           ),
//                           const Padding(
//                               padding: EdgeInsets.symmetric(vertical: 3)),
//                           Text(e.routeName),
//                           const Spacer(),
//                           Container(
//                             decoration: BoxDecoration(color: e.color),
//                             padding: const EdgeInsets.symmetric(vertical: 2),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//               )
//               .toList()),
//     );
//   }
// }

// class FilterWidget extends StatelessWidget {
//   const FilterWidget({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: Column(
//         children: [
//           Row(
//             children: [
//               const Text('Show filter'),
//               Wrap(
//                 children: const [],
//               )
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }

// class EditWidget extends StatelessWidget {
//   const EditWidget({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       color: Colors.teal,
//       child: ValueListenableBuilder<int>(
//         valueListenable: navIndex,
//         builder: (context, index, child) => Wrap(
//           children: editMenu
//               .where((element) => element.id == index)
//               .map((e) => Container(
//                   margin: const EdgeInsets.all(8),
//                   decoration: const BoxDecoration(
//                     color: Colors.teal,
//                   ),
//                   child: Wrap(
//                     children: e.child
//                         .map((e) => ValueListenableBuilder<int>(
//                               valueListenable: editMenuChild,
//                               builder: (context, childindex, child) => InkWell(
//                                 onTap: () {
//                                   editMenuChild.value = e.index;
//                                 },
//                                 child: Container(
//                                     margin: const EdgeInsets.symmetric(
//                                         horizontal: 8),
//                                     decoration: e.index == childindex
//                                         ? BoxDecoration(
//                                             borderRadius:
//                                                 BorderRadius.circular(4),
//                                             border: Border.all(
//                                                 color: Colors.black, width: 2))
//                                         : null,
//                                     padding: const EdgeInsets.all(3),
//                                     child: Text(e.name)),
//                               ),
//                             ))
//                         .toList(),
//                   )))
//               .toList(),
//         ),
//       ),
//     );
//   }
// }

// ValueNotifier<int> editMenuChild = ValueNotifier(1);

// List<EditMenu> editMenu = [
//   EditMenu(id: 1, info: '', name: 'Request', child: [
//     EditMenuChild(index: 1, info: 'Active requests', name: 'Active requests'),
//     EditMenuChild(index: 2, info: 'Archive requests', name: 'Archive requests'),
//   ]),
//   EditMenu(id: 2, info: '', name: 'Orders', child: [
//     EditMenuChild(index: 1, info: '', name: 'Orders'),
//     EditMenuChild(index: 2, info: '', name: 'Consolidation'),
//     EditMenuChild(index: 3, info: '', name: 'Cargos'),
//     EditMenuChild(index: 4, info: '', name: 'Trips'),
//     EditMenuChild(index: 5, info: '', name: ' Cargos status'),
//     EditMenuChild(index: 6, info: '', name: 'Salary calculation'),
//   ]),
//   EditMenu(id: 3, info: '', name: 'Finance', child: [
//     EditMenuChild(index: 1, info: '', name: 'Issued invoices'),
//     EditMenuChild(index: 2, info: '', name: 'Received invoices'),
//     EditMenuChild(index: 3, info: '', name: 'Acts'),
//     EditMenuChild(index: 4, info: '', name: 'Payments'),
//     EditMenuChild(index: 5, info: '', name: 'Payments made'),
//   ]),
//   EditMenu(id: 4, info: '', name: 'Clients', child: [
//     EditMenuChild(index: 1, info: '', name: 'Clients'),
//     EditMenuChild(index: 2, info: '', name: 'Access for clients'),
//   ]),
//   EditMenu(id: 5, info: '', name: 'Carriers', child: [
//     EditMenuChild(index: 1, info: '', name: 'Carriers'),
//     EditMenuChild(index: 2, info: '', name: 'Vehicle'),
//     EditMenuChild(index: 3, info: '', name: 'Drivers'),
//   ]),
//   EditMenu(id: 6, info: '', name: 'Reports', child: []),
//   EditMenu(id: 7, info: '', name: 'Documents', child: []),
//   EditMenu(id: 8, info: '', name: 'Calendar', child: []),
//   EditMenu(id: 9, info: '', name: 'Task', child: []),
//   EditMenu(id: 10, info: '', name: 'Settings', child: []),
// ];

// class EditMenu {
//   final String name;
//   final int id;
//   final String info;
//   final List<EditMenuChild> child;

//   EditMenu(
//       {required this.name,
//       required this.id,
//       required this.info,
//       required this.child});
// }

// class EditMenuChild {
//   final String name;
//   final String info;
//   final int index;

//   EditMenuChild({required this.name, required this.info, required this.index});
// }

// ValueNotifier<int> navIndex = ValueNotifier(1);

// List<Menu> itemsList = [
//   Menu(
//     icon: Icons.question_answer,
//     id: 1,
//     routeName: 'Request',
//     color: const Color(0xffD9ED92),
//   ),
//   Menu(
//     icon: Icons.description,
//     id: 2,
//     routeName: 'Orders',
//     color: const Color(0xffB5E48C),
//   ),
//   Menu(
//     icon: Icons.account_balance_wallet,
//     id: 3,
//     routeName: 'Finance',
//     color: const Color(0xff76C893),
//   ),
//   Menu(
//     icon: Icons.account_box,
//     id: 4,
//     routeName: 'Clients',
//     color: const Color(0xff52B69A),
//   ),
//   Menu(
//     icon: Icons.local_shipping,
//     id: 5,
//     routeName: 'Carries',
//     color: const Color(0xff34A0A4),
//   ),
//   Menu(
//     icon: Icons.summarize,
//     id: 6,
//     routeName: 'Reports',
//     color: const Color(0xff168AAD),
//   ),
//   Menu(
//     icon: Icons.receipt_long,
//     id: 7,
//     routeName: 'Documents',
//     color: const Color(0xff1A759F),
//   ),
//   Menu(
//     icon: Icons.calendar_month,
//     id: 8,
//     routeName: 'Calendar',
//     color: const Color(0xff1E6091),
//   ),
//   Menu(
//     icon: Icons.task,
//     id: 9,
//     routeName: 'Task',
//     color: const Color(0xff184E77),
//   ),
//   Menu(
//     icon: Icons.settings,
//     id: 10,
//     routeName: 'Settings',
//     color: const Color(0xffD9ED92),
//   ),
// ];

// class Menu {
//   final String routeName;
//   final IconData icon;
//   final int id;
//   final Color color;

//   Menu({
//     required this.icon,
//     required this.id,
//     required this.routeName,
//     required this.color,
//   });
// }
