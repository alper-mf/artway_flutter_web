import 'package:artway_web/app/constant/app_constants.dart';
import 'package:artway_web/app/constant/color_constants.dart';
import 'package:artway_web/app/constant/padding_and_radius_size.dart';
import 'package:flutter/material.dart';

class HoverButton extends StatefulWidget {
  final String text;
  final bool isSelected;
  final Color backgroundColor;
  final Color textColor;
  const HoverButton(
      {Key? key,
      required this.text,
      required this.isSelected,
      required this.backgroundColor,
      required this.textColor})
      : super(key: key);

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
        height: MediaQuery.of(context).size.height * .04,
        width: MediaQuery.of(context).size.width * .08,
        child: Stack(
          fit: StackFit.loose,
          alignment: AlignmentDirectional.centerStart,
          children: [
            AnimatedContainer(
              color: widget.backgroundColor,
              duration: const Duration(milliseconds: animationDurationMs),
              padding: const EdgeInsets.all(paddingM),
              constraints: BoxConstraints(
                maxWidth: isHover
                    ? MediaQuery.of(context).size.width * .08
                    : widget.isSelected
                        ? sizeM - 3
                        : 0,
              ),
              height: MediaQuery.of(context).size.height * .04,
            ),
            Text(
              widget.text,
              style: TextStyle(
                  fontWeight: FontWeight.w700, color: widget.textColor),
            ),
          ],
        ),
      ),
    );
  }
}
