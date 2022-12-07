import 'package:flutter/material.dart';
import 'package:tasu/global/config/constant/auth_state.dart';

class TasuAuth with ChangeNotifier {
  AuthState _authState = AuthState.unAuthorized();
  AuthState get authState => _authState;

  Future<void> setAuthSate(AuthState s) async {
    _authState = s;
    notifyListeners();
  }

  Future<void> logout() async {
    _authState = AuthState.unAuthorized();
    notifyListeners();
  }
}

class TasuAuthScope extends InheritedNotifier<TasuAuth> {
  /// Creates a [TasuAuthScope].
  const TasuAuthScope({
    required TasuAuth notifier,
    required Widget child,
    Key? key,
  }) : super(key: key, notifier: notifier, child: child);

  static TasuAuth of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<TasuAuthScope>()!.notifier!;
}
