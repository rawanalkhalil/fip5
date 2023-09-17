import 'package:fip5/screens/register/register_screen.dart';
import 'package:fip5/utils/helpers/fip5_Navigation.dart';
import 'package:fip5/utils/ui/common_viewers.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonViews().getAppBar(title: "login"),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CommonViews().createButton(
              title: "Register", onPressed: (){
                Fip5Navigtor.of(context).push(const RegisterScreen());
          }
          ),
        ],
      ),
    );
  }

}
