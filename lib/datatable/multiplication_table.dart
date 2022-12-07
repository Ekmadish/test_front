import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tasu/datatable/base/base_controller.dart';
import 'package:tasu/datatable/provider/table_provider.dart';

import 'model/headr_model.dart';
import 'table_head.dart';
import 'table_body.dart';
import 'widget/widget.dart';

class MultiplicationTable<T extends BaseTableController>
    extends StatelessWidget {
  const MultiplicationTable({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<DProvider>(
      create: (context) => DProvider(),
      lazy: true,
      child: Consumer<DProvider>(
        builder: (context, dprovider, child) {
          return Scrollbar(
            controller: dprovider.bodyController,
            child: Column(
              children: [
                TableHead(
                  columBuilder: ColumBuilder(
                      children: [
                        HeadrColumn(
                          child: HeadrColumWidget(
                            color: Colors.yellow.withOpacity(0.6),
                            text: 'Namexsxsxxsxsxsnxsxsxsxsxsx',
                            ascending: dprovider.selectedcolumnIndex == 0
                                ? dprovider.sortAscending
                                : null,
                            onTap: () {
                              dprovider.sort((d) {
                                return d.name;
                              }, 0);
                            },
                          ),
                        ),
                        HeadrColumn(
                          child: HeadrColumWidget(
                            color: Colors.yellow.withOpacity(0.6),
                            text: '2',
                            ascending: dprovider.selectedcolumnIndex == 1
                                ? dprovider.sortAscending
                                : null,
                            onTap: () {
                              dprovider.sort((d) {
                                return d.age;
                              }, 1);
                            },
                          ),
                        ),
                        HeadrColumn(
                          child: HeadrColumWidget(
                            color: Colors.yellow.withOpacity(0.6),
                            text: '3',
                            ascending: dprovider.selectedcolumnIndex == 2
                                ? dprovider.sortAscending
                                : null,
                            onTap: () {
                              dprovider.sort((d) {
                                return d.work;
                              }, 2);
                            },
                          ),
                        ),
                      ]..insert(
                          0,
                          HeadrColumn(
                            child: CheckBoxWidget(
                              changed: (value) {
                                dprovider.allSelected(value!);
                              },
                              check: dprovider.currentData
                                  .any((element) => element.selected),
                            ),
                          ),
                        ),
                      scrollController: dprovider.headController),
                ),
                Expanded(
                  child: TableBody(
                      builders: (context, index) {
                        return DecoratedBox(
                          decoration: BoxDecoration(
                              color: dprovider.currentData[index].selected
                                  ? Colors.grey[300]
                                  : Colors.white),
                          child: Row(
                            children: [
                              RowWidget(
                                value: dprovider.currentData[index].name,
                              ),
                              RowWidget(
                                value: dprovider.currentData[index].age,
                                onTap: () {},
                              ),
                              RowWidget(
                                  value: dprovider.currentData[index].work),
                            ]..insert(
                                0,
                                CheckBoxWidget(
                                  changed: (value) {
                                    dprovider.onSelect(index, value!);
                                  },
                                  check: dprovider.currentData[index].selected,
                                ),
                              ),
                          ),
                        );
                      },
                      itemCount: dprovider.currentData.length,
                      scrollController: dprovider.bodyController),
                ),
                // NavigationWidget()
              ],
            ),
          );
        },
      ),
    );
  }
}

class Demo {
  static List<Demo> getData() {
    return List<Demo>.generate(
        30,
        (index) => Demo(
              age: (index * 10).toString(),
              name: 'name$index',
              work: 'work $index work ',
            ));
  }

  final String name;
  final String age;
  final String work;
  bool selected = false;

  Demo({
    required this.name,
    required this.age,
    required this.work,
  });
}
