import 'dart:async';
import 'package:fip5/config/cache_keys.dart';
import 'package:fip5/screens/intro_screen/intro_screen.dart';
import 'package:fip5/screens/login/login_screen.dart';
import 'package:fip5/utils/helpers/fip5_Navigation.dart';
import 'package:fip5/utils/helpers/shared_prefs_helpers.dart';
import 'package:fip5/utils/ui/common_viewers.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:sizer/sizer.dart';

import '../../utils/ui/fip5_text.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState(){
    _navigate();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonViews().getAppBar(title: 'SplashScreen'),
      body: Column(
          children: [
            SizedBox(
              height:10.h
            ),
             Lottie.asset('assets/logo.json'),
            SizedBox(height: 5.h,),
            Fip5Text(title: 'The App',
            textColor: Colors.red,
            fontSized: 20.sp,
              fontWeight: FontWeight.bold,
            ),
            const Spacer(),
            Fip5Text(title: "2023",
            textColor: Colors.grey,
            fontSized: 30.sp,
              fontWeight: FontWeight.bold,
            ),
            const SizedBox(height: 10,)
          ],
        ),

    );

  }
  void _navigate(){
     Timer(const Duration(seconds: 5),()async{
       // Obtain shared preferences.
       bool isIntroEnteredBefore= SharedPreferenceHelper().
       read(key: CacheKeys.introKey, type: SaveType.boolType) as bool;
       Fip5Navigtor.of(context).pushReplecment(
          isIntroEnteredBefore ? const LoginScreen():  const IntroScreen());
     });
  }
}
