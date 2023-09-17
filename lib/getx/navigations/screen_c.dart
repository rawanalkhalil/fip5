import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/ui/common_viewers.dart';
class ScreenC extends StatefulWidget {
  const ScreenC({super.key});

  @override
  State<ScreenC> createState() => _ScreenCState();
}

class _ScreenCState extends State<ScreenC> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonViews().getAppBar(title: "screena"),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CommonViews().createButton(title: "Back",
                onPressed: (){
                  Get.back();
                }
            ),
          ],
        ),
      ),
    );
  }
}