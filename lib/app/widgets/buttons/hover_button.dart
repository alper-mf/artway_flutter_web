import 'package:flutter/material.dart';

class HoverButton extends StatefulWidget {
  final String? title;
  const HoverButton({Key? key, this.title}) : super(key: key);

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
    );
  }
}
