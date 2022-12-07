
import 'package:equatable/equatable.dart';

class TableState extends Equatable {
  final bool loading;
  final bool init;
  final bool success;
  final bool isError;
  final String str;

  const TableState({
    required this.loading,
    required this.init,
    required this.success,
    required this.isError,
    required this.str,
  });
  @override
  List<Object?> get props => [
        loading,
        init,
        success,
        isError,
      ];

  factory TableState.loading() {
    return const TableState(
        loading: true,
        init: false,
        success: false,
        isError: false,
        str: 'loading');
  }

  factory TableState.error(String e) {
    return TableState(
        loading: false, init: false, success: false, isError: true, str: e);
  }
  factory TableState.success() {
    return const TableState(
      loading: false,
      init: false,
      success: true,
      isError: false,
      str: 'success',
    );
  }
  factory TableState.init() {
    return const TableState(
        loading: false,
        init: true,
        success: false,
        isError: false,
        str: 'init');
  }
}
