import 'package:artway_web/features/screens/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ScreensPath {
  static const String _initialLocation = _home;
  static const String _splash = '/splash';
  static const String _home = '/';

  static String get initialLocation => _initialLocation;
  static String get home => _home;
  static String get splash => _splash;

  static GoRoute goToHomeScreen() {
    return GoRoute(
        path: home,
        pageBuilder: (context, state) =>
            MaterialPage(key: state.pageKey, child: const HomeScreen()));
  }
}
