class AdminConstant {
  AdminConstant._();
  static final AdminConstant _ant = AdminConstant._();
  factory AdminConstant() => _ant;
}

enum AddOrUpdateSate { Init, Success, Failed, Error, Loading }

enum TableEnum { Init, Loading, Success, Error }
