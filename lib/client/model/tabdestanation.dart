import 'package:flutter/widgets.dart';

@immutable
class TapDestanation {
  final IconData icon;
  final String routeName;
  final String routepath;
  // final Widget Function(BuildContext context, GoRouterState state)
  //     routerWidgetBuilder;
  // final Widget Function(ValueKey<String> pageKey) child;
  final int id;
  final Color color;
  const TapDestanation(
      {required this.icon,
      required this.routeName,
      required this.routepath,
      // required this.routerWidgetBuilder,
      // required this.child,
      required this.color,
      required this.id});
}
