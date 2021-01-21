/* ************************************************************************
 * FILE : router.dart
 * DESC : Defines routes for navigation
 * ************************************************************************
 */

import 'package:flutter/material.dart';

import '../screens/home.dart';

// Different named routes to aid in navigation
Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case '/home':
      return MaterialPageRoute(builder: (context) => HomePage());
      break;
    default:
      return null;
      break;
  }
}
