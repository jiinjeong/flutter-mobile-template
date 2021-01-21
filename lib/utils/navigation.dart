/* ************************************************************************
 * FILE : navigation.dart
 * DESC : Assists with navigation between pages.
 * ************************************************************************
 */

import 'package:get_it/get_it.dart';
import 'package:flutter/material.dart';

// Set up location package
GetIt locator = GetIt.instance;
void setupLocator() {
  locator.registerLazySingleton(() => NavigationService());
}

// Service used to move to new pages
class NavigationService {
  final GlobalKey<NavigatorState> navigatorKey =
      new GlobalKey<NavigatorState>();

  // Adds named page to top of stack
  Future<dynamic> pushNamed(String routeName) {
    return navigatorKey.currentState.pushNamed(routeName);
  }

  // Adds named page + parameters to top of stack
  Future<dynamic> pushNamedWithParameters(String routeName, var passedArgument) {
    return navigatorKey.currentState
        .pushNamed(routeName, arguments: passedArgument);
  }

  // Adds named page + key to top of stack
  Future<dynamic> pushNamedWithKey(String routeName, Key key) {
    return navigatorKey.currentState.pushNamed(routeName, arguments: key);
  }

  // Clears stack and adds named page to top
  Future<dynamic> popAllPushNamed(String routeName) {
    return navigatorKey.currentState
      .pushNamedAndRemoveUntil(routeName, (Route<dynamic> route) => false);
  }

  // Pops all pages from stack until home
  Future<dynamic> popUntilHome() {
    navigatorKey.currentState.popUntil((route) => route.isFirst);
    return null;
  }

  // Pops one or more pages
  Future<dynamic> pop({int num = 1, dynamic result}) {

    // Pops as many times as specified (default 1)
    for (int i = 0; i < num - 1; i++)
      navigatorKey.currentState.pop();

    // Sends result
    result == null
      ? navigatorKey.currentState.pop()
      : navigatorKey.currentState.pop(result);
    return null;
  }
}