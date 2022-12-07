class AuthState {
  final bool authorized;
  final bool unAuthorized;
  final bool isAdmin;
  const AuthState({
    required this.authorized,
    required this.unAuthorized,
    required this.isAdmin,
  });

  factory AuthState.authorized(bool isAdmin) =>
      AuthState(authorized: true, unAuthorized: false, isAdmin: isAdmin);

  factory AuthState.unAuthorized() =>
      const AuthState(authorized: false, unAuthorized: true, isAdmin: false);
}
