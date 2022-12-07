import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:localization/localization.dart';
import 'package:tasu/client/constant/client_constant.dart';
import 'package:tasu/global/utils/app_scroll_behavior.dart';
import 'package:tasu/global/utils/utils.dart';
import 'package:tasu/global/widgets/lan_dropdwon_widget.dart';
import 'package:tasu/main.dart';
import 'futures/futures.dart';
export 'package:tasu/client/futures/futures.dart';

class MainScreen extends StatefulWidget {
  final String kind;
  final String tab;
  // ignore: prefer_const_constructors_in_immutables
  MainScreen({
    Key? key,
    required this.kind,
    required this.tab,
  }) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen>
    with SingleTickerProviderStateMixin {
  late NoAnimationTabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = NoAnimationTabController(
      length: ClientConstant.tabDestination.length,
      vsync: this,
      initialIndex: ClientConstant.tabDestination
          .indexWhere((e) => e.routepath == widget.kind),
    );
  }

  @override
  void didUpdateWidget(MainScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    _tabController.index = ClientConstant.tabDestination
        .indexWhere((e) => e.routepath == widget.kind);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  Color _getColors(String s) {
    var i = ClientConstant.tabDestination.singleWhere((e) => e.routepath == s);
    return i.color;
  }

  @override
  Widget build(BuildContext context) {
    var scaffoldKey = GlobalKey<ScaffoldState>();
    var size = MediaQuery.of(context).size;

    return ScrollConfiguration(
      behavior: AppScrollBehavior(),
      child: Scaffold(
        backgroundColor: const Color(0xff202223),
        endDrawer: Drawer(
          child: Container(
            width: 120,
            color: Colors.amber,
          ),
        ),
        key: scaffoldKey,
        appBar: AppBar(
          titleSpacing: 0,
          toolbarHeight: 37,
          automaticallyImplyLeading: false,
          backgroundColor: const Color(0xff1f2528),
          actions: [
            const LanDropdwonButton(),
            _padding(),
            IntrinsicWidth(
                child: InkWell(
              onTap: () {
                showGeneralDialog(
                  context: context,
                  barrierColor: Colors.black54,
                  barrierDismissible: true,
                  barrierLabel: 'Label',
                  pageBuilder: (_, __, ___) {
                    return Align(
                      alignment: Alignment.topRight,
                      child: Container(
                        margin: const EdgeInsets.only(right: 40, top: 40),
                        color: Colors.blue,
                        child: const FlutterLogo(size: 150),
                      ),
                    );
                  },
                );
              },
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 2),
                decoration: BoxDecoration(
                    color: Colors.black45,
                    borderRadius: BorderRadius.circular(2),
                    border: Border.all(
                      color: Colors.black26,
                    )),
                child: Row(
                  children: const [
                    Text('New massage'),
                    CircleAvatar(
                      child: Text(
                        '4',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
              ),
            )),
            _padding(),
            IconButton(
                onPressed: () {
                  scaffoldKey.currentState!.openEndDrawer();
                },
                icon: const Icon(Icons.question_mark)),
            _padding(),
            IconButton(onPressed: () {}, icon: const Icon(Icons.file_present)),
            IconButton(
                onPressed: () async {
                  // getIt<MainState>().logout();

                  mainState.logout();
                },
                icon: const Icon(Icons.logout))
          ],
          bottom: null,
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          physics: const ClampingScrollPhysics(),
          padding: EdgeInsets.zero,
          child: SizedBox(
            height: size.height,
            width: size.width < 1200 ? 1200 : size.width,
            child: ListView(
              shrinkWrap: true,
              physics: const ClampingScrollPhysics(),
              padding: const EdgeInsets.only(bottom: 100),
              children: [
                Container(
                  margin: EdgeInsets.zero,
                  padding: EdgeInsets.zero,
                  decoration: BoxDecoration(
                      color: _getColors(ClientConstant.tabDestination
                          .singleWhere((e) => e.routepath == widget.kind)
                          .routepath)),
                  child: TabBar(
                      // mouseCursor: MouseCursor.defer,
                      controller: _tabController,
                      onTap: _handleTabTapped,
                      indicator: const BoxDecoration(
                        border: Border.symmetric(
                            vertical: BorderSide.none,
                            horizontal: BorderSide.none),
                      ),
                      padding: EdgeInsets.zero,
                      labelPadding: EdgeInsets.zero,
                      indicatorPadding: EdgeInsets.zero,
                      tabs: ClientConstant.tabDestination
                          .map(
                            (e) => Container(
                              decoration: BoxDecoration(
                                color: _tabController.index == e.id - 1
                                    ? e.color
                                    : const Color(0xff272b2d),
                                border: const Border.symmetric(
                                  vertical: BorderSide(
                                    color: Color(0xff7e7567),
                                  ),
                                  horizontal: BorderSide.none,
                                ),
                              ),
                              height: 77,
                              padding: EdgeInsets.zero,
                              margin: EdgeInsets.zero,
                              child: Column(
                                children: [
                                  const Spacer(),
                                  Icon(
                                    e.icon,
                                    color: _tabController.index != e.id - 1
                                        ? e.color
                                        : Colors.white,
                                  ),
                                  const Padding(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 3)),
                                  AnimatedSwitcher(
                                    duration: const Duration(milliseconds: 500),
                                    child: Text(
                                      e.routeName.i18n(),
                                      key: ValueKey(e.routeName),
                                      style:
                                          const TextStyle(color: Colors.white),
                                    ),
                                    transitionBuilder: (Widget child,
                                        Animation<double> animation) {
                                      return FadeTransition(
                                        opacity:
                                            Tween<double>(begin: 0.0, end: 1.0)
                                                .animate(
                                          CurvedAnimation(
                                            parent: animation,
                                            curve: const Interval(0.5, 1.0),
                                          ),
                                        ),
                                        child: child,
                                      );
                                    },
                                  ),
                                  const Spacer(),
                                  Container(
                                    decoration: BoxDecoration(color: e.color),
                                    height: 5,
                                    padding: EdgeInsets.zero,
                                    margin: EdgeInsets.zero,
                                  ),
                                ],
                              ),
                            ),
                          )
                          .toList()),
                ),
                SizedBox(
                  height: size.height,
                  width: size.width,
                  child: TabBarView(
                      dragStartBehavior: DragStartBehavior.start,
                      controller: _tabController,
                      physics: const NeverScrollableScrollPhysics(),
                      key: const ValueKey('htview'),
                      children: ClientConstant.tabDestination.map((e) {
                        switch (e.routepath) {
                          case 'request':
                            return RequestScreen(
                              colors: e.color,
                            );
                            break;
                          case 'orders':
                            return OrdersScreen(
                              colors: e.color,
                            );

                            break;
                          case 'finance':
                            return FinanceScreen(
                              colors: e.color,
                            );

                            break;
                          case 'clients':
                            return ClientsScreen(
                              colors: e.color,
                            );

                            break;
                          case 'carries':
                            return CarriersScreen(
                              colors: e.color,
                            );

                            break;
                          case 'reports':
                            return ReportsScreen(
                              colors: e.color,
                            );

                            break;
                          case 'documents':
                            return DocumentsScreen(
                              colors: e.color,
                            );

                            break;
                          case 'calendar':
                            return CalendarScreen(
                              colors: e.color,
                            );

                            break;
                          case 'task':
                            return TasksScreen(
                              colors: e.color,
                            );
                            break;
                          default:
                            return SettingsScreen(
                              colors: e.color,
                              routerName: widget.tab,
                            );
                        }
                      }).toList()),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _handleTabTapped(int index) {
    context.go('/tasu/${ClientConstant.tabDestination[index].routepath}');
  }

  Padding _padding() =>
      const Padding(padding: EdgeInsets.symmetric(horizontal: 2));
}
