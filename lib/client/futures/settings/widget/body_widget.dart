import 'package:flutter/material.dart';
import 'package:tasu/client/view/widget/widgets.dart';
import 'package:tasu/global/widgets/widgets.dart';

class BodyWidget extends StatelessWidget {
  const BodyWidget({
    Key? key,
    required this.itemBuilder,
    required this.itemCount,
    required this.columnName,
  }) : super(key: key);

  final Widget Function(BuildContext context, int index) itemBuilder;
  final int itemCount;
  final List<ColumBuilder> columnName;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(2),
          border: Border.all(color: const Color(0xff363a3d))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TableColumnWidget(
            items: columnName,
          ),
          tListviewBuilder(itemBuilder: itemBuilder, itemCount: itemCount)
        ],
      ),
    );
  }
}
