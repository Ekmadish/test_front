import 'package:flutter/material.dart';

// const double cellWidth = 100;

class MultiplicationTableCell extends StatelessWidget {
  final int? value;
  final Color? color;

  const MultiplicationTableCell({Key? key, this.color, this.value})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        color: color,
        border: Border.all(color: Colors.black12, width: 1.0),
      ),
      alignment: Alignment.center,
      child: Text('${value ?? ''}', style: const TextStyle(fontSize: 16.0)),
    );
  }
}

Widget _buildDataCell({
  required BuildContext context,
  required EdgeInsetsGeometry padding,
  required Widget label,
  required bool numeric,
  required bool placeholder,
  required bool showEditIcon,
  required GestureTapCallback? onTap,
  required VoidCallback? onSelectChanged,
  required GestureTapCallback? onDoubleTap,
  required GestureLongPressCallback? onLongPress,
  required GestureTapDownCallback? onTapDown,
  required GestureTapCancelCallback? onTapCancel,
  required MaterialStateProperty<Color?>? overlayColor,
  required GestureLongPressCallback? onRowLongPress,
  double? dataRowHeight,
  TextStyle? dataTextStyle,
}) {
  final ThemeData themeData = Theme.of(context);
  final DataTableThemeData dataTableTheme = DataTableTheme.of(context);
  if (showEditIcon) {
    const Widget icon = Icon(Icons.edit, size: 18.0);
    label = Expanded(child: label);
    label = Row(
      textDirection: numeric ? TextDirection.rtl : null,
      children: <Widget>[label, icon],
    );
  }

  final TextStyle effectiveDataTextStyle = dataTextStyle ??
      dataTableTheme.dataTextStyle ??
      themeData.dataTableTheme.dataTextStyle ??
      themeData.textTheme.bodyText2!;
  final double effectiveDataRowHeight = dataRowHeight ??
      dataTableTheme.dataRowHeight ??
      themeData.dataTableTheme.dataRowHeight ??
      kMinInteractiveDimension;
  label = Container(
    padding: padding,
    height: effectiveDataRowHeight,
    alignment:
        numeric ? Alignment.centerRight : AlignmentDirectional.centerStart,
    child: DefaultTextStyle(
      style: effectiveDataTextStyle.copyWith(
        color:
            placeholder ? effectiveDataTextStyle.color!.withOpacity(0.6) : null,
      ),
      child: DropdownButtonHideUnderline(child: label),
    ),
  );
  if (onTap != null ||
      onDoubleTap != null ||
      onLongPress != null ||
      onTapDown != null ||
      onTapCancel != null) {
    label = InkWell(
      onTap: onTap,
      onDoubleTap: onDoubleTap,
      onLongPress: onLongPress,
      onTapCancel: onTapCancel,
      onTapDown: onTapDown,
      overlayColor: overlayColor,
      child: label,
    );
  } else if (onSelectChanged != null || onRowLongPress != null) {
    label = TableRowInkWell(
      onTap: onSelectChanged,
      onLongPress: onRowLongPress,
      overlayColor: overlayColor,
      child: label,
    );
  }
  return label;
}
