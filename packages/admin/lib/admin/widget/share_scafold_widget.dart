import 'package:admin/admin/widget/adaptive_navigation_scaffold.dart';
import 'package:admin/admin/widget/header_widget.dart';
import 'package:flutter/material.dart';
import 'package:global/global/config/router/route_state.dart';
import 'package:go_router/go_router.dart';

class ItemModel {
  String title;
  IconData icon;

  ItemModel(this.title, this.icon);
}

class ShareScafoldWidget extends StatelessWidget {
  // final int selectedIndex;
  final Widget body;

  final RouterState routerState;
  const ShareScafoldWidget({Key? key, required this.body, required this.routerState})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double index = 0;
    return RepaintBoundary(
      child: NestedNavigationScaffold(
        routerState: routerState,
        index: index,
        drawerHeader: const HeaderWidget(),
        destinations: [
          DrawerItem(
              index: 0,
              title: 'Company',
              svgSrc: 'assets/icons/menu_dashbord.svg',
              routeName: 'company',
              children: [
                DrawerItemChild(
                  index: 0.1,
                  title: 'Add company',
                  svgSrc: 'assets/icons/menu_dashbord.svg',
                  routeName: 'admincompanyaddorupdate',
                ),
              ]),
          DrawerItem(
              index: 1,
              title: 'User list',
              svgSrc: 'assets/icons/menu_dashbord.svg',
              routeName: 'adminuserList',
              children: null),
          DrawerItem(
              index: 2,
              title: 'Statistics',
              svgSrc: 'assets/icons/menu_dashbord.svg',
              routeName: 'statistics',
              children: null),
          DrawerItem(
              index: 3,
              title: 'Profile',
              svgSrc: 'assets/icons/menu_dashbord.svg',
              routeName: 'profile',
              children: null),
          DrawerItem(
              index: 4,
              title: 'Admin list',
              svgSrc: 'assets/icons/menu_dashbord.svg',
              routeName: 'a',
              children: null),
          DrawerItem(
              index: 5,
              title: 'About',
              svgSrc: 'assets/icons/menu_dashbord.svg',
              routeName: '',
              children: null),
        ],
        onDestinationSelected: (routeName) async {
          if (routeName.isNotEmpty) {
            context.goNamed(routeName);
          } else {
            return showAboutDialog(
                context: context,
                applicationName: routeName,
                applicationVersion: routeName,
                applicationLegalese: 'Copyright © 2022, Acme, Corp.');
          }
        },
        body: body,
      ),
    );
  }
}
