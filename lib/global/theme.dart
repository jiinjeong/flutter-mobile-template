/* ************************************************************************
 * FILE : theme.dart
 * DESC : Stores the light and dark theme colors, fonts, etc.. 
 * ************************************************************************
 */

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'globals.dart';

// Current app theme (light or dark)
class CurrentTheme with ChangeNotifier {

  bool registration = true;
  bool gallery = false;

  // Stores static dark mode value
  static bool darkModeEnabled = false;
  get isDarkModeEnabled {
    return darkModeEnabled;
  }

  // Returns current theme
  ThemeMode theme() {
    return darkModeEnabled ? ThemeMode.dark : ThemeMode.light;
  }

  // Sets navbar theme
  void setNavbar() {

    darkModeEnabled
      ? SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          systemNavigationBarColor: Color(0xFF121212),
          systemNavigationBarIconBrightness: Brightness.light
        )
      )
      : SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          systemNavigationBarColor: Color(0xFFFAFAFA),
          systemNavigationBarIconBrightness: Brightness.dark
        )
      );
  }

  // Switches theme
  void switchTheme() {
    
    // Stes navbar color
    setNavbar();

    // Informs home to update theme
    notifyListeners();
  }

  // Switches theme to dark
  void enableDark() {
    darkModeEnabled = true;
    setNavbar();

    // Informs home to update theme
    notifyListeners();
  }

  // Switches theme to dark
  void enableLight() {
    darkModeEnabled = false;
    setNavbar();

    // Informs home to update theme
    notifyListeners();
  }
}

// Used to switch themes
Future<void> switchThemeMode(String name) async {
  switch(name) {

    // Switches theme to light
    case LIGHT:
      await prefs.setString(CURRENT_THEME, LIGHT);
      if (currentTheme.isDarkModeEnabled) currentTheme.enableLight();
      break;

    // Switches theme to dark
    case DARK:
      await prefs.setString(CURRENT_THEME, DARK);
      if (!currentTheme.isDarkModeEnabled) currentTheme.enableDark();
      break;

    // Switches theme to system
    default:
      await prefs.setString(CURRENT_THEME, SYSTEM);
      if (WidgetsBinding.instance.window.platformBrightness == Brightness.dark)
        currentTheme.enableDark();
      else
        currentTheme.enableLight();
      break;
  }
}

// Light theme
ThemeData light = ThemeData(
  primaryColor: PRIMARY_COLOR,
  accentColor: SECONDARY_COLOR,
  dividerColor: Colors.grey[50],
  brightness: Brightness.light,
  backgroundColor: const Color(0xFFE5E5E5),
  textSelectionColor: Color(0x212121).withOpacity(0.3),
  textSelectionHandleColor: Color(0xFFd6ba8b),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: PRIMARY_COLOR, foregroundColor: Colors.white),
  inputDecorationTheme: InputDecorationTheme(
    contentPadding: EdgeInsets.all(15.0),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(
        width: 0,
        style: BorderStyle.none,
      ),
    ),
    filled: true,
    fillColor: Colors.grey[200],
  ),
  cardColor: Colors.white,
  dialogTheme: DialogTheme(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    )
  ),
  indicatorColor: PRIMARY_COLOR,
);

// Dark theme
ThemeData dark = ThemeData(
  primaryColor: PRIMARY_COLOR,
  accentColor: Colors.white,
  dividerColor: const Color(0xFF121212),
  scaffoldBackgroundColor: const Color(0xFF121212),
  brightness: Brightness.dark,
  backgroundColor: const Color(0xFFE5E5E5),
  canvasColor: Colors.grey[900],
  textSelectionColor: Color(0x212121).withOpacity(0.3),
  textSelectionHandleColor: Color(0xFFd6ba8b),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: PRIMARY_COLOR, foregroundColor: Colors.white),
  inputDecorationTheme: InputDecorationTheme(
    contentPadding: EdgeInsets.all(15.0),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(
        width: 0,
        style: BorderStyle.none,
      ),
    ),
    filled: true,
    fillColor: Colors.grey[900],
  ),
  bottomNavigationBarTheme:
      BottomNavigationBarThemeData(backgroundColor: Color(0xFF121212)),
  cardColor: const Color(0xFF121212),
  dialogTheme: DialogTheme(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
    backgroundColor: Colors.grey[900]
  ),
  indicatorColor: Colors.white
);