/* ************************************************************************
 * FILE : template.dart
 * DESC : Main page.
 * ************************************************************************
 */

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../global/globals.dart';

// Homepage widget -- single use
class HomePage extends StatefulWidget {
  @override
  HomeState createState() => new HomeState();
}

// Dynamic data for widget
class HomeState extends State<HomePage> {
  @override
  void initState() {
    super.initState();

    // Navbar color
    currentTheme.registration = false;
    currentTheme.setNavbar();
  }

  @override
  Widget build(BuildContext context) {
    // Main widget
    return Scaffold(
      // The top app bar
      appBar: AppBar(
          title: Text("Example App ${packageInfo.version}"),
          actions: <Widget>[
            IconButton(
                icon: const Icon(Icons.more_vert),
                tooltip: 'Show user account',
                onPressed: () {})
          ]),

      body: Text('Hello'),
    );
  }
}
