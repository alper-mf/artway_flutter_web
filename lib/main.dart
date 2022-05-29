import 'package:artway_web/app/navigation/router.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(GetMaterialApp.router(
    debugShowCheckedModeBanner: false,
    theme: ThemeData.light(),
    routeInformationParser: AppRouter.router.routeInformationParser,
    routerDelegate: AppRouter.router.routerDelegate,
  ));
}
