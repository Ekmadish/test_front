// import 'package:flutter/material.dart';
// import 'package:global/global/config/router/route_state.dart';
// import 'package:global/global/data/provider/auth_provider.dart';
// import 'package:global/global/widgets/widgets.dart';
// import 'package:go_router/go_router.dart';

// class AppRoute {
//   final AuthProvider authProvider;

//   // final TranscompanyCubit transcompanyCubit;
//   AppRoute({
//     required this.authProvider,
//     // required this.transcompanyCubit,
//   });
//   // AppRoute._();
//   // static final AppRoute _appRoute = AppRoute._();
//   // factory AppRoute() => _appRoute;

//   late final GoRouter routes = GoRouter(
//       redirect: (state) {
//         // final loggedIn = authProvider.authState;
//         final loggingIn = state.subloc == '/login';
//         if (!authProvider.authState) return loggingIn ? null : '/login';
//         if (loggingIn) return '/admin';
//         return null;
//       },
//       refreshListenable: authProvider,
//       // debugLogDiagnostics: true,
//       errorBuilder: (context, state) => ErrorView(state.error!),
//       navigatorBuilder: (contex, state, child) => Navigator(
//             // key:  ValueKey('nav'),
//             onPopPage: (route, result) {
//               route.didPop(result);
//               return false;
//             },
//             pages: [
//               MaterialPage(
//                   key: ValueKey('material'),
//                   child: state.error != null
//                       ? ErrorScaffold(body: child)
//                       : authProvider.authState
//                           ? ShareScafoldWidget(
//                               key: state.pageKey,
//                               routerState: RouterState(),
//                               body: child)
//                           : child)
//             ],
//           ),
//       routes: [
//         GoRoute(
//           path: '/login',
//           builder: (context, state) => LoginScreen(),
//           // pageBuilder: (context, state) {
//           //   return  MaterialPage(child: LoginScreen());
//           // },
//           // builder: (context, state) =>  LoginScreen(),
//         ),
//         GoRoute(
//             path: '/admin',
//             name: 'admin',
//             builder: (context, state) => AdminDashboardScreen(),
//             routes: [
//               GoRoute(
//                   name: 'company',
//                   path: 'company',
//                   builder: (context, state) => CompanyListScreen(),
//                   routes: [
//                     GoRoute(
//                       name: 'addcompany',
//                       path: 'addcompany',
//                       builder: (context, state) => AddCompanyScreen(),
//                     ),
//                   ]),
//               GoRoute(
//                 name: 'userList',
//                 path: 'userlist',
//                 builder: (context, state) => UserlistScreen(),
//               ),
//               GoRoute(
//                 name: 'statistics',
//                 path: 'statistics',
//                 builder: (context, state) => StatisticsScreen(),
//               ),
//               GoRoute(
//                 name: 'profile',
//                 path: 'profile',
//                 builder: (context, state) => ProfileScreen(),
//               ),
//               GoRoute(
//                 name: 'adminlist',
//                 path: 'list',
//                 builder: (context, state) => AdminListScreen(),
//               ),
//             ])
//       ]);

//   void dipose() {
//     routes.dispose();
//   }
// }
