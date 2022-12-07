abstract class Repository<T> {
  void init() {}
  void dispose() {}
  void logout() async {}
  Future<T> login({required String loginName, required String password}) async {
    return Future.value();
  }

  Future checkAuth() async {}
  Future renewToken() async {}
  void onError(Object error, StackTrace stackTrace) {}
}
