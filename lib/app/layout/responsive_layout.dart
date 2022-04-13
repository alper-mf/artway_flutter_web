import 'package:artway_web/app/enums/responsive_sizes_enum.dart';
import 'package:flutter/material.dart';

class ResponsiveLayout extends StatelessWidget {
  final Widget mobile;
  final Widget tablet;
  final Widget desktop;
  const ResponsiveLayout(
      {Key? key,
      required this.mobile,
      required this.tablet,
      required this.desktop})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: ((context, constraints) {
        if (constraints.maxWidth < 650) {
          ResponsiveSizeIs.mobile;
          return mobile;
        } else if (constraints.maxWidth < 1100 && constraints.maxWidth >= 650) {
          ResponsiveSizeIs.tablet;
          return tablet;
        } else {
          ResponsiveSizeIs.desktop;
          return desktop;
        }
      }),
    );
  }
}
