import 'package:flutter/material.dart';

@immutable
class ColumBuilder {
  final String name;
  final int flex;

  const ColumBuilder({required this.name, this.flex = 1});
}

class TableColumnWidget extends StatelessWidget {
  final List<ColumBuilder> items;
  const TableColumnWidget({
    Key? key,
    required this.items,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 44,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.vertical(top: Radius.circular(6)),
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xff001722),
                Color(0xff2e353b),
              ])),
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: items
              .map((e) => Expanded(
                    flex: e.flex,
                    child: Text(
                      e.name,
                      style: const TextStyle(color: Colors.white),
                    ),
                  ))
              .toList()
            ..insert(items.length, const Expanded(child: Text('')))),
    );
  }
}
