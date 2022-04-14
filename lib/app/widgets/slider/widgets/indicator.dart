import 'package:artway_web/app/constant/padding_and_radius_size.dart';
import 'package:artway_web/app/theme/text_styles.dart/my_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class IndicatorTextButton extends StatelessWidget {
  final String index;
  final String title;
  final String subtitle;
  const IndicatorTextButton(
      {Key? key,
      required this.index,
      required this.subtitle,
      required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height,
      constraints: BoxConstraints(maxWidth: Get.width * .1),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            index.length < 2 ? '0' + index : index,
            style: mySliderh3.copyWith(color: Colors.black),
          ),
          const SizedBox(
            height: paddingM,
          ),
          Expanded(
            child: Text(
              title,
              style: mySliderh1.copyWith(color: Colors.black),
            ),
          ),
          Text(
            subtitle,
            style: mySliderh3.copyWith(
              color: Colors.black.withOpacity(0.5),
              fontWeight: FontWeight.w400,
              fontStyle: FontStyle.italic,
            ),
          ),
        ],
      ),
    );
  }
}
