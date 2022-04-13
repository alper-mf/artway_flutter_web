import 'package:artway_web/app/constant/app_bar_const.dart';
import 'package:artway_web/app/constant/padding_and_radius_size.dart';
import 'package:artway_web/app/widgets/buttons/hover_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyAppbar extends StatelessWidget {
  final VoidCallback? onTap;
  const MyAppbar({Key? key, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Get.height * .12,
      width: Get.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Flexible(child: Text(appBarTitle)),
          Flexible(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(width: paddingXXXL),
              Flexible(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: appbarList.map((e) {
                  return HoverButton(
                    text: e,
                    isSelected: false,
                  );
                }).toList(),
              )),
              const SizedBox(width: paddingXXXXL),
              IconButton(
                  splashRadius: 1,
                  onPressed: () => onTap,
                  icon: const Icon(
                    Icons.apps,
                    size: sizeL,
                  ))
            ],
          )),
        ],
      ),
    );
  }
}
