// part of 'adminlist_cubit.dart';

// class AdminlistState extends Equatable {
//   final bool init;
//   final bool loading;
//   final bool success;
//   final bool error;
//   final String errorStr;
//   final AdminListModel? adminList;

//   const AdminlistState(
//       {required this.init,
//       required this.loading,
//       required this.success,
//       required this.error,
//       required this.errorStr,
//       this.adminList});

//   @override
//   List<Object> get props =>
//       [loading, success, error, errorStr, adminList ?? 'null'];

//   factory AdminlistState.loading() => const AdminlistState(
//       init: false,
//       loading: true,
//       success: false,
//       error: false,
//       errorStr: 'loading');

//   factory AdminlistState.error(String erorstr) => AdminlistState(
//       init: false,
//       loading: false,
//       success: false,
//       error: true,
//       errorStr: erorstr);
//   factory AdminlistState.success(AdminListModel m) => AdminlistState(
//       init: false,
//       loading: false,
//       success: false,
//       error: false,
//       errorStr: 'success',
//       adminList: m);
//   factory AdminlistState.init() => const AdminlistState(
//       init: true,
//       loading: false,
//       success: false,
//       error: false,
//       errorStr: 'init');
// }
