import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tasu/admin/admin.dart';
import 'package:tasu/client/client.dart';
import 'package:tasu/global/data/app_state.dart';
import 'package:tasu/global/data/auth.dart';
import 'package:tasu/global/widgets/error_view_widget.dart';
import 'package:tasu/main.dart';

// const ValueKey<String> _scaffoldKey = ValueKey<String>('App scaffold');

class AppRoute {
  final TasuAuth tasuAuth;

  AppRoute({
    required this.tasuAuth,
  });

  final StringBuffer _initRoute = StringBuffer();

  bool _isAdmin = false;
  late GoRouter routes = GoRouter(
    // initialLocation: '/admin/companylist',
    urlPathStrategy: UrlPathStrategy.path,
    refreshListenable: tasuAuth, //mainState.auth,
    redirect: (state) {
      _initRoute.write(state.location);
      _isAdmin = 'admin' == _initRoute.toString().split('/')[1].toString();
      if (_isAdmin) {
        final loggedIn =
            tasuAuth.authState.authorized; //mainState.auth.value.authorized;
        final loggingIn = state.subloc == '/login';
        if (!loggedIn) return loggingIn ? null : '/login';
        if (loggingIn) return '/admin';
        return null;
      } else {
        final loggedIn =
            tasuAuth.authState.authorized; //mainState.auth.value.authorized;
        final loggingIn = state.subloc == '/login';
        if (!loggedIn) return loggingIn ? null : '/login';
        if (loggingIn) return '/';
        return null;
      }
    },
    errorBuilder: (context, state) => ErrorView(state.error!),

    routes: [
      GoRoute(
        path: '/login',
        name: 'login',
        builder: (context, state) {
          if (_isAdmin) {
            return const LoginScreen();
          } else {
            return const ClientLoginScreen();
          }
        },
      ),
      GoRoute(
        path:
            '/admin/:index(companylist|userlist|adminlist|statistics|profile)',
        builder: (context, state) {
          return AdminScreen(
            key: state.pageKey,
            index: state.params['index'] ?? 0.toString(),
            body: null,
          );
        },
        routes: [
          GoRoute(
              path: 'addupdata',
              name: 'addupdata',
              builder: (context, state) => AdminScreen(
                  key: state.pageKey,
                  index: state.params['index'] ?? 0.toString(),
                  body: const Demo())),
        ],
      ),
      GoRoute(
        name: 'admin',
        path: '/admin',
        redirect: (state) {
          return '/admin/adminlist';
        },
      ),
      GoRoute(
        path: '/',
        redirect: (_) => '/tasu',
      ),
      GoRoute(
        path: '/tasu',
        redirect: (_) => '/tasu/orders',
      ),
      GoRoute(
        path:
            '/tasu/:id(request|orders|finance|clients|carries|reports|documents|calendar|task|settings)',
        builder: (context, state) => MainScreen(
          kind: state.params['id']!,
          key: state.pageKey,
          tab: (state.extra ?? 'organization').toString(),
        ),
        routes: [
          GoRoute(
            path:
                'tab/:tab(organization|templates|classifiers|system|payment|log)',
            name: 'tab',
            builder: (context, state) {
              return MainScreen(
                kind: state.params['id']!,
                key: state.pageKey,
                tab: state.params['tab']!,
              );
            },
          ),
        ],
      ),
    ],
  );

//   String? _guard(GoRouterState state) {
//     _initRoute.write(state.location);
//     _isAdmin = 'admin' == _initRoute.toString().split('/')[1].toString();
//     final bool signedIn = tasuAuth.authState.authorized;
//     final bool signingIn = state.subloc == '/login';
//     if (!signedIn && !signingIn) {
//       return '/login';
//     } else if (signedIn && signingIn) {
//       return '/admin';
//     }
//     return null;
//   }

  void dipose() {
    routes.dispose();
  }
}

class Demo extends StatelessWidget {
  const Demo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            GoRouter.of(context).pop();
          },
          icon: Icon(Icons.close),
        ),
      ),
    );
  }
}
