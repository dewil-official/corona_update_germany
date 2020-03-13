import 'package:corona_update_germany/globals/routes.dart';
import 'package:flutter/material.dart';

List<_NavbarItem> _navbarItems = [
  _NavbarItem(
    iconData: Icons.rss_feed,
    title: 'News',
    route: Routes.news,
  ),
  _NavbarItem(
    iconData: Icons.graphic_eq,
    title: 'Statistiken',
    route: Routes.stats,
  ),
  _NavbarItem(
    iconData: Icons.settings,
    title: 'Einstellungen',
    route: Routes.settings,
  ),
];

class Navbar extends StatefulWidget {
  final GlobalKey<NavigatorState> navKey;

  Navbar(this.navKey);

  @override
  _NavbarState createState() => _NavbarState(navKey);
}

class _NavbarState extends State<Navbar> {
  final GlobalKey<NavigatorState> navKey;
  int pos = 0;

  _NavbarState(this.navKey);

  void pushView(String routeName) {
    navKey.currentState.pushReplacementNamed(routeName);
  }

  void setItem(int _pos) {
    setState(() {
      pos = _pos;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: pos,
      items: _navbarItems.map((item) {
        return BottomNavigationBarItem(
            icon: Icon(item.iconData), title: Text(item.title));
      }).toList(),
      onTap: (int index) {
        if (index != pos) {
          pushView(_navbarItems[index].route);
          setState(() {
            pos = index;
          });
        }
      },
    );
  }
}

class _NavbarItem {
  String title;
  IconData iconData;
  String route;

  _NavbarItem({
    @required this.title,
    @required this.iconData,
    @required this.route,
  });
}
