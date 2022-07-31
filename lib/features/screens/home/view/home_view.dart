import 'package:artway_web/app/constant/color_constants.dart';
import 'package:artway_web/app/constant/padding_and_radius_size.dart';
import 'package:artway_web/app/init/size_config.dart';
import 'package:artway_web/app/layout/responsive_layout.dart';
import 'package:artway_web/app/widgets/app_bar/app_bar.dart';
import 'package:artway_web/app/widgets/slider/my_slider.dart';
import 'package:artway_web/features/screens/footer/footer_screen.dart';
import 'package:artway_web/features/screens/home/controller/home_controller.dart';
import 'package:artway_web/features/screens/our_projects/our_project_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      desktop: Scaffold(
        body: Obx(
          () => Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              AnimatedContainer(
                duration: const Duration(milliseconds: 100),
                height: controller.showAppbar.value ? SizeConfig.height * .08 : 0,
                child: Padding(
                  padding:
                      EdgeInsets.fromLTRB(SizeConfig.width * .03, 0, SizeConfig.width * .03, 0),
                  child: const MyAppbar(),
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  controller: controller.scrollViewController,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: const [
                      MySlider(),
                      OurProjectScreen(),
                      FooterScreen(),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      tablet: Container(
        color: Colors.grey,
      ),
      mobile: Container(
        color: Colors.yellow,
      ),
    );
  }
}
