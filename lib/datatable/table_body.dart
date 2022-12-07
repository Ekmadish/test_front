import 'package:flutter/material.dart';
import 'package:linked_scroll_controller/linked_scroll_controller.dart';

class TableBody extends StatefulWidget {
  final ScrollController scrollController;
  final IndexedWidgetBuilder builders;
  final int itemCount;
  final double? bodyWidth;

  const TableBody({
    Key? key,
    required this.builders,
    required this.itemCount,
    required this.scrollController,
    this.bodyWidth,
  }) : super(key: key);

  @override
  _TableBodyState createState() => _TableBodyState();
}

class _TableBodyState extends State<TableBody> {
  late LinkedScrollControllerGroup _controllers;
  late ScrollController _firstColumnController;
  late ScrollController _restColumnsController;

  @override
  void initState() {
    super.initState();
    _controllers = LinkedScrollControllerGroup();
    _firstColumnController = _controllers.addAndGet();
    _restColumnsController = _controllers.addAndGet();
  }

  @override
  void dispose() {
    _firstColumnController.dispose();
    _restColumnsController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Container(
      alignment: Alignment.topLeft,
      child: LayoutBuilder(
        builder: (context, constraints) => SingleChildScrollView(
          controller: widget.scrollController,
          scrollDirection: Axis.horizontal,
          physics: const ClampingScrollPhysics(),
          child: Container(
            constraints: BoxConstraints(
              maxWidth:
                  width > 700 ? constraints.maxWidth : widget.bodyWidth ?? 700,
            ),
            // alignment: Alignment.centerLeft,
            // width: width > 700 ? width * .83 : widget.bodyWidth ?? 700,
            child: ListView.builder(
              shrinkWrap: true,
              controller: _restColumnsController,
              itemBuilder: widget.builders,
              itemCount: widget.itemCount,
              // padding: EdgeInsets.zero,
            ),
          ),
          // ),
        ),
      ),
    );
  }
}
