import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:localization/localization.dart';
import 'package:provider/provider.dart';
import 'package:tasu/admin/futures/admin_list/provider/admin_provider.dart';
import 'package:tasu/admin/futures/admin_list/view/admin_addupdate_screen.dart';
import 'package:tasu/admin/view/widget/headr_widget.dart';
import 'package:tasu/datatable/datatable.dart';
import 'package:tasu/global/widgets/widgets.dart';

class AdminScreenList extends StatelessWidget {
  // ignore: prefer_const_constructors_in_immutables
  AdminScreenList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AdminProvider(),
      lazy: true,
      child: Consumer<AdminProvider>(
        builder: (context, provider, child) {
          if (provider.currentData.isEmpty) {
            return const LoadingWidget();
          } else {
            return Column(
              children: [
                HeadrWidget(
                  clearCall: () {
                    provider.getFirstPage();
                  },
                  deletebtn:
                      // controller.selectedRows.isNotEmpty
                      // ? IconButton(
                      //     icon: const Icon(Icons.delete),
                      //     onPressed: () {
                      //       showDialog(
                      //         context: context,
                      //         builder: (context) => CustomAlertDialog(
                      //           negativeBtnText: "l_No",
                      //           onNegativePressed: () {},
                      //           onPostivePressed: () {
                      //             dataSource.delete(SetStatusModel(
                      //                 guidList: _selectedItem, type: 'delete'));
                      //           },
                      //           message: 'l_DeleteSure',
                      //           positiveBtnText: 'l_Yes',
                      //           title: 'l_Delete',
                      //           key: const ValueKey('dialog'),
                      //           circularBorderRadius: 4,
                      //         ),
                      //       );
                      //     },
                      //   )
                      // :
                      const SizedBox(),
                  onChanged: (s) {
                    provider.search(s);
                  },
                  addPressed: () {
                    // context.go('/admin/adminlist/addupdata');
                    context.go('/admin/adminlist/addupdata');

                    // Navigator.of(context).push(PageRouteBuilder(
                    //     transitionDuration: const Duration(milliseconds: 20),
                    //     reverseTransitionDuration:
                    //         const Duration(milliseconds: 20),
                    //     transitionsBuilder:
                    //         (context, animation, secondaryAnimation, child) =>
                    //             child,
                    //     pageBuilder: (context, animation, secondaryAnimation) =>
                    //         AdminAddUpdateScreen()));
                  },
                ),
                Expanded(
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
                                color: Colors.yellow.withOpacity(0.6),
                                text: 'l_Name',
                                ascending: provider.selectedcolumnIndex == 0
                                    ? provider.sortAscending
                                    : null,
                                onTap: () {
                                  provider.sort((d) {
                                    return d.name!;
                                  }, 0);
                                },
                              ),
                            ),
                            HeadrColumn(
                              child: HeadrColumWidget(
                                color: Colors.yellow.withOpacity(0.6),
                                text: 'l_Email',
                                ascending: provider.selectedcolumnIndex == 1
                                    ? provider.sortAscending
                                    : null,
                                onTap: () {
                                  provider.sort((d) {
                                    return d.email!;
                                  }, 1);
                                },
                              ),
                            ),
                            HeadrColumn(
                              child: HeadrColumWidget(
                                color: Colors.yellow.withOpacity(0.6),
                                text: 'l_Phone',
                                ascending: provider.selectedcolumnIndex == 2
                                    ? provider.sortAscending
                                    : null,
                                onTap: () {
                                  provider.sort((d) {
                                    return d.phone!;
                                  }, 2);
                                },
                              ),
                            ),
                            HeadrColumn(
                              child: HeadrColumWidget(
                                color: Colors.yellow.withOpacity(0.6),
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
                                          value:
                                              provider.currentData[index].name!,
                                        ),
                                        RowWidget(
                                          value: provider
                                              .currentData[index].email!,
                                          onTap: () {},
                                        ),
                                        RowWidget(
                                            value: provider
                                                .currentData[index].phone!
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
              ],
            );
          }
        },
      ),
    );
  }
}
