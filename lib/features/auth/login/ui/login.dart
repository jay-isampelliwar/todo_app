import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:todo_app/util/constant/app_colors.dart';
import 'package:todo_app/util/constant/const_sizebox.dart';
import 'package:todo_app/util/helper/app_validator.dart';

import '../../../../util/constant/app_text_field.dart';
import '../../../widgets/todo_label.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});
  TextEditingController phoneTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: size.width * 0.08, vertical: size.height * 0.02),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              constHightSizedBox(0.06, size.height),
              const TodoLabel(),
              constHightSizedBox(0.04, size.height),
              Form(
                key: formKey,
                child: Column(
                  children: [
                    AppTextField(
                      hintText: "Mobile Number",
                      inputType: TextInputType.number,
                      obscureText: false,
                      textEditingController: phoneTextEditingController,
                      suffixIcon: const Icon(Icons.close),
                      // onValidate: () {},
                      validator: (text) => FieldValidator.numberValidator(text),
                    ),
                    constHightSizedBox(0.02, size.height),
                    AppTextField(
                      hintText: "Password",
                      inputType: TextInputType.text,
                      obscureText: true,
                      textEditingController: passwordTextEditingController,
                      suffixIcon: const Icon(Icons.remove_red_eye),
                      validator: (text) =>
                          FieldValidator.passwordValidator(text),
                    ),
                  ],
                ),
              ),
              constHightSizedBox(0.06, size.height),
              GestureDetector(
                onTap: () {
                  // print(formKey.currentState!.validate());
                  if (formKey.currentState!.validate()) {
                    log("Success");
                  }
                },
                child: Container(
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.black87,
                    borderRadius: BorderRadius.circular(12),
                  ),

                  // !Login loading button
                  child: Align(
                      child: Visibility(
                    visible: true,
                    replacement: CircularProgressIndicator(
                      color: Colors.grey.shade200,
                      strokeWidth: 3,
                    ),
                    child: Text(
                      "Login",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                        color: Colors.grey.shade200,
                      ),
                    ),
                  )),
                ),
              ),
              constHightSizedBox(0.03, size.height),
              Divider(color: AppColors.blackColor),
              constHightSizedBox(0.03, size.height),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Don't have an account? ",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      //! Navigate to sign up page
                    },
                    child: const Text(
                      "SignUp",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
