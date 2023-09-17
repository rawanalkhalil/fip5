import 'package:flutter/material.dart';

import '../../utils/ui/common_viewers.dart';
class ScreenB extends StatefulWidget {
  const ScreenB({super.key});

  @override
  State<ScreenB> createState() => _ScreenBState();
}

class _ScreenBState extends State<ScreenB> {
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
                }
            ),
          ],
        ),
      ),
    );
  }
}