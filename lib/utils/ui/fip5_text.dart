import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
class Fip5Text extends StatelessWidget {
  final String title;
  final Color textColor;
  final double ?fontSized;
  final FontWeight ? fontWeight;
  const Fip5Text({
    Key?key,

    required this.title,
    this.textColor=Colors.black,
    this.fontSized,
    this.fontWeight,
  }):super (key:key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        color: textColor,
        fontSize:fontSized?? 11.sp,
        fontWeight: fontWeight??FontWeight.normal
      ),
    );
  }
}
