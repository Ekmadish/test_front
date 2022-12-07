import 'package:flutter/material.dart';

class NavigationWidget extends StatefulWidget {
  final Function()? firstPressed;
  final Function()? previousPressed;
  final Function()? nextPressed;
  final Function()? lastPressed;
  final int initializeIndex;
  final Function(int?)? onperPageChanged;
  final List<int> availeblepage;
  final int pageCount;
  final void Function(int index)? toPage;
  final int pageIndex;

  const NavigationWidget({
    Key? key,
    required this.firstPressed,
    required this.lastPressed,
    required this.nextPressed,
    required this.previousPressed,
    required this.initializeIndex,
    required this.onperPageChanged,
    required this.availeblepage,
    required this.pageCount,
    required this.toPage,
    required this.pageIndex,
  }) : super(key: key);

  @override
  State<NavigationWidget> createState() => _NavigationWidgetState();
}

class _NavigationWidgetState extends State<NavigationWidget>
    with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      vsync: this,
      length: widget.pageCount,
    );
  }

  void _animateToIndex(int index) {
    _tabController.animateTo(index);
  }

  @override
  void didUpdateWidget(covariant NavigationWidget oldWidget) {
    _animateToIndex(widget.pageIndex);
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
      child: Container(
        height: 58,
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(border: Border.all(color: Colors.black12)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: SingleChildScrollView(
                primary: false,
                controller: null,
                padding: EdgeInsets.zero,
                physics: const NeverScrollableScrollPhysics(),
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    const SizedBox(
                      width: 100,
                    ),
                    IconButton(
                        onPressed: widget.firstPressed,
                        // !provider.canFirst()
                        //     ? null
                        //     : () {
                        //         provider.firstPage();
                        //       },
                        icon: const Icon(
                          Icons.first_page,
                          size: 18,
                        )),
                    IconButton(
                        onPressed: widget.previousPressed,
                        //  !provider.canPrevious()
                        //     ? null
                        //     : () {
                        //         provider.previousPage();
                        //       },
                        icon: const Icon(
                          Icons.chevron_left_sharp,
                          size: 18,
                        )),
                    Container(
                      margin: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey.shade300),
                        borderRadius: BorderRadius.circular(2),
                      ),
                      height: 58,
                      width: 200,
                      child: DefaultTabController(
                        animationDuration: Duration.zero,
                        length: widget.pageCount,
                        child: Builder(builder: (context) {
                          _tabController = DefaultTabController.of(context)!;
                          return TabBar(
                              controller: _tabController,
                              isScrollable: true,
                              tabs: List.generate(
                                widget.pageCount,
                                (index) => Container(
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    // color: widget.pageIndex == index
                                    //     ? Colors.green
                                    //     : Colors.amber[50],
                                    borderRadius: BorderRadius.circular(2),
                                  ),
                                  child: Text((index + 1).toString()),
                                ),
                              ),
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 4),
                              labelPadding:
                                  const EdgeInsets.symmetric(horizontal: 4),
                              indicatorSize: TabBarIndicatorSize.tab,
                              labelColor: Colors.black,
                              indicator: const BoxDecoration(
                                color: Colors.green,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(2)),
                              ),
                              onTap: (index) async {
                                widget.toPage!(index);
                              });
                        }),
                      ),
                    ),
                    IconButton(
                        onPressed: widget.nextPressed,

                        // !provider.canNext()
                        //     ? null
                        //     : () {
                        //         provider.nextPage();
                        //       },
                        icon: const Icon(
                          Icons.chevron_right_sharp,
                          size: 18,
                        )),
                    IconButton(
                        onPressed: widget.lastPressed,
                        // !provider.canLast()
                        //     ? null
                        //     : () {
                        //         provider.lastPage();
                        //       },
                        icon: const Icon(
                          Icons.last_page,
                          size: 18,
                        )),
                  ],
                ),
              ),
            ),
            MediaQuery.of(context).size.width < 700
                ? const SizedBox()
                : Container(
                    margin: const EdgeInsets.only(right: 20, top: 8, bottom: 8),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 13,
                    ),
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black26,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(2)),
                    child: DropdownButton<int>(
                      autofocus: false,
                      value: widget.initializeIndex, //provider.perPageRow,
                      icon: const Icon(Icons.arrow_drop_down_sharp),
                      elevation: 16,
                      underline: const SizedBox(),
                      onChanged: widget.onperPageChanged,

                      //  (newValue)
                      //  {
                      //   provider.setPerpage(newValue!);
                      // },
                      items: widget.availeblepage
                          .map<DropdownMenuItem<int>>((value) {
                        return DropdownMenuItem<int>(
                          value: value,
                          child: Text(value.toString()),
                        );
                      }).toList(),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
