import 'package:artway_web/app/constant/color_constants.dart';
import 'package:artway_web/app/init/size_config.dart';
import 'package:flutter/material.dart';

class FooterTextStyle {
  FooterTextStyle._();

  static final TextStyle normalTexts = TextStyle(
      fontSize: SizeConfig.width * .010, color: textFirstColor, fontWeight: FontWeight.w200);

  static final TextStyle boldTexts = TextStyle(
      fontSize: SizeConfig.width * .013, color: textFirstColor, fontWeight: FontWeight.w400);
}
