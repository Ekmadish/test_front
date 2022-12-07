// import 'dart:developer';

// import 'package:equatable/equatable.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:tasu/admin/data/services/admin_repository.dart';
// import 'package:tasu/admin/futures/admin_list/model/admin_list_model.dart';
// import 'package:tasu/admin/futures/admin_list/model/setstatus_model.dart';
// import 'package:tasu/global/utils/utils.dart';

// part 'adminlist_state.dart';

// class AdminlistCubit extends Cubit<AdminlistState> {
//   AdminlistCubit() : super(AdminlistState.init());
//   final AdminRepository _repository = AdminRepository();
//   int _length = 11;
//   final List<double> _pages = [0];
//   late bool _isSarch = false;
//   int _rowsPerPage = 20;
//   int get rowsPerPage => _rowsPerPage;
//   set setRowsPerPage(int i) => _rowsPerPage = i;
//   late AdminListModel _adminListModel;

//   Future<void> onPageChanged(int rowIndex) async {
//     if (_pages.contains(rowIndex / _rowsPerPage)) {
//       log('dont get data from server');
//     } else {
//       log('get data fromserver');

//       if (!_isSarch) {
//         _getadminList(length: _length);
//         _pages.add((rowIndex / _rowsPerPage));
//       }
//     }
//   }

//   Future<void> getFirstPage() async {
//     await _getadminList(length: _rowsPerPage < 20 ? 15 : 21);
//   }

//   void getLastPage() {
//     _getadminList(length: 0);
//   }

//   void searching(String keyWord) {
//     if (keyWord.isNotEmpty) {
//       _isSarch = true;
//       _getadminList(keyWord: keyWord);
//     } else {
//       _isSarch = false;
//       getFirstPage();
//       _pages.clear();
//       _pages.add(0);
//     }
//   }

//   void _searching(dynamic res) {
//     if (res.runtimeType != String && res != null) {
//       if (res.total != 0) emit(AdminlistState.success(res));
//     }
//   }

//   void getAll() async {
//     await _getadminList(isAll: true);
//   }

//   Future<void> _getadminList(
//       {int? start = 0,
//       int? length,
//       String? keyWord = '',
//       bool isAll = false}) async {
//     if (state.adminList == null) emit(AdminlistState.loading());
//     _repository
//         .adminList(
//             start: start, length: length ?? 0, keyWord: keyWord, isAll: isAll)
//         .then((res) {
//       log('call first page   ok ');
//       if (keyWord!.isNotEmpty) {
//         _searching(res);
//       } else {
//         if (res != null) {
//           if (res.runtimeType == String) {
//             emit(AdminlistState.error(res.toString()));
//             Utils.toast(res.toString());
//           } else {
//             _adminListModel = res;
//             emit(AdminlistState.success(_adminListModel));
//             _length = _length + state.adminList!.dataList!.length;
//           }
//         } else {
//           emit(AdminlistState.error('internet error'));
//           Utils.toast('Internet error');
//         }
//       }
//     }).catchError(onError);
//   }

//   Future<void> delete(SetStatusModel set) async {
//     _repository.setStatus(set).then((res) {
//       if (res.runtimeType == String) {
//         Utils.toast(res.toString());
//       } else {
//         Utils.toast('Success');
//       }
//     });
//   }

//   @override
//   void onError(Object error, StackTrace stackTrace) {
//     if (!_isSarch) {
//       emit(AdminlistState.error(error.toString()));
//     } else {
//       _isSarch = false;
//     }

//     super.onError(error, stackTrace);
//   }
// }
