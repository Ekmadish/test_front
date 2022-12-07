abstract class BaseTableController<T> {
  BaseTableController() {
    init();
  }
  void onSelect(int index, bool diss);
  void allSelected(bool b);
  List getSelected();
  void sort<T>(
    Comparable<T> Function(Object d) getField,
    int columnIndex,
  );
  List<List<dynamic>> getNavList();
  void _nav(int index);
  void toPage(int index);
  void nextPage();
  bool canFirst();
  bool canNext();
  bool canPrevious();
  bool canLast();
  void previousPage();
  void firstPage();
  void lastPage();
  void onNavChages(int rowIndex);
  List<List> _chunk(List list, int chunkSize);
  void setPerpage(int perPage);
  // *******************************
  // *******************************
  // *******************************

  void init();
}
