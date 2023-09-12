import 'package:fip5/config/app_color.dart';
import 'package:fip5/screens/splash_screen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

void main() {
  runApp(
      const MyApp()
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primaryColor:AppColors.primaryColor ,
          ),
          home:const SplashScreen(),
        );
      },
    );
  }
}
