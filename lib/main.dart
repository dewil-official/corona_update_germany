import 'package:corona_update_germany/screens/news_screen.dart';
import 'package:corona_update_germany/screens/settings_screen.dart';
import 'package:corona_update_germany/screens/stats_screen.dart';
import 'package:corona_update_germany/widgets/main_ui.dart';
import 'package:flutter/material.dart';

import 'globals/routes.dart';

void main() => runApp(CoronaApp());

class CoronaApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Corona Updates',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: MainUi(),
    );
  }
}
