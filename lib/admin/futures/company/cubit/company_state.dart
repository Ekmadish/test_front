// part of 'company_cubit.dart';

// class CompanyState extends Equatable {
//   final bool init;
//   final bool loading;
//   final bool success;
//   final bool error;
//   final String errorStr;
//   // final List<double> pages;
//   final CompanyListModel? companyListModel;
//   const CompanyState(
//       {required this.init,
//       required this.loading,
//       required this.success,
//       required this.error,
//       required this.errorStr,
//       // required this.pages,
//       this.companyListModel});

//   @override
//   List<Object> get props =>
//       [loading, success, error, errorStr, companyListModel ?? 'null'];



//   factory CompanyState.loading() => const CompanyState(
//         init: false,
//         loading: true,
//         success: false,
//         error: false,
//         errorStr: 'loading',
//         // pages: [0],
//       );
//   factory CompanyState.error(String erorstr) => CompanyState(
//         init: false,
//         loading: false,
//         success: false,
//         error: true,
//         errorStr: erorstr,
//         // pages: [0],
//       );
//   factory CompanyState.success(
//     CompanyListModel m,
//   ) =>
//       CompanyState(
//         init: false,
//         loading: false,
//         success: false,
//         error: false,
//         errorStr: 'success',
//         companyListModel: m,
//         // pages: [0],
//       );
//   factory CompanyState.init() => const CompanyState(
//       init: true,
//       loading: false,
//       success: false,
//       error: false,
//       errorStr: 'init');
//   // pages: [0]);
// }
