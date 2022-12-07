import 'package:flutter/material.dart';

import 'model/model.dart';

class TableHead extends StatelessWidget {
  final ColumBuilder columBuilder;
  final double? headrWidth;
  final double? headrHeight;
  const TableHead({
    Key? key,
    this.headrWidth,
    this.headrHeight,
    required this.columBuilder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return LayoutBuilder(
      builder: (context, constraints) => Container(
        height: headrHeight ?? 50,
        alignment: Alignment.centerLeft,
        child: ListView(
          controller: columBuilder.scrollController,
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          children: [
            Container(
              constraints: BoxConstraints(
                maxWidth:
                    width > 700 ? constraints.maxWidth : headrWidth ?? 700,
              ),
              // width: width > 700 ? width : headrWidth ?? 700,
              child: Row(children: columBuilder.children),
            ),
          ],
        ),
      ),
    );
  }
}

class HeadrColumn extends StatelessWidget {
  final Widget child;

  const HeadrColumn({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return child;
  }
}
