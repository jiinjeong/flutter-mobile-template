/* ************************************************************************
 * FILE : main.dart
 * DESC : Starts and runs the app
 * ************************************************************************
 */

import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:package_info/package_info.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'global/globals.dart';
import 'global/theme.dart';
import 'utils/router.dart' as router;
import 'utils/navigation.dart';

// Main function
void main() async {
  
  // Theme navbar
  currentTheme.setNavbar();

  WidgetsFlutterBinding.ensureInitialized();

  // Sets default preferences
  prefs = await SharedPreferences.getInstance();
  if (!prefs.containsKey(CURRENT_THEME))
    await prefs.setString(CURRENT_THEME, SYSTEM);

  // Fetches version number
  packageInfo = await PackageInfo.fromPlatform();

  // For navigation outside widgets.
  setupLocator();

  // Gets system theme
  WidgetsFlutterBinding.ensureInitialized();
  await switchThemeMode(prefs.getString(CURRENT_THEME));

  runApp(MyApp());
}

// Builds app
class MyApp extends StatefulWidget {
  @override
  MyAppState createState() => new MyAppState();
}

class MyAppState extends State<MyApp> with WidgetsBindingObserver {

  // Set app theme on change
  @override
  void initState() {
    super.initState();
    // Listens for opening/closing
    WidgetsBinding.instance.addObserver(this);
    // Listens for theme changes from settings
    currentTheme.addListener(setMyState);
    // Theme navbar
    currentTheme.setNavbar();
  }

  @override
  void dispose() {
    super.dispose();
    currentTheme.removeListener(setMyState);
    WidgetsBinding.instance.removeObserver(this);
  }

  // Sets navbar theme on relaunch
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if(state == AppLifecycleState.resumed){
      currentTheme.setNavbar();
    }
  }

  // Sets system theme on change
  @override
  void didChangePlatformBrightness() {
    switchThemeMode(prefs.getString(CURRENT_THEME));
  }

  // Sets state on open/close
  void setMyState() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {

    // Sets the initial screen to either login or main, depending on
    // logged-in status.
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: locator<NavigationService>().navigatorKey,
      onGenerateRoute: router.generateRoute,
      initialRoute: '/home',
      theme: light,
      darkTheme: dark,
      themeMode: currentTheme.theme(),
    );
  }
}