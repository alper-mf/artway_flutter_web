import 'package:artway_web/app/constant/color_constants.dart';
import 'package:artway_web/app/init/size_config.dart';
import 'package:artway_web/app/layout/responsive_layout.dart';
import 'package:artway_web/app/widgets/app_bar/app_bar.dart';
import 'package:artway_web/app/widgets/slider/my_slider.dart';
import 'package:artway_web/features/screens/footer/footer_screen.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      desktop: Scaffold(
        body: NestedScrollView(
          floatHeaderSlivers: true,
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                snap: true,
                floating: true,
                elevation: 0,
                backgroundColor: defaultWhiteColor,
                forceElevated: innerBoxIsScrolled,
                flexibleSpace: const MyAppbar(),
              ),
            ];
          },
          body: CustomScrollView(
            physics: const NeverScrollableScrollPhysics(),
            slivers: [
              const SliverToBoxAdapter(child: MySlider()),
              SliverToBoxAdapter(
                  child: Container(
                height: SizeConfig.height,
                width: SizeConfig.width,
                color: Colors.red,
              )),
              const SliverToBoxAdapter(child: FooterScreen())
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
