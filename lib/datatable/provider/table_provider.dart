import 'package:flutter/material.dart';
import 'package:linked_scroll_controller/linked_scroll_controller.dart';
import 'package:tasu/datatable/base/base_controller.dart';
import 'package:tasu/datatable/multiplication_table.dart';

class DProvider<T> with ChangeNotifier implements BaseTableController {
  late LinkedScrollControllerGroup controllers;
  late ScrollController headController;
  late ScrollController bodyController;
  late List<Demo> _data;
  late List<Demo> currentData;
  bool _sortAscending = true;
  int _selectedcolumnIndex = 0;
  int perPageRow = 10;
  int get selectedcolumnIndex => _selectedcolumnIndex;
  bool get sortAscending => _sortAscending;
  final List<int> _availeblepage = [10, 20, 30, 40];
  List<int> get availeblepage => _availeblepage;

  DProvider() {
    init();
  }
  // *******************************
  // *******************************
  // *******************************
  // *******sort select section*****
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
    List<Demo> where = currentData.where((e) => e.selected = true).toList();
    return where;
  }

  @override
  void sort<T>(
    Comparable<T> Function(Demo d) getField,
    int columnIndex,
  ) {
    _sort<T>(getField, _sortAscending);
    _selectedcolumnIndex = columnIndex;
  }
  // *******************************
  // *******************************
  // *******************************

  void _sort<T>(Comparable<T> Function(Demo d) getField, bool ascending) {
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

  // *******************************
  // *******************************
  // ************nav section********
  @override
  List<List<dynamic>> getNavList() {
    var chunk = _chunk(_data, perPageRow);
    return chunk;
  }

  int datalength = 0;
  void _nav(int index) {
    var d = _chunk(_data, perPageRow);
    datalength = d.length;
    currentData = d[index] as List<Demo>;
    notifyListeners();
  }

  int pageIndex = 0;

  @override
  void toPage(int index) {
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
  void firstPage() {
    if (canFirst()) {
      currentData = _chunk(_data, perPageRow).first as List<Demo>;
      pageIndex = 0;
      notifyListeners();
    }
  }

  @override
  void lastPage() {
    currentData = _chunk(_data, perPageRow).last as List<Demo>;
    pageIndex = datalength - 1;
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
  void setPerpage(int perPage) {
    perPageRow = perPage;
    var d = _chunk(_data, perPageRow);
    datalength = d.length;
    currentData = d[0] as List<Demo>;
    perPageRow = perPage;
    pageIndex = 0;
    notifyListeners();
  }

  @override
  void onNavChages(int rowIndex) {}
  // *******************************
  // *******************************
  // *******************************

  @override
  void init() {
    _data = Demo.getData();
    _nav(0);
    controllers = LinkedScrollControllerGroup();
    headController = controllers.addAndGet();
    bodyController = controllers.addAndGet();
  }

  @override
  void dispose() {
    headController.dispose();
    bodyController.dispose();
    super.dispose();
  }
}
