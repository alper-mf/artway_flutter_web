import 'package:artway_web/app/constant/padding_and_radius_size.dart';
import 'package:artway_web/app/layout/responsive_layout.dart';
import 'package:artway_web/app/widgets/app_bar/app_bar.dart';
import 'package:artway_web/app/widgets/slider/my_slider.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ResponsiveLayout(
        desktop: Padding(
          padding: const EdgeInsets.only(left: paddingXXXXL, right: paddingXXXXL, top: paddingXL),
          child: Column(
            children: const [
              Flexible(flex: 1, child: MyAppbar()),
              SizedBox(height: paddingXXL),
              Flexible(flex: 8, child: MySlider()),
            ],
          ),
        ),
        tablet: Container(
          color: Colors.grey,
        ),
        mobile: Container(
          color: Colors.yellow,
        ),
      ),
    );
  }
}
