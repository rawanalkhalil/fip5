import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'intro_page_item.dart';
class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  final List<Widget> _pages=[];
  PageController controller=PageController();
  @override
  void initState(){
    _fillPages();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
           body: Container(
             width: MediaQuery.of(context).size.width,
             child: Column(
               children: [
                  const SizedBox(
                   height: 150,
                 ),
                 Expanded(
                   child: SizedBox(
                     height: 50.h,
                     child:PageView.builder(
                         itemBuilder: (context,index){
                           return _pages[index];
                         },
                       itemCount:_pages.length ,
                       controller: controller,
                     ),
                   ),
                 ),
                 const SizedBox(height: 10,),
                 SmoothPageIndicator(
                     controller: controller,  // PageController
                     count:  _pages.length,
                     effect: WormEffect(activeDotColor: Colors.red,dotColor: Colors.grey.shade300,spacing: 50),  // your preferred effect
                     onDotClicked: (index){

                     }
                 ),
                 const SizedBox(height: 20,),
               ],
             ),
           ),
    );
  }
  void _fillPages(){
    _pages.add(const IntroPageItem(
      title: "Test title1",
      image: "assets/intro1.jpg",
    ));
    _pages.add(const IntroPageItem(
      title: "Test title2",
      image: "assets/intro2.jpg",
    ));
    _pages.add(const IntroPageItem(
      title: "Test title3",
      image: "assets/intro3.jpg",
    ));
  }
}
