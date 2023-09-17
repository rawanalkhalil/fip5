import 'package:fip5/getx/navigations/screen_b.dart';
import 'package:fip5/utils/ui/common_viewers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
class ScreenA extends StatefulWidget {
  const ScreenA({super.key});

  @override
  State<ScreenA> createState() => _ScreenAState();
}

class _ScreenAState extends State<ScreenA> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonViews().getAppBar(title: "screena"),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CommonViews().createButton(title: "next",
                onPressed: (){
               Get.off(ScreenB);
                }
            ),
          ],
        ),
      ),
    );
  }
}
