import 'package:artway_web/features/screens/our_projects/controller/our_project_controller.dart';
import 'package:artway_web/features/screens/our_projects/view/our_project_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class OurProjectScreen extends StatelessWidget {
  const OurProjectScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: OurProjectController(),
      builder: (_) => const OurProjectView(),
    );
  }
}
