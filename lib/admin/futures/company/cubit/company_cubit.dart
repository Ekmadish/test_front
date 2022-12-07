// import 'dart:developer';

// import 'package:equatable/equatable.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:tasu/admin/data/services/admin_repository.dart';
// import 'package:tasu/admin/futures/company/model/compony_list_model.dart';

// import 'package:tasu/global/utils/utils.dart';

// part 'company_state.dart';

// class CompanyCubit extends Cubit<CompanyState> {
//   CompanyCubit() : super(CompanyState.init());
//   final AdminRepository _repository = AdminRepository();
//   late CompanyListModel? _companyListModel;
//   int _start = 0;
//   final List<double> _pages = [0];
//   late bool _isSarch = false;
//   // final int _rowsPerPage = 10;
//   // set setRowsPerPage(int i) => _rowsPerPage;

//   Future<void> onPageChanged(int rowIndex) async {
//     // log('the index $rowsPerPage');
//     if (_pages.contains(rowIndex)) {
//       log('dont get data from server');
//     } else {
//       log('get data fromserver');
//       if (!_isSarch) {
//         _getTranscompanyList(length: _start);
//         _pages.add((rowIndex.toDouble()));
//       }
//     }
//   }

//   // var iii = 0;
//   Future<void> getFirstPage() async {
//     await _getTranscompanyList(length: _start);
//   }

//   void getLastPage() {
//     _getTranscompanyList(length: 0);
//   }

//   void searching(String keyWord) {
//     if (keyWord.isNotEmpty) {
//       _isSarch = keyWord.isNotEmpty;
//       _getTranscompanyList(keyWord: keyWord);
//     } else {
//       _isSarch = false;
//       getFirstPage();
//       _pages.clear();
//       _pages.add(0);
//     }
//   }

//   void _searching(dynamic res) async {
//     if (res.runtimeType != String && res != null) {
//       if (res.total != 0) emit(CompanyState.success(res));
//     }
//   }

//   void _getAll() async {
//     await _getTranscompanyList();
//   }

//   Future<void> _getTranscompanyList(
//       {int? start = 0,
//       int? length,
//       String? keyWord = '',
//       bool isAll = false}) async {
//     if (state.companyListModel == null) emit(CompanyState.loading());
//     _repository
//         .transCompanyList(length: start!, start: start, keyWord: keyWord)
//         .then((res) {
//       if (keyWord!.isNotEmpty) {
//         _searching(res);
//       } else {
//         if (res != null) {
//           if (res.runtimeType == String) {
//             emit(CompanyState.error(res.toString()));
//             Utils.toast(res.toString());
//           } else {
//             _companyListModel = res;
//             emit(CompanyState.success(_companyListModel!));
//             // log('inside  len   $_length');
//             _start = start + state.companyListModel!.dataList!.length;
//             // log('after  len   $_length');
//           }
//         } else {
//           emit(CompanyState.error('Internet error'));
//           Utils.toast('Internet error');
//         }
//       }
//     }).catchError(onError);
  
  
//   }

//   @override
//   void onError(Object error, StackTrace stackTrace) {
//     if (!_isSarch) {
//       emit(CompanyState.error(error.toString()));
//     } else {
//       _isSarch = false;
//     }

//     super.onError(error, stackTrace);
//   }


// }
