import 'package:flutter/material.dart';

class HorizontalDivider extends StatelessWidget {
  final double height;
  final double width;
  final Color? color;
  const HorizontalDivider({
    Key? key,
    required this.height,
    required this.width,
    this.color = const Color(0xff818181),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      color: color!.withOpacity(.3),
    );
  }
}
