import 'package:artway_web/app/layout/responsive_layout.dart';
import 'package:artway_web/app/widgets/app_bar/app_bar.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ResponsiveLayout(
        desktop: Padding(
          padding: const EdgeInsets.only(left: 40, right: 40),
          child: Column(
            children: const [
              MyAppbar(),
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
