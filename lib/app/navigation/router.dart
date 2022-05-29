import 'package:artway_web/app/constant/color_constants.dart';
import 'package:artway_web/app/navigation/pages.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  late AppRouter instance;

  //Init Edilecek durumlar için burayı kullanabilirsiniz.
  AppRouter._();

  static GoRouter get router => AppRouter._router;

  //Cupertino Ekle
  static final GoRouter _router = GoRouter(
      initialLocation: ScreensPath.initialLocation,
      routes: [
        ScreensPath.goToHomeScreen(),
      ],
      errorPageBuilder: (context, error) => MaterialPage(
          key: error.pageKey,
          child: Scaffold(
            backgroundColor: backgroundColor,
            body: Center(
              child: Text(error.toString(), style: const TextStyle(color: blackColor)),
            ),
          )));
}
