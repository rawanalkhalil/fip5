import 'dart:io';
import 'package:fip5/config/app_constants.dart';
import 'package:fip5/utils/ui/common_viewers.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sizer/sizer.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _passwordEditingController =
      TextEditingController();
  final TextEditingController _mobiEditingController = TextEditingController();
  final FocusNode _userNameFocus = FocusNode();
  final FocusNode _passwordFocus = FocusNode();
  final FocusNode _mobileFocus = FocusNode();
  GlobalKey<FormState> key = GlobalKey<FormState>();
  XFile? file;
  bool _isPasswordObscure=true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      appBar: CommonViews().getAppBar(title: "Register"),
      bottomSheet: Container(
        height: 40,
        color: Colors.white,
        margin: const EdgeInsets.only(bottom: 10),
        child: Center(
          child: CommonViews().createButton(title: "Confirm", onPressed: () {}),
        ),
      ),
      body: Form(
        key: key,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.w),
            child: Column(
              children: [
                const SizedBox(
                  height: 25,
                ),
                _getPlaceHolders(),
                const SizedBox(
                  height: AppConstant.textFieldSpacing,
                ),
                CommonViews().createTextField(
                    controller: _userNameController,
                    focus: _userNameFocus,
                    label: "Username",

                    inputAction: TextInputAction.next,
                    onSubmitted: (v) {
                      _passwordFocus.requestFocus();
                    }),
                const SizedBox(
                  height: AppConstant.textFieldSpacing,
                ),
                CommonViews().createTextField(
                    controller: _passwordEditingController,
                    focus: _passwordFocus,
                    label: "Password",
                    isObscure: _isPasswordObscure,
                    suffixIcon: InkWell(
                        onTap: (){
                          setState(() {
                            _isPasswordObscure=!_isPasswordObscure;
                          });
                        },
                        child: Icon(
                          _isPasswordObscure?
                          Icons.visibility_outlined
                          : Icons.visibility_off_outlined,
                          color: Colors.brown,
                        )),
                    inputAction: TextInputAction.next,
                    onSubmitted: (v) {
                      _mobileFocus.requestFocus();
                    }),

                const SizedBox(
                  height: AppConstant.textFieldSpacing,
                ),
                CommonViews().createTextField(
                    controller: _mobiEditingController,
                    focus: _mobileFocus,
                    label: "MobileNumber",
                    keyboardType: TextInputType.phone,
                    prefixText: "+962",
                    hintText: "789992134"),
                const SizedBox(
                  height: AppConstant.textFieldSpacing,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _getPlaceHolders() {
    return InkWell(
      onTap: () async {
        ImagePicker picker = ImagePicker();
        file = await picker.pickImage(source: ImageSource.camera); //permission
        setState(() {});
      },
      child: Container(
        width: 30.w,
        height: 30.h,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: Colors.black, width: 3)),
        child: Center(
            child: file == null
                ? const Icon(
                    Icons.photo,
                    size: 70,
                  )
                : ClipRRect(
                    borderRadius: BorderRadius.circular(60),
                    child: CircleAvatar(
                        backgroundColor: Colors.black12,
                        radius: 60,
                        child: Image.file(
                          File(file!.path),
                          fit: BoxFit.fill,
                        )),
                  )),
      ),
    );
  }
}
