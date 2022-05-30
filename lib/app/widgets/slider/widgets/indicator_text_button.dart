import 'package:artway_web/app/constant/padding_and_radius_size.dart';
import 'package:artway_web/app/theme/text_styles.dart/my_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class IndicatorTextButton extends StatelessWidget {
  final int index;
  final String title;
  final String subtitle;
  final bool isSelected;
  const IndicatorTextButton(
      {Key? key,
      required this.index,
      required this.subtitle,
      required this.title,
      required this.isSelected})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height,
      constraints: BoxConstraints(maxWidth: Get.width * .1),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            index.toString().length < 2 ? '0' + (index + 1).toString() : index.toString(),
            style: mySliderh3.copyWith(
              color: !isSelected ? Colors.black.withOpacity(0.3) : Colors.black,
            ),
          ),
          const SizedBox(
            height: paddingS,
          ),
          Expanded(
            child: Text(
              title,
              style: mySliderh1.copyWith(
                color: !isSelected ? Colors.black.withOpacity(0.3) : Colors.black,
                fontWeight: !isSelected ? FontWeight.w400 : FontWeight.w700,
              ),
            ),
          ),
          Expanded(
            child: Text(
              subtitle,
              style: mySliderh3.copyWith(
                color: !isSelected ? Colors.black.withOpacity(0.3) : Colors.black.withOpacity(0.5),
                fontWeight: !isSelected ? FontWeight.w400 : FontWeight.w700,
                fontStyle: FontStyle.italic,
              ),
            ),
          ),
          const SizedBox(height: paddingM)
        ],
      ),
    );
  }
}
