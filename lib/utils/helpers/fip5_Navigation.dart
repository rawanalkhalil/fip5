import 'package:flutter/material.dart';
class Fip5Navigtor<T>{
  final BuildContext context;
  bool routNav=false;
  Fip5Navigtor.of(
      this.context,{
        bool rootNavigator =false,
  }){
    FocusManager.instance.primaryFocus?.unfocus();
    routNav=rootNavigator;
  }
  final int _delay=200;
  Future<T?>push(Widget child){
    return Navigator.of(context,rootNavigator: routNav).push(
      PageRouteBuilder(
          pageBuilder: (__,___,____)=>child,
        transitionDuration: Duration(milliseconds: _delay),
        transitionsBuilder: (_,a,__,c)=>
          FadeTransition(opacity: a,child: c,),
      )
    );
  }
  /*Future<T?>pushReplecment(Widget child){
    return Navigator.of(context,rootNavigator: routNav).pushReplacement(
        MaterialPageRoute(builder: (context)=>child)
    );
  }*/
//this function is substitute for before code
  Future <T?>pushReplecment(Widget child){
    return Navigator.of(context,rootNavigator: routNav).pushReplacement(
      PageRouteBuilder(
        pageBuilder: (__,___,____)=>child,
        transitionDuration: Duration(milliseconds: _delay),
        transitionsBuilder: (_,a,__,c)=>
            FadeTransition(opacity: a,child: c,),
      ),

    );
  }

  Future<T?>pushAndRemoveUntil(Widget child){
    return Navigator.of(context,rootNavigator: routNav).pushAndRemoveUntil(
        PageRouteBuilder(
          pageBuilder: (__,___,____)=>child,
          transitionDuration: Duration(milliseconds: _delay),
          transitionsBuilder: (_,a,__,c)=>
              FadeTransition(opacity: a,child: c,),
        ),
          (routNav) => false,
    );
  }
  void pop([result]){
    Navigator.of(context,rootNavigator: routNav).pop(result);
  }
}