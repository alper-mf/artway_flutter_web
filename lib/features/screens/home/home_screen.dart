import 'package:artway_web/app/init/size_config.dart';
import 'package:artway_web/features/screens/home/controller/home_controller.dart';
import 'package:artway_web/features/screens/home/view/home_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return GetBuilder(
      init: HomeController(),
      builder: (_) => const HomeView(),
    );
  }
}
