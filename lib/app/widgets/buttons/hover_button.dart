import 'package:artway_web/app/constant/app_constants.dart';
import 'package:artway_web/app/constant/color_constants.dart';
import 'package:artway_web/app/constant/padding_and_radius_size.dart';
import 'package:flutter/material.dart';

class HoverButton extends StatefulWidget {
  final String? text;
  final bool? isSelected;
  const HoverButton({Key? key, this.text, this.isSelected}) : super(key: key);

  @override
  State<HoverButton> createState() => _HoverButtonState();
}

bool isHover = false;

class _HoverButtonState extends State<HoverButton> {
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (f) {
        setState(() {
          isHover = true;
        });
      },
      onExit: (f) {
        setState(() {
          isHover = false;
        });
      },
      child: SizedBox(
        height: MediaQuery.of(context).size.height * .05,
        width: MediaQuery.of(context).size.width * .08,
        child: Stack(
          fit: StackFit.loose,
          alignment: AlignmentDirectional.centerStart,
          children: [
            AnimatedContainer(
              color: greyColor.withOpacity(0.1),
              duration: const Duration(milliseconds: animationDurationMs),
              padding: const EdgeInsets.all(paddingM),
              constraints: BoxConstraints(
                maxWidth: isHover
                    ? MediaQuery.of(context).size.width * .08
                    : widget.isSelected!
                        ? sizeM
                        : 0,
              ),
              height: MediaQuery.of(context).size.height * .05,
            ),
            Text(
              widget.text!,
              style: const TextStyle(fontWeight: FontWeight.w700),
            ),
          ],
        ),
      ),
    );
  }
}
