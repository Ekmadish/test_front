export 'futures/admin_profile/admin_profile.dart';
export 'futures/auth/login/view/login_screen.dart';
export 'package:tasu/admin/futures//home/admin_dashboard.dart';
export 'futures/user_list/view/user_list_screen.dart';
export 'futures/statistics/statistics_screen.dart';
export 'futures/profile/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tasu/admin/view/widget/adaptive_scafold_widget.dart';
import 'package:tasu/admin/view/widget/widgets.dart';
import 'package:tasu/global/data/app_state.dart';
import 'package:tasu/main.dart';
import 'futures/futures.dart';

late AdaptiveNavigationScaffold adaptiveNavigationScaffold;
const List<AdaptiveScaffoldDestination> drawList = [
  AdaptiveScaffoldDestination(
    title: 'l_Company',
    routeName: 'admincompany',
    icon: Icons.apartment,
  ),
  AdaptiveScaffoldDestination(
    title: 'l_AdminList',
    routeName: 'adminlist',
    icon: Icons.admin_panel_settings,
  ),
  AdaptiveScaffoldDestination(
    title: 'l_UserList',
    routeName: 'adminuser',
    icon: Icons.supervisor_account,
  ),
  AdaptiveScaffoldDestination(
    title: 'l_Statistics',
    routeName: 'adminstatistics',
    icon: Icons.data_exploration,
  ),
  AdaptiveScaffoldDestination(
    title: 'l_Profile',
    routeName: 'adminprofile',
    icon: Icons.contact_page,
  ),
  // AdaptiveScaffoldDestination(
  //   title: 'l_About',
  //   routeName: '',
  //   icon: Icons.info,
  // ),
];

final List<String> _items = [
  'companylist',
  'adminlist',
  'userlist',
  'statistics',
  'profile',
];

class AdminScreen extends StatelessWidget {
  final String index;
  final Widget? body;
  const AdminScreen({
    Key? key,
    required this.index,
    this.body,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // var mainState =   getIt<MainState>() .
    // MainState mainState = MainState();
    adaptiveNavigationScaffold = AdaptiveNavigationScaffold(
      selectedIndex: _items.indexWhere((e) => e == index),
      drawerHeader: BlocProvider.value(
        value: mainState.adminCubit,
        child: HeaderWidget(),
      ),
      body: body ?? _body(),
      destinations: drawList,
      onDestinationSelected: (i) {
        switch (i) {
          case 0:
            context.go('/admin/companylist');
            break;
          case 1:
            context.go('/admin/adminlist');
            break;
          case 2:
            context.go('/admin/userlist');
            break;
          case 3:
            context.go('/admin/statistics');
            break;
          default:
            context.go('/admin/profile');
        }
      },
    );
    return adaptiveNavigationScaffold;
  }

  Widget _body() {
    switch (index) {
      case 'companylist':
        return CompanyScreenNew();
        break;
      case 'adminlist':
        return AdminScreenList();
        break;
      case 'userlist':
        return UserLisScreentNew();
        break;
      case 'statistics':
        return BlocProvider(
          lazy: true,
          create: (context) => StatisticsCubit(),
          child: const StatisticsScreen(),
        );
        break;

      default:
        return const ProfileScreen();
    }
    // return AdminScreenList();
    // var singleWhere = _items.singleWhere((element) => element.path == index);
    // return singleWhere.child;
  }
}

class Item {
  final String path;
  final Widget child;
  const Item({required this.path, required this.child});
}
