import 'package:artway_web/app/constant/color_constants.dart';
import 'package:artway_web/app/init/size_config.dart';
import 'package:flutter/material.dart';

class OurProjectTextStyle {
  OurProjectTextStyle._();

  static final TextStyle h1 = TextStyle(
      fontSize: SizeConfig.width * .03, color: textDarkTheme, fontWeight: FontWeight.w700);

  static final TextStyle normalTexts = TextStyle(
      fontSize: SizeConfig.width * .010, color: textDarkTheme, fontWeight: FontWeight.w200);

  static final TextStyle boldTexts = TextStyle(
      fontSize: SizeConfig.width * .013, color: textDarkTheme, fontWeight: FontWeight.w700);
}
