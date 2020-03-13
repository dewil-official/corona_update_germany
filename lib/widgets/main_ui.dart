import 'package:corona_update_germany/globals/routes.dart';
import 'package:corona_update_germany/screens/news_screen.dart';
import 'package:corona_update_germany/screens/settings_screen.dart';
import 'package:corona_update_germany/screens/stats_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'navbar.dart';

class MainUi extends StatelessWidget {
  final GlobalKey<NavigatorState> viewNavKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: EdgeInsets.fromLTRB(12, 12, 0, 12),
          child: SvgPicture.asset("assets/virus.svg"),
        ),
        title: Text("Corona Updates"),
      ),
      body: Navigator(
        key: viewNavKey,
        onGenerateRoute: _onGenerateRoute,
      ),
      bottomNavigationBar: Navbar(viewNavKey),
    );
  }

  Route<dynamic> _onGenerateRoute(RouteSettings settings) {
    WidgetBuilder builder;
    switch (settings.name) {
      case Routes.news:
        builder = (_) => NewsScreen();
        break;
      case Routes.stats:
        builder = (_) => StatsScreen();
        break;
      case Routes.settings:
        builder = (_) => SettingsScreen();
        break;
      default:
        builder = (_) => NewsScreen();
    }
    return MaterialPageRoute(builder: builder, settings: settings);
  }
}
