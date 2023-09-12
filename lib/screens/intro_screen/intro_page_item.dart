import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
class IntroPageItem extends StatelessWidget {
  final String title;
  final String image;
  final VoidCallback ? onTap;

   const IntroPageItem({
    Key?key,
    required this.title,
    required this.image,
     this.onTap,
  }) :super(key: key);


  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          InkWell(
            onTap: (){
              if(onTap!=null)onTap!.call();
            },
            child: Image.asset(
              image, width: 90.w,
                height: 250,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(title),
        ],

    );
  }
}

