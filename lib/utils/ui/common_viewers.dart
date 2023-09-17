import 'package:fip5/config/app_color.dart';
import 'package:flutter/material.dart';

import 'fip5_text.dart';

class CommonViews {
  static final CommonViews _shared = CommonViews._private();
  factory CommonViews() => _shared;
  CommonViews._private();

  AppBar getAppBar({required String title}) {
    return AppBar(
      backgroundColor: Colors.white,
      title: Text(
        title,
        style: const TextStyle(color: Colors.black),
      ),
      centerTitle: true,
    );
  }

  Widget createButton(
      {required String title, required VoidCallback onPressed}) {
    return ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(backgroundColor: AppColors.buttonColor),
        child: Fip5Text(
          title: title,
          textColor: Colors.white,
        ));
  }

  Widget createTextField({
    required TextEditingController controller,
    required FocusNode focus,
    required String label,
    TextInputType keyboardType = TextInputType.text,
    TextInputAction inputAction = TextInputAction.done,
    bool isObscure = false,
    ValueChanged<String>? onSubmitted,
    String? prefixText,
    String ?hintText,
    Widget? suffixIcon,
  }) {
    return TextField(
      controller: controller,
      focusNode: focus,
      keyboardType: keyboardType,
      textInputAction: inputAction,
      obscureText: isObscure,
      onSubmitted: onSubmitted,
      decoration: InputDecoration(
          labelText: label,
          hintText: hintText,
          labelStyle:
              const TextStyle(color: Colors.black, fontWeight: FontWeight.w700),
          prefix:Text(prefixText ??''),
          suffixIcon: suffixIcon,
          contentPadding: EdgeInsets.only(left:prefixText!=null?10:0 ),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide:
                  const BorderSide(color: AppColors.scoffoldBackgroundColor))),
    );
  }
}
