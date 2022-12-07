import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
// import 'package:get_it/get_it.dart';
import 'package:localization/localization.dart';
import 'dart:math' as math;

import 'package:tasu/admin/view/widget/window_type_widget.dart';
import 'package:tasu/global/data/app_state.dart';
import 'package:tasu/global/widgets/tr_widget.dart';
import 'package:tasu/main.dart';

typedef NavigationTypeResolver = NavigationType Function(BuildContext context);

enum NavigationType {
  bottom,

  rail,

  drawer,

  permanentDrawer,
}

class AdaptiveScaffoldDestination {
  final String title;
  final IconData icon;
  final String routeName;
  const AdaptiveScaffoldDestination({
    required this.title,
    required this.icon,
    required this.routeName,
  });
}

class AdaptiveNavigationScaffold extends StatelessWidget {
  const AdaptiveNavigationScaffold({
    Key? key,
    this.appBar,
    required this.body,
    this.floatingActionButton,
    this.floatingActionButtonLocation,
    this.floatingActionButtonAnimator,
    this.persistentFooterButtons,
    this.endDrawer,
    this.bottomSheet,
    this.backgroundColor,
    this.resizeToAvoidBottomInset,
    this.primary = true,
    this.drawerDragStartBehavior = DragStartBehavior.start,
    this.extendBody = false,
    this.extendBodyBehindAppBar = false,
    this.drawerScrimColor,
    this.drawerEdgeDragWidth,
    this.drawerEnableOpenDragGesture = true,
    this.endDrawerEnableOpenDragGesture = true,
    required this.selectedIndex,
    required this.destinations,
    this.onDestinationSelected,
    this.navigationTypeResolver,
    this.drawerHeader,
    this.fabInRail = true,
    this.includeBaseDestinationsInMenu = true,
    this.bottomNavigationOverflow = 5,
  }) : super(key: key);

  final PreferredSizeWidget? appBar;

  final Widget body;

  final FloatingActionButton? floatingActionButton;

  final FloatingActionButtonLocation? floatingActionButtonLocation;

  final FloatingActionButtonAnimator? floatingActionButtonAnimator;

  final List<Widget>? persistentFooterButtons;

  final Widget? endDrawer;

  final Color? drawerScrimColor;

  final Color? backgroundColor;

  final Widget? bottomSheet;

  final bool? resizeToAvoidBottomInset;

  final bool primary;

  final DragStartBehavior drawerDragStartBehavior;

  final bool extendBody;

  final bool extendBodyBehindAppBar;

  final double? drawerEdgeDragWidth;

  final bool drawerEnableOpenDragGesture;

  final bool endDrawerEnableOpenDragGesture;

  final int selectedIndex;

  final List<AdaptiveScaffoldDestination> destinations;

  final ValueChanged<int>? onDestinationSelected;

  final NavigationTypeResolver? navigationTypeResolver;

  final Widget? drawerHeader;

  final bool fabInRail;

  final bool includeBaseDestinationsInMenu;

  final int bottomNavigationOverflow;

  NavigationType _defaultNavigationTypeResolver(BuildContext context) {
    if (_isLargeScreen(context)) {
      return NavigationType.permanentDrawer;
    } else if (_isMediumScreen(context)) {
      return NavigationType.rail;
    } else {
      return NavigationType.bottom;
    }
  }

  Drawer _defaultDrawer(List<AdaptiveScaffoldDestination> destinations) {
    return Drawer(
      child: ListView(
          shrinkWrap: true,
          children: destinations
              .map((e) => ListTile(
                    leading: Icon(e.icon),
                    title: TrWidget(
                      alignment: Alignment.centerLeft,
                      trkey: e.title,
                    ),
                    onTap: () {
                      onDestinationSelected?.call(destinations.indexOf(e));
                    },
                  ))
              .toList()),
    );
  }

  Widget _buildBottomNavigationScaffold() {
    final bottomDestinations = destinations.sublist(
      0,
      math.min(destinations.length, bottomNavigationOverflow),
    );
    final drawerDestinations = destinations.length > bottomNavigationOverflow
        ? destinations.sublist(
            includeBaseDestinationsInMenu ? 0 : bottomNavigationOverflow)
        : <AdaptiveScaffoldDestination>[];
    return Scaffold(
      key: key,
      body: body,
      appBar: appBar,
      drawer: drawerDestinations.isEmpty
          ? null
          : _defaultDrawer(drawerDestinations),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          for (final destination in bottomDestinations)
            BottomNavigationBarItem(
              icon: Icon(destination.icon),
              label: destination.title.i18n(),
            ),
        ],
        currentIndex: selectedIndex,
        onTap: onDestinationSelected ?? (_) {},
        type: BottomNavigationBarType.fixed,
      ),
      floatingActionButton: floatingActionButton,
    );
  }

  Widget _buildNavigationRailScaffold() {
    const int railDestinationsOverflow = 7;
    final railDestinations = destinations.sublist(
      0,
      math.min(destinations.length, railDestinationsOverflow),
    );
    final drawerDestinations = destinations.length > railDestinationsOverflow
        ? destinations.sublist(
            includeBaseDestinationsInMenu ? 0 : railDestinationsOverflow)
        : <AdaptiveScaffoldDestination>[];
    return Scaffold(
      key: key,
      appBar: appBar,
      drawer: drawerDestinations.isEmpty
          ? null
          : _defaultDrawer(drawerDestinations),
      body: Row(
        children: [
          NavigationRail(
            leading: fabInRail ? floatingActionButton : null,
            destinations: railDestinations
                .map((e) => NavigationRailDestination(
                      icon: Icon(e.icon),
                      label: TrWidget(
                          alignment: Alignment.centerLeft, trkey: e.title),
                    ))
                .toList(),
            selectedIndex: selectedIndex,
            onDestinationSelected: onDestinationSelected ?? (_) {},
          ),
          const VerticalDivider(
            width: 1,
            thickness: 1,
          ),
          Expanded(
            child: body,
          ),
        ],
      ),
      floatingActionButton: fabInRail ? null : floatingActionButton,
      floatingActionButtonLocation: floatingActionButtonLocation,
      floatingActionButtonAnimator: floatingActionButtonAnimator,
      persistentFooterButtons: persistentFooterButtons,
      endDrawer: endDrawer,
      bottomSheet: bottomSheet,
      backgroundColor: backgroundColor,
      resizeToAvoidBottomInset: resizeToAvoidBottomInset,
      primary: true,
      drawerDragStartBehavior: drawerDragStartBehavior,
      extendBody: extendBody,
      extendBodyBehindAppBar: extendBodyBehindAppBar,
      drawerScrimColor: drawerScrimColor,
      drawerEdgeDragWidth: drawerEdgeDragWidth,
      drawerEnableOpenDragGesture: drawerEnableOpenDragGesture,
      endDrawerEnableOpenDragGesture: endDrawerEnableOpenDragGesture,
    );
  }

  Widget _buildNavigationDrawerScaffold() {
    return Scaffold(
      key: key,
      body: body,
      appBar: appBar,
      drawer: Drawer(
        child: ListView(
          shrinkWrap: true,
          children: [
            if (drawerHeader != null) drawerHeader!,
            for (final destination in destinations)
              ListTile(
                leading: Icon(destination.icon),
                title: TrWidget(
                    alignment: Alignment.centerLeft, trkey: destination.title),
                selected: destinations.indexOf(destination) == selectedIndex,
                onTap: () => _destinationTapped(destination),
              ),
          ],
        ),
      ),
      floatingActionButton: floatingActionButton,
      floatingActionButtonLocation: floatingActionButtonLocation,
      floatingActionButtonAnimator: floatingActionButtonAnimator,
      persistentFooterButtons: persistentFooterButtons,
      endDrawer: endDrawer,
      bottomSheet: bottomSheet,
      backgroundColor: backgroundColor,
      resizeToAvoidBottomInset: resizeToAvoidBottomInset,
      primary: true,
      drawerDragStartBehavior: drawerDragStartBehavior,
      extendBody: extendBody,
      extendBodyBehindAppBar: extendBodyBehindAppBar,
      drawerScrimColor: drawerScrimColor,
      drawerEdgeDragWidth: drawerEdgeDragWidth,
      drawerEnableOpenDragGesture: drawerEnableOpenDragGesture,
      endDrawerEnableOpenDragGesture: endDrawerEnableOpenDragGesture,
    );
  }

  Widget _buildPermanentDrawerScaffold() {
    return Row(
      children: [
        Expanded(
          child: Drawer(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: ListView(
                    shrinkWrap: true,
                    children: [
                      if (drawerHeader != null) drawerHeader!,
                      for (final destination in destinations)
                        ListTile(
                          selectedTileColor: const Color(0xfff0f0f0),
                          leading: Icon(destination.icon),
                          title: TrWidget(
                              alignment: Alignment.centerLeft,
                              trkey: destination.title),
                          selected: destinations.indexOf(destination) ==
                              selectedIndex,
                          onTap: () => _destinationTapped(destination),
                        ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextButton.icon(
                      onPressed: () async {
                        // GetIt.I.get(MainState());
                        //  var mainState = getIt<MainState>().logout();
                        mainState.logout();
                        // await authProviderAdmin.logout();
                        // authProviderAdmin.setAuthState(false);
                      },
                      icon: const Icon(Icons.logout),
                      label:
                          // ignore: prefer_const_constructors
                          TrWidget(
                              alignment: Alignment.centerLeft,
                              trkey: 'l_Logout') //Text('l_Logout'.i18n()),

                      ),
                )
              ],
            ),

            //     ListView.builder(
            //   shrinkWrap: true,
            //   itemCount: destinations.length,
            //   itemBuilder: (context, index) {
            //     if (index == 0) {
            //       return drawerHeader != null ? drawerHeader! : const SizedBox();
            //     }
            //     return ListTile(
            //       leading: Icon(destinations[index].icon),
            //       title: TrWidget(alignment: Alignment.centerLeft,trkey: destinations[index].title),
            //       selected:
            //           destinations.indexOf(destinations[index]) == selectedIndex,
            //       onTap: () => _destinationTapped(destinations[index]),
            //     );
            //   },
            // )
          ),
        ),
        const VerticalDivider(
          width: 1,
          thickness: 1,
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
            endDrawer: endDrawer,
            bottomSheet: bottomSheet,
            backgroundColor: backgroundColor,
            resizeToAvoidBottomInset: resizeToAvoidBottomInset,
            primary: true,
            drawerDragStartBehavior: drawerDragStartBehavior,
            extendBody: extendBody,
            extendBodyBehindAppBar: extendBodyBehindAppBar,
            drawerScrimColor: drawerScrimColor,
            drawerEdgeDragWidth: drawerEdgeDragWidth,
            drawerEnableOpenDragGesture: drawerEnableOpenDragGesture,
            endDrawerEnableOpenDragGesture: endDrawerEnableOpenDragGesture,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final NavigationTypeResolver navigationTypeResolver =
        this.navigationTypeResolver ?? _defaultNavigationTypeResolver;
    final navigationType = navigationTypeResolver(context);
    switch (navigationType) {
      case NavigationType.bottom:
        return _buildBottomNavigationScaffold();
      case NavigationType.rail:
        return _buildNavigationRailScaffold();
      case NavigationType.drawer:
        return _buildNavigationDrawerScaffold();
      case NavigationType.permanentDrawer:
        return _buildPermanentDrawerScaffold();
    }
  }

  void _destinationTapped(AdaptiveScaffoldDestination destination) {
    final index = destinations.indexOf(destination);
    if (index != selectedIndex) {
      onDestinationSelected?.call(index);
    }
  }
}

bool _isLargeScreen(BuildContext context) =>
    getWindowType(context) >= AdaptiveWindowType.large;
bool _isMediumScreen(BuildContext context) =>
    getWindowType(context) == AdaptiveWindowType.medium;
