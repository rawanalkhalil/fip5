import 'package:fip5/config/app_color.dart';
import 'package:flutter/material.dart';

import 'fip5_text.dart';
class CommonViews{
  static final CommonViews _shared = CommonViews._private();
  factory CommonViews()=> _shared;
  CommonViews._private();

  AppBar getAppBar({required String title}){
    return  AppBar(
    backgroundColor: Colors.white,
    title: Text(title,style: const TextStyle(color: Colors.black),),
    centerTitle: true,
    );
  }
  Widget createButton({required String title,required VoidCallback onPressed}){
    return ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            backgroundColor:AppColors.buttonColor
        ),
        child: Fip5Text(
          title: title,
          textColor: Colors.white,
        ));
  }
}