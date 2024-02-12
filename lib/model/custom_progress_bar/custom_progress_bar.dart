import 'package:flutter/material.dart';
import 'package:quiz_new/utils/color_constant.dart';

class CustomProgressBar extends StatelessWidget {
  const CustomProgressBar(
      {super.key,
      required this.height,
      required this.width,
      required this.progress});
  final double height;
  final double width;
  final double progress;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
          color: Colors.grey[300], borderRadius: BorderRadius.circular(10)),
      child: Stack(
        children: [
          Container(
            width: width * progress,
            height: height,
            decoration: BoxDecoration(
                color: ColorConstant.mycustomblue,
                borderRadius: BorderRadius.circular(10)),
          )
        ],
      ),
    );
  }
}
