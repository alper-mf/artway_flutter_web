import 'package:artway_web/features/screens/footer/controller/footer_controller.dart';
import 'package:artway_web/features/screens/footer/view/footer_view.dart';

import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class FooterScreen extends StatelessWidget {
  const FooterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: FooterContoller(),
      builder: (_) => const FooterView(),
    );
  }
}
