import 'package:admin/admin/data/services/admin_repository.dart';
import 'package:flutter/material.dart';
import 'package:utils/utils/sp.dart';

class AuthProvider with ChangeNotifier {
  AuthProvider._() {
    checkAuth();
  }
  static final AuthProvider _authProvider = AuthProvider._();
  factory AuthProvider() => _authProvider;

  final SecureStorage _storage = SecureStorage();

  final AdminRepository _adminRepository = AdminRepository();
  bool _authState = false;

  bool get authState => _authState;
  void setAuthState(bool authState) {
    _authState = authState;

    notifyListeners();
  }

  void checkAuth() {
    _storage.readSecureData('a_at').then((t) {
      // log('token  $t');
      if (t!.isNotEmpty) {
        _authState = true;
      } else {
        _authState = false;
      }
      notifyListeners();
    });
  }

  void logout() {
    _authState = false;
    _adminRepository.logout();
    notifyListeners();
  }
}
