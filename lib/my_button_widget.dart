import 'package:appgain_flutter_task/my_text_widget.dart';
import 'package:flutter/material.dart';

class MyBottonWidget extends StatelessWidget {
  const MyBottonWidget(
      {super.key,
      required this.onTap,
      this.color = Colors.black,
      this.textColor = Colors.white,
      required this.text,
      this.textSize = 20,
      this.height = 60,
      this.width = double.infinity,
      this.borderRadius = 20});
  final VoidCallback onTap;
  final Color color;
  final Color textColor;
  final String text;
  final double textSize;
  final double height;
  final double width;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: width,
        alignment: Alignment.center,
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius),
          color: color,
        ),
        child: MyTextWidget(
          text: text,
          size: textSize,
          color: textColor,
          isTitle: true,
        ),
      ),
    );
  }
}
