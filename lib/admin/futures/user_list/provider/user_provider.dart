import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:linked_scroll_controller/linked_scroll_controller.dart';
import 'package:tasu/admin/data/services/admin_repository.dart';
import 'package:tasu/admin/futures/admin_list/model/setstatus_model.dart';
import 'package:tasu/admin/futures/user_list/model/trans_user_model.dart';
import 'package:tasu/datatable/base/base_controller.dart';
import 'package:tasu/datatable/provider/table_state.dart';
import 'package:tasu/global/utils/utils.dart';

class UserProvider<T> with ChangeNotifier implements BaseTableController {
  late LinkedScrollControllerGroup controllers;
  late ScrollController headController;
  late ScrollController bodyController;
  late List<UserList> _data = [];
  late List<UserList> currentData = [];
  bool _sortAscending = true;
  int _selectedcolumnIndex = 0;
  int perPageRow = 1;
  int get selectedcolumnIndex => _selectedcolumnIndex;
  bool get sortAscending => _sortAscending;
  final List<int> _availeblepage = [10, 20, 30, 40];
  List<int> get availeblepage => _availeblepage;

  TableState tableState = TableState.init();
  UserProvider() {
    init();
  }
  @override
  void init() {
    controllers = LinkedScrollControllerGroup();
    headController = controllers.addAndGet();
    bodyController = controllers.addAndGet();
    getFirstPage();
  }

  @override
  void onSelect(int index, bool diss) {
    if (currentData[index].selected == true) {
      currentData[index].selected = false;
    } else {
      currentData[index].selected = true;
    }
    notifyListeners();
  }

  @override
  void allSelected(bool b) {
    for (var e in currentData) {
      e.selected = b;
    }

    notifyListeners();
  }

  @override
  List getSelected() {
    List<UserList> where = currentData.where((e) => e.selected = true).toList();
    return where;
  }

  @override
  void sort<T>(
    Comparable<T> Function(UserList d) getField,
    int columnIndex,
  ) {
    _sort<T>(getField, _sortAscending);
    _selectedcolumnIndex = columnIndex;
  }

  void _sort<T>(Comparable<T> Function(UserList d) getField, bool ascending) {
    currentData.sort((a, b) {
      final aValue = getField(a);
      final bValue = getField(b);
      return ascending
          ? Comparable.compare(aValue, bValue)
          : Comparable.compare(bValue, aValue);
    });
    if (_sortAscending) {
      _sortAscending = false;
    } else {
      _sortAscending = true;
    }
    notifyListeners();
  }

  final List<List> _chunks = [];
  List<List> _chunk(List list, int chunkSize) {
    _chunks.clear();
    int len = list.length;
    for (var i = 0; i < len; i += chunkSize) {
      int size = i + chunkSize;
      _chunks.add(list.sublist(i, size > len ? len : size));
    }
    return _chunks;
  }

  @override
  List<List<dynamic>> getNavList() {
    var chunk = _chunk(_data, perPageRow);
    return chunk;
  }

  int datalength = 0;
  void _nav(int index) {
    var d = _chunk(_data, perPageRow);
    datalength = d.length;
    // log('the current data length ${datalength} index $index  data len ${_data.length} d ${_data.length}');
    currentData = d[index] as List<UserList>;

    notifyListeners();
    onNavChages(index);
  }

  int pageIndex = 0;

  @override
  void toPage(int index) async {
    if (index <= datalength) {
      _nav(index);
      pageIndex = index;
    }
  }

  @override
  void nextPage() {
    // if (canNext()) {
    pageIndex++;
    toPage(pageIndex);
    // }
  }

  @override
  bool canFirst() => pageIndex != 0;
  @override
  bool canNext() {
    return pageIndex < datalength - 1;
  }

  @override
  bool canPrevious() => pageIndex > 0;
  @override
  bool canLast() => pageIndex < datalength - 1;
  @override
  void previousPage() {
    // if (canPrevious()) {
    pageIndex--;
    toPage(pageIndex);
    // }
  }

  @override
  void lastPage() {
    currentData = _chunk(_data, perPageRow).last as List<UserList>;
    pageIndex = datalength - 1;
    notifyListeners();
  }

  @override
  void setPerpage(int perPage) {
    perPageRow = perPage;
    var d = _chunk(_data, perPageRow);
    datalength = d.length;
    currentData = d[0] as List<UserList>;
    perPageRow = perPage;
    pageIndex = 0;
    notifyListeners();
  }

  @override
  void dispose() {
    headController.dispose();
    bodyController.dispose();
    super.dispose();
  }

  @override
  void firstPage([List<UserList>? d]) {
    if (canFirst()) {
      currentData = _chunk(d ?? _data, perPageRow).first as List<UserList>;

      pageIndex = 0;
      notifyListeners();
    }
  }

  @override
  void onNavChages(int rowIndex) {
    if (_pages.contains(rowIndex)) {
      log('dont get data from server');
    } else {
      log('get data fromserver');
      if (!_isSarch) {
        _getUserList(length: _start + _start);
        _pages.add((rowIndex.toDouble()));
      }
    }
  }

  //* /////////////////////////////////////////////////

  void setState({required TableState s, List<UserList>? d}) {
    if (d != null) _data = d;

    log('data ${d!.length}');
    tableState = s;
    _nav(0);
  }

  final AdminRepository _repository = AdminRepository();
  bool _isSarch = false;
  int _start = 0;
  final List<double> _pages = [0];
  void search(String keyWord) async {
    if (keyWord.isNotEmpty) {
      _isSarch = true;
      _getUserList(keyWord: keyWord);
    } else {
      _isSarch = false;
      getFirstPage();
      _pages.clear();
      _pages.add(0);
    }
  }

  void getFirstPage() async {
    await _getUserList(length: 3, start: 0);
    _start = 0;
  }

  void getLastPage() async {}
  void getAll() async {}
  Future<void> _getUserList(
      {int? start = 0,
      int? length,
      String? keyWord = '',
      bool isAll = false}) async {
    // if (_data.isEmpty) setState(s: TableState.loading());
    _repository
        .transUserlist(length: length ?? 0, start: start, keyWord: keyWord)
        .then((res) {
      if (keyWord!.isNotEmpty) {
        _searching(res);
      } else {
        if (res.total != 0) {
          setState(s: TableState.success(), d: res.userList);
        }
      }
    }).catchError(onError);
  }

  void _searching(TransUserListModel res) {
    if (res.total != 0) {
      setState(s: TableState.success(), d: res.userList);
    }
  }

  Future<void> onPageChanged(int rowIndex) async {
    if (_pages.contains(rowIndex)) {
    } else {
      if (!_isSarch) {
        _getUserList(length: _start + _start);
        _pages.add((rowIndex.toDouble()));
      }
    }
  }

  Future<void> delete(SetStatusModel seter) async {
    _repository.setStatus(seter).then((res) {
      if (res.runtimeType == String) {
        Utils.toast(res.toString());
      } else {
        getFirstPage();
        Utils.toast('Success');
      }
    });

    var map = seter.guidList!.map((e) {
      log('delete guid is --->' + e);
    });
    print(map.toString());
  }

  void onError(Object error, StackTrace stackTrace) {
    if (!_isSarch) {
      // setState(s: TableState.error(error.toString()));
      //emit(CompanyState.error(error.toString()));
    }
    // else {
    //   _isSarch = false;
    // }
  }
}
