import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
class IntroPageItem extends StatelessWidget {
  final String title;
  final String image;

   const IntroPageItem({
    Key?key,
    required this.title,
    required this.image,
  }) :super(key: key);


  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            image, width: 90.w,
              height: 250,
          ),
          const SizedBox(
            height: 10,
          ),
          Text(title),
        ],

    );
  }
}

