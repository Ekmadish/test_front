import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CustomTransitionBuilder extends PageTransitionsBuilder {
  const CustomTransitionBuilder();

  @override
  Widget buildTransitions<T>(
      PageRoute<T> route,
      BuildContext context,
      Animation<double> animation,
      Animation<double> secondaryAnimation,
      Widget child) {
    return FadeTransition(opacity: animation, child: child);
  }
}

class OKTr extends PageTransitionsBuilder {
  const OKTr(this.child);

  final Widget child;

  @override
  Widget buildTransitions<T>(
    PageRoute<T>? route,
    BuildContext? context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget? child,
  ) {
    // only return the child without warping it with animations
    return SlideTransition(
      position: Tween<Offset>(
        begin: const Offset(-1, 0),
        end: Offset.zero,
      ).animate(animation),
      child: child,
    );

    child!;
  }
}

class NoTransitionsOnWeb extends PageTransitionsTheme {
  const NoTransitionsOnWeb();
  @override
  Widget buildTransitions<T>(
    route,
    context,
    animation,
    secondaryAnimation,
    child,
  ) {
    if (kIsWeb) {
      return child;
    }
    return super.buildTransitions(
      route,
      context,
      animation,
      secondaryAnimation,
      child,
    );
  }
}

enum PageTransitionType {
  fade,
  rightToLeft,
  leftToRight,
  upToDown,
  downToUp,
  scale,
  rotate,
  size,
  rightToLeftWithFade,
  leftToRightWithFade,
}

class PageTransition<T> extends PageRouteBuilder<T> {
  final Widget child;
  final PageTransitionType type;
  final Curve curve;
  final Alignment? alignment;
  final Duration duration;

  PageTransition({
    Key? key,
    required this.child,
    required this.type,
    this.curve = Curves.linear,
    this.alignment,
    this.duration = const Duration(milliseconds: 300),
  }) : super(
            pageBuilder: (BuildContext context, Animation<double> animation,
                Animation<double> secondaryAnimation) {
              return child;
            },
            transitionDuration: duration,
            transitionsBuilder: (BuildContext context,
                Animation<double> animation,
                Animation<double> secondaryAnimation,
                Widget child) {
              switch (type) {
                case PageTransitionType.fade:
                  return FadeTransition(opacity: animation, child: child);
                  break;
                case PageTransitionType.rightToLeft:
                  return SlideTransition(
                    transformHitTests: false,
                    position: Tween<Offset>(
                      begin: const Offset(1.0, 0.0),
                      end: Offset.zero,
                    ).animate(animation),
                    child: SlideTransition(
                      position: Tween<Offset>(
                        begin: Offset.zero,
                        end: const Offset(-1.0, 0.0),
                      ).animate(secondaryAnimation),
                      child: child,
                    ),
                  );
                  break;
                case PageTransitionType.leftToRight:
                  return SlideTransition(
                    transformHitTests: false,
                    position: Tween<Offset>(
                      begin: const Offset(-1.0, 0.0),
                      end: Offset.zero,
                    ).animate(animation),
                    child: SlideTransition(
                      position: Tween<Offset>(
                        begin: Offset.zero,
                        end: const Offset(1.0, 0.0),
                      ).animate(secondaryAnimation),
                      child: child,
                    ),
                  );
                  break;
                case PageTransitionType.upToDown:
                  return SlideTransition(
                    transformHitTests: false,
                    position: Tween<Offset>(
                      begin: const Offset(0.0, -1.0),
                      end: Offset.zero,
                    ).animate(animation),
                    child: SlideTransition(
                      position: Tween<Offset>(
                        begin: Offset.zero,
                        end: const Offset(0.0, 1.0),
                      ).animate(secondaryAnimation),
                      child: child,
                    ),
                  );
                  break;
                case PageTransitionType.downToUp:
                  return SlideTransition(
                    transformHitTests: false,
                    position: Tween<Offset>(
                      begin: const Offset(0.0, 1.0),
                      end: Offset.zero,
                    ).animate(animation),
                    child: SlideTransition(
                      position: Tween<Offset>(
                        begin: Offset.zero,
                        end: const Offset(0.0, -1.0),
                      ).animate(secondaryAnimation),
                      child: child,
                    ),
                  );
                  break;
                case PageTransitionType.scale:
                  return ScaleTransition(
                    alignment: alignment!,
                    scale: CurvedAnimation(
                      parent: animation,
                      curve: Interval(
                        0.00,
                        0.50,
                        curve: curve,
                      ),
                    ),
                    child: child,
                  );
                  break;
                case PageTransitionType.rotate:
                  return RotationTransition(
                    alignment: alignment!,
                    turns: animation,
                    child: ScaleTransition(
                      alignment: alignment,
                      scale: animation,
                      child: FadeTransition(
                        opacity: animation,
                        child: child,
                      ),
                    ),
                  );
                  break;
                case PageTransitionType.size:
                  return Align(
                    alignment: alignment!,
                    child: SizeTransition(
                      sizeFactor: CurvedAnimation(
                        parent: animation,
                        curve: curve,
                      ),
                      child: child,
                    ),
                  );
                  break;
                case PageTransitionType.rightToLeftWithFade:
                  return SlideTransition(
                    position: Tween<Offset>(
                      begin: const Offset(1.0, 0.0),
                      end: Offset.zero,
                    ).animate(animation),
                    child: FadeTransition(
                      opacity: animation,
                      child: SlideTransition(
                        position: Tween<Offset>(
                          begin: Offset.zero,
                          end: const Offset(-1.0, 0.0),
                        ).animate(secondaryAnimation),
                        child: child,
                      ),
                    ),
                  );
                  break;
                case PageTransitionType.leftToRightWithFade:
                  return SlideTransition(
                    position: Tween<Offset>(
                      begin: const Offset(-1.0, 0.0),
                      end: Offset.zero,
                    ).animate(animation),
                    child: FadeTransition(
                      opacity: animation,
                      child: SlideTransition(
                        position: Tween<Offset>(
                          begin: Offset.zero,
                          end: const Offset(1.0, 0.0),
                        ).animate(secondaryAnimation),
                        child: child,
                      ),
                    ),
                  );
                  break;
                default:
                  return FadeTransition(opacity: animation, child: child);
              }
            });
}
