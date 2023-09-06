import 'package:flutter/material.dart';
class CommonViews{
  static final CommonViews _shared = CommonViews._private();
  factory CommonViews()=> _shared;
  CommonViews._private();

  AppBar getAppBar({required String title}){
    return  AppBar(
    backgroundColor: Colors.white,
    title: Text(title,style: TextStyle(color: Colors.black),),
    centerTitle: true,
    );
  }
}