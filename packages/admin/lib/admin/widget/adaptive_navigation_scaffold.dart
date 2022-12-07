import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:global/global/config/router/route_state.dart';
import 'package:global/global/data/main_state.dart';
import 'package:global/global/data/provider/auth_provider.dart';
import 'package:global/global/widgets/responsive.dart';

class DrawerItem {
  final String title;
  final String svgSrc;
  final String routeName;
  final double index;

  final List<DrawerItemChild>? children;

  DrawerItem({
    required this.index,
    required this.title,
    required this.svgSrc,
    required this.routeName,
    required this.children,
  });
}

class DrawerItemChild {
  final String title;
  final String svgSrc;
  final String routeName;
  final double index;

  bool? isExpanded;

  DrawerItemChild(
      {required this.index,
      required this.title,
      required this.svgSrc,
      required this.routeName,
      this.isExpanded = false});
}

class NestedNavigationScaffold extends StatelessWidget {
  const NestedNavigationScaffold(
      {Key? key,
      this.appBar,
      required this.body,
      this.floatingActionButton,
      this.floatingActionButtonLocation,
      this.floatingActionButtonAnimator,
      this.persistentFooterButtons,
      this.bottomSheet,
      this.backgroundColor,
      this.resizeToAvoidBottomInset,
      this.drawerDragStartBehavior = DragStartBehavior.start,
      this.drawerScrimColor,
      this.drawerEdgeDragWidth,
      required this.destinations,
      required this.onDestinationSelected,
      required this.index,
      this.drawerHeader,
      required this.routerState})
      : super(key: key);
  final double index;

  final RouterState routerState;

  // final ValueChanged<int> selectindex;
  final PreferredSizeWidget? appBar;

  final Widget body;

  final FloatingActionButton? floatingActionButton;

  final FloatingActionButtonLocation? floatingActionButtonLocation;

  final FloatingActionButtonAnimator? floatingActionButtonAnimator;

  final List<Widget>? persistentFooterButtons;

  final Color? drawerScrimColor;

  final Color? backgroundColor;

  final Widget? bottomSheet;

  final bool? resizeToAvoidBottomInset;

  final DragStartBehavior drawerDragStartBehavior;

  final double? drawerEdgeDragWidth;

  // final int selectedIndex;

  final List<DrawerItem> destinations;

  final ValueChanged<String>? onDestinationSelected;

  final Widget? drawerHeader;

  @override
  Widget build(BuildContext context) {
    final AuthProvider authProvider = AuthProvider();
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (Responsive.isDesktop(context))
          Expanded(
            child: Drawer(
                // backgroundColor: Colors.black,
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                if (drawerHeader != null) drawerHeader!,
                Expanded(
                  child: ListView.builder(
                    itemCount: destinations.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return DrawerListTile(
                        key: key,
                        destination: destinations[index],
                        title: destinations[index].title,
                        svgSrc: "assets/icons/menu_dashbord.svg",
                        press: (routeName) {
                          onDestinationSelected!.call(routeName);
                        },
                        routerState: routerState,
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextButton.icon(
                      onPressed: () {
                        authProvider.logout();
                      },
                      icon: const Icon(Icons.logout),
                      label: const Text('Logout')),
                )
              ],
            )),
          ),
        const VerticalDivider(
          width: 1,
          thickness: 1,
          color: Colors.white10,
        ),
        Expanded(
          flex: 5,
          child: Scaffold(
            key: key,
            appBar: appBar,
            body: body,
            floatingActionButton: floatingActionButton,
            floatingActionButtonLocation: floatingActionButtonLocation,
            floatingActionButtonAnimator: floatingActionButtonAnimator,
            persistentFooterButtons: persistentFooterButtons,
            endDrawer: null,
            bottomSheet: bottomSheet,
            backgroundColor: backgroundColor,
            resizeToAvoidBottomInset: resizeToAvoidBottomInset,
            primary: true,
            drawerDragStartBehavior: drawerDragStartBehavior,
            extendBody: false,
            extendBodyBehindAppBar: false,
            drawerScrimColor: drawerScrimColor,
            drawerEdgeDragWidth: drawerEdgeDragWidth,
            drawerEnableOpenDragGesture: true,
            endDrawerEnableOpenDragGesture: true,
          ),
        ),
      ],
    );
  }
}

class DrawerListTile extends StatelessWidget {
  const DrawerListTile({
    Key? key,
    required this.title,
    required this.svgSrc,
    required this.press,
    required this.destination,
    required this.routerState,
    // required this.open,
  }) : super(key: key);
  final RouterState routerState;
  final DrawerItem destination;
  final String title, svgSrc;
  final ValueChanged<String> press;
  // final ValueNotifier<bool> open;

  @override
  Widget build(BuildContext context) {
    final MainState mainState = MainState();
    if (destination.children != null && destination.children!.isNotEmpty) {
      return ValueListenableBuilder<bool>(
        valueListenable: mainState.childDraweIsOpen,
        builder: (context, open, child) => ExpansionPanelList(
          dividerColor: Colors.transparent,
          expandedHeaderPadding: EdgeInsets.zero,
          elevation: 0,
          expansionCallback: (int index, bool isExpanded) {
            mainState.childDraweIsOpen.value = !open;
          },
          children: destination.children!.map<ExpansionPanel>((item) {
            return ExpansionPanel(
              backgroundColor: Colors.transparent,
              canTapOnHeader: false,
              headerBuilder: (BuildContext context, bool isExpanded) {
                return ListileWidget(
                  icon: null,
                  selected:
                      routerState.selectedNotifire.value == destination.index,
                  onTap: () {
                    press(destination.routeName);
                    routerState.selectedNotifire.value = destination.index;
                  },
                  title: title,
                );
              },
              body: ListileWidget(
                  icon: svgSrc,
                  selected: routerState.selectedNotifire.value == item.index,
                  title: item.title,
                  onTap: () {
                    press(item.routeName);
                    routerState.selectedNotifire.value = item.index;
                  }),
              isExpanded: open,
            );
          }).toList(),
        ),
      );
    }

    return ListileWidget(
      selected: routerState.selectedNotifire.value == destination.index,
      onTap: () {
        press(destination.routeName);
        routerState.selectedNotifire.value = destination.index;
      },
      icon: svgSrc,
      title: title,
    );
  }
}

class ListileWidget extends StatelessWidget {
  const ListileWidget(
      {Key? key,
      required this.onTap,
      required this.selected,
      this.icon,
      required this.title})
      : super(key: key);

  final String title;

  final String? icon;
  final bool selected;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      trailing: icon != null
          ? SvgPicture.asset(
              icon!,
              height: 16,
            )
          : null,
      autofocus: false,
      selectedTileColor: Colors.tealAccent,
      selected: selected,
      onTap: onTap,
      title: Text(title),
    );
  }
}
