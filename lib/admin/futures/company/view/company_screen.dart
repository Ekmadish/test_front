import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:tasu/admin/futures/company/provider/company_provider.dart';
import 'package:tasu/admin/futures/company/view/addupdate_screen.dart';
import 'package:tasu/admin/view/widget/headr_widget.dart';
import 'package:tasu/datatable/model/headr_model.dart';
import 'package:tasu/datatable/table_body.dart';
import 'package:tasu/datatable/table_head.dart';
import 'package:tasu/datatable/widget/widget.dart';
import 'package:tasu/global/widgets/widgets.dart';

class CompanyScreenNew extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
  CompanyScreenNew({Key? key}) : super(key: key);

  @override
  State<CompanyScreenNew> createState() => _CompanyScreenNewState();
}

class _CompanyScreenNewState extends State<CompanyScreenNew> {
  bool i = false;
  @override
  Widget build(BuildContext context) {
    return IndexedStack(
      index: !i ? 0 : 1,
      children: [
        ChangeNotifierProvider(
          create: (context) => CompanyProvider(),
          lazy: true,
          child: Consumer<CompanyProvider>(
            builder: (context, provider, child) {
              if (provider.currentData.isEmpty) {
                return const LoadingWidget();
              } else {
                return Column(
                  children: [
                    HeadrWidget(
                      deletebtn:
                          // controller.selectedRows.isNotEmpty
                          //     ? IconButton(
                          //         icon: const Icon(Icons.delete),
                          //         onPressed: () {
                          //           dataSource.delete(SetStatusModel(
                          //             guidList: _selectedItem,
                          //             type: 'delete'
                          //           ));
                          //         },
                          //       )
                          //     :

                          const SizedBox(),
                      addPressed: () {
                        final entry = OverlayEntry(
                          builder: (context) => Positioned(
                            bottom: 20,
                            right: 20,
                            child: Container(
                              width: 200,
                              height: 200,
                              color: Colors.blue,
                            ),
                          ),
                        );
                        i = !i;
                        setState(() {});

                        log(i.toString());

                        // Navigator.of(context).push(PageRouteBuilder(
                        //     transitionDuration: Duration.zero,
                        //     reverseTransitionDuration: Duration.zero,
                        //     maintainState: true,
                        //     transitionsBuilder: (context, animation,
                        //             secondaryAnimation, child) =>
                        //         child,
                        //     pageBuilder:
                        //         (context, animation, secondaryAnimation) =>
                        //             AddUpdateCompanyScreen()));
                      },
                      onChanged: (s) {
                        provider.search(s);
                      },
                      clearCall: () {
                        provider.getFirstPage();
                      },
                    ),
                    Expanded(
                      child: Container(
                        alignment: Alignment.bottomCenter,
                        child: Scrollbar(
                          controller: provider.bodyController,
                          child: Column(
                            children: [
                              TableHead(
                                columBuilder: ColumBuilder(children: [
                                  HeadrColumn(
                                    child: CheckBoxWidget(
                                      changed: (value) {
                                        provider.allSelected(value!);
                                      },
                                      check: provider.currentData
                                          .any((element) => element.selected),
                                    ),
                                  ),
                                  HeadrColumn(
                                    child: HeadrColumWidget(
                                      color: Colors.yellow[50],
                                      text: 'l_CompanyName',
                                      ascending:
                                          provider.selectedcolumnIndex == 0
                                              ? provider.sortAscending
                                              : null,
                                      onTap: () {
                                        provider.sort((d) {
                                          return d.companyName!;
                                        }, 0);
                                      },
                                    ),
                                  ),
                                  HeadrColumn(
                                    child: HeadrColumWidget(
                                      color: Colors.yellow[50],
                                      text: 'Bin',
                                      ascending:
                                          provider.selectedcolumnIndex == 1
                                              ? provider.sortAscending
                                              : null,
                                      onTap: () {
                                        provider.sort((d) {
                                          return d.bin!;
                                        }, 1);
                                      },
                                    ),
                                  ),
                                  HeadrColumn(
                                    child: HeadrColumWidget(
                                      color: Colors.yellow[50],
                                      text: 'l_AddTime',
                                      ascending:
                                          provider.selectedcolumnIndex == 2
                                              ? provider.sortAscending
                                              : null,
                                      onTap: () {
                                        provider.sort((d) {
                                          return d.addTime!;
                                        }, 2);
                                      },
                                    ),
                                  ),
                                  HeadrColumn(
                                    child: HeadrColumWidget(
                                      color: Colors.yellow[50],
                                      text: 'l_UpdateTime',
                                      ascending:
                                          provider.selectedcolumnIndex == 3
                                              ? provider.sortAscending
                                              : null,
                                      onTap: () {
                                        provider.sort((d) {
                                          return d.updateTime!;
                                        }, 3);
                                      },
                                    ),
                                  ),
                                ], scrollController: provider.headController),
                              ),
                              Expanded(
                                child: TableBody(
                                    builders: (context, index) => DecoratedBox(
                                          decoration: BoxDecoration(
                                              color: provider.currentData[index]
                                                      .selected
                                                  ? Colors.grey[300]
                                                  : Colors.white),
                                          child: Row(
                                            children: [
                                              RowWidget(
                                                value: provider
                                                    .currentData[index]
                                                    .companyName!,
                                              ),
                                              RowWidget(
                                                value: provider
                                                    .currentData[index].bin!,
                                                onTap: () {},
                                              ),
                                              RowWidget(
                                                  value: provider
                                                      .currentData[index]
                                                      .addTime!
                                                      .toString()),
                                              RowWidget(
                                                  value: provider
                                                      .currentData[index]
                                                      .updateTime!
                                                      .toString()),
                                            ]..insert(
                                                0,
                                                CheckBoxWidget(
                                                  changed: (value) {
                                                    provider.onSelect(
                                                        index, value!);
                                                  },
                                                  check: provider
                                                      .currentData[index]
                                                      .selected,
                                                ),
                                              ),
                                          ),
                                        ),
                                    itemCount: provider.currentData.length,
                                    scrollController: provider.bodyController),
                              ),
                              NavigationWidget(
                                availeblepage: const [
                                  1,
                                  2,
                                  3
                                ], // provider.availeblepage,
                                firstPressed: !provider.canFirst()
                                    ? null
                                    : () {
                                        provider.firstPage();
                                      },
                                previousPressed: !provider.canPrevious()
                                    ? null
                                    : () {
                                        provider.previousPage();
                                      },
                                initializeIndex: provider.perPageRow,
                                lastPressed: !provider.canLast()
                                    ? null
                                    : () {
                                        provider.lastPage();
                                      },
                                nextPressed: !provider.canNext()
                                    ? null
                                    : () {
                                        provider.nextPage();
                                      },
                                onperPageChanged: (p) {
                                  provider.setPerpage(p!);
                                },
                                pageCount: provider.getNavList().length,
                                pageIndex: provider.pageIndex,
                                toPage: (index) async {
                                  provider.toPage(index);
                                },
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              }
            },
          ),
        ),
        AddUpdateCompanyScreen(),
      ],
    );
  }

  Widget _body() {
    return Consumer<CompanyProvider>(
      builder: (context, provider, child) {
        if (provider.currentData.isEmpty) {
          return const LoadingWidget();
        } else {
          return Column(
            children: [
              HeadrWidget(
                deletebtn:
                    // controller.selectedRows.isNotEmpty
                    //     ? IconButton(
                    //         icon: const Icon(Icons.delete),
                    //         onPressed: () {
                    //           dataSource.delete(SetStatusModel(
                    //             guidList: _selectedItem,
                    //             type: 'delete'
                    //           ));
                    //         },
                    //       )
                    //     :

                    const SizedBox(),
                addPressed: () {
                  // context.go('/admin/companylist/addupdata');

                  Navigator.of(context).push(PageRouteBuilder(
                      transitionDuration: Duration.zero,
                      reverseTransitionDuration: Duration.zero,
                      maintainState: true,
                      transitionsBuilder:
                          (context, animation, secondaryAnimation, child) =>
                              child,
                      pageBuilder: (context, animation, secondaryAnimation) =>
                          AddUpdateCompanyScreen()));
                },
                onChanged: (s) {
                  provider.search(s);
                },
                clearCall: () {
                  provider.getFirstPage();
                },
              ),
              Expanded(
                child: Container(
                  alignment: Alignment.bottomCenter,
                  child: Scrollbar(
                    controller: provider.bodyController,
                    child: Column(
                      children: [
                        TableHead(
                          columBuilder: ColumBuilder(children: [
                            HeadrColumn(
                              child: CheckBoxWidget(
                                changed: (value) {
                                  provider.allSelected(value!);
                                },
                                check: provider.currentData
                                    .any((element) => element.selected),
                              ),
                            ),
                            HeadrColumn(
                              child: HeadrColumWidget(
                                color: Colors.yellow[50],
                                text: 'l_CompanyName',
                                ascending: provider.selectedcolumnIndex == 0
                                    ? provider.sortAscending
                                    : null,
                                onTap: () {
                                  provider.sort((d) {
                                    return d.companyName!;
                                  }, 0);
                                },
                              ),
                            ),
                            HeadrColumn(
                              child: HeadrColumWidget(
                                color: Colors.yellow[50],
                                text: 'Bin',
                                ascending: provider.selectedcolumnIndex == 1
                                    ? provider.sortAscending
                                    : null,
                                onTap: () {
                                  provider.sort((d) {
                                    return d.bin!;
                                  }, 1);
                                },
                              ),
                            ),
                            HeadrColumn(
                              child: HeadrColumWidget(
                                color: Colors.yellow[50],
                                text: 'l_AddTime',
                                ascending: provider.selectedcolumnIndex == 2
                                    ? provider.sortAscending
                                    : null,
                                onTap: () {
                                  provider.sort((d) {
                                    return d.addTime!;
                                  }, 2);
                                },
                              ),
                            ),
                            HeadrColumn(
                              child: HeadrColumWidget(
                                color: Colors.yellow[50],
                                text: 'l_UpdateTime',
                                ascending: provider.selectedcolumnIndex == 3
                                    ? provider.sortAscending
                                    : null,
                                onTap: () {
                                  provider.sort((d) {
                                    return d.updateTime!;
                                  }, 3);
                                },
                              ),
                            ),
                          ], scrollController: provider.headController),
                        ),
                        Expanded(
                          child: TableBody(
                              builders: (context, index) => DecoratedBox(
                                    decoration: BoxDecoration(
                                        color:
                                            provider.currentData[index].selected
                                                ? Colors.grey[300]
                                                : Colors.white),
                                    child: Row(
                                      children: [
                                        RowWidget(
                                          value: provider
                                              .currentData[index].companyName!,
                                        ),
                                        RowWidget(
                                          value:
                                              provider.currentData[index].bin!,
                                          onTap: () {},
                                        ),
                                        RowWidget(
                                            value: provider
                                                .currentData[index].addTime!
                                                .toString()),
                                        RowWidget(
                                            value: provider
                                                .currentData[index].updateTime!
                                                .toString()),
                                      ]..insert(
                                          0,
                                          CheckBoxWidget(
                                            changed: (value) {
                                              provider.onSelect(index, value!);
                                            },
                                            check: provider
                                                .currentData[index].selected,
                                          ),
                                        ),
                                    ),
                                  ),
                              itemCount: provider.currentData.length,
                              scrollController: provider.bodyController),
                        ),
                        NavigationWidget(
                          availeblepage: const [
                            1,
                            2,
                            3
                          ], // provider.availeblepage,
                          firstPressed: !provider.canFirst()
                              ? null
                              : () {
                                  provider.firstPage();
                                },
                          previousPressed: !provider.canPrevious()
                              ? null
                              : () {
                                  provider.previousPage();
                                },
                          initializeIndex: provider.perPageRow,
                          lastPressed: !provider.canLast()
                              ? null
                              : () {
                                  provider.lastPage();
                                },
                          nextPressed: !provider.canNext()
                              ? null
                              : () {
                                  provider.nextPage();
                                },
                          onperPageChanged: (p) {
                            provider.setPerpage(p!);
                          },
                          pageCount: provider.getNavList().length,
                          pageIndex: provider.pageIndex,
                          toPage: (index) async {
                            provider.toPage(index);
                          },
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
        }
      },
    );
  }
}
