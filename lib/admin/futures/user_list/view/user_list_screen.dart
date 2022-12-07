import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tasu/admin/futures/user_list/provider/user_provider.dart';
import 'package:tasu/datatable/datatable.dart';
import 'package:tasu/global/widgets/textfileds_widget.dart';
import 'package:tasu/global/widgets/widgets.dart';

class UserLisScreentNew extends StatelessWidget {
    // ignore: prefer_const_constructors_in_immutables
    UserLisScreentNew({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => UserProvider(),
      lazy: true,
      child: Consumer<UserProvider>(
        builder: (context, provider, child) {
          if (provider.currentData.isEmpty) {
            return const LoadingWidget();
          } else {
            return Column(
              children: [
                Container(
                  margin:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 3,
                        child: SearchingTextField(
                          onChanged: (s) => provider.search(s),
                          clearCall: () => provider.getFirstPage(),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    alignment: Alignment.bottomCenter,
                    child: Scrollbar(
                      controller: provider.bodyController,
                      child: Column(
                        children: [
                          TableHead(
                            // headrWidth: 500,
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
                                          color: provider
                                                  .currentData[index].selected
                                              ? Colors.grey[300]
                                              : Colors.white),
                                      child: Row(
                                        children: [
                                          RowWidget(
                                            value: provider
                                                .currentData[index].name!,
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
                                              value: provider.currentData[index]
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
      ),
    );
  }
}
