import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppTextField extends StatelessWidget {
  String hintText;
  Icon? suffixIcon;
  Function()? onValidate;
  bool obscureText;
  TextEditingController? textEditingController;

  AppTextField(
      {required this.hintText,
      this.suffixIcon,
      this.onValidate,
      required this.obscureText,
      required this.textEditingController,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      style: TextStyle(color: AppColors.blackColor),
      controller: textEditingController,
      validator: (value) {
        return null;
      },
      decoration: InputDecoration(
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
        labelText: hintText,
        labelStyle: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 20,
          color: Colors.grey.shade500,
        ),
        focusColor: AppColors.blackColor,
        fillColor: Colors.grey.shade100,
        filled: true,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(
            color: Colors.black,
            width: 2,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(
            color: Colors.black,
            width: 2,
          ),
        ),
      ),
      cursorColor: AppColors.blackColor,
    );
  }
}
