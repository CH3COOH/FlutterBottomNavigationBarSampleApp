import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'ScaffoldWithNavBarTabItem.dart';

class ScaffoldWithBottomNavBar extends StatefulWidget {
  const ScaffoldWithBottomNavBar({Key? key, required this.child})
      : super(key: key);
  final Widget child;

  @override
  State<ScaffoldWithBottomNavBar> createState() =>
      _ScaffoldWithBottomNavBarState();
}

class _ScaffoldWithBottomNavBarState extends State<ScaffoldWithBottomNavBar> {
  late final List<ScaffoldWithNavBarTabItem> tabs;

  @override
  void initState() {
    super.initState();

    tabs = [
      const ScaffoldWithNavBarTabItem(
        initialLocation: '/home/tab1',
        icon: Icon(Icons.home_filled),
        label: "タブ1",
      ),
      const ScaffoldWithNavBarTabItem(
        initialLocation: '/home/tab2',
        icon: Icon(Icons.search_sharp),
        label: "タブ2",
      ),
    ];
  }

  // getter that computes the current index from the current location,
  // using the helper method below
  int get _currentIndex => _locationToTabIndex(GoRouter.of(context).location);

  int _locationToTabIndex(String location) {
    final index =
        tabs.indexWhere((t) => location.startsWith(t.initialLocation));
    // if index not found (-1), return 0
    return index < 0 ? 0 : index;
  }

  // callback used to navigate to the desired tab
  void _onItemTapped(BuildContext context, int tabIndex) {
    if (tabIndex != _currentIndex) {
      // go to the initial location of the selected tab (by index)
      context.go(tabs[tabIndex].initialLocation);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.child,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        items: tabs,
        type: BottomNavigationBarType.fixed,
        onTap: (index) => _onItemTapped(context, index),
      ),
    );
  }
}
