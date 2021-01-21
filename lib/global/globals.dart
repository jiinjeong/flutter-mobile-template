/* ************************************************************************
 * FILE : globals.dart
 * DESC : Stores global and constant values for the application. 
 * ************************************************************************
 */

import 'package:flutter/material.dart';
import 'package:package_info/package_info.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../global/theme.dart';

// Accessors
SharedPreferences prefs;
PackageInfo packageInfo;
CurrentTheme currentTheme = CurrentTheme();

// Constants
const PRIMARY_COLOR = Color(0xFF0c2771);
const SECONDARY_COLOR = Color(0xFFa6b4db);
const LIGHT = 'Light Mode';
const DARK = 'Dark Mode';
const SYSTEM = 'System';
const CURRENT_THEME = 'current_theme';

// Strings repreated in-app
const CLEAR = 'cls';
const DELETE = 'bkspc';