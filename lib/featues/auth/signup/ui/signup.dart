import 'package:flutter/material.dart';
import 'package:todo_app/constant/app_colors.dart';
import 'package:todo_app/constant/const_sizebox.dart';

import '../../../../constant/app_text_field.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({super.key});
  TextEditingController phoneTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();
  TextEditingController emailtextEditingController = TextEditingController();
  TextEditingController usernametextEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.06),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              constHightSizedBox(0.10, size.height),
              Text(
                "TO-DO",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 44,
                  color: AppColors.blackColor,
                ),
              ),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "Welcome\n",
                      style: TextStyle(
                          fontSize: 38,
                          fontWeight: FontWeight.bold,
                          color: AppColors.blackColor),
                    ),
                    TextSpan(
                      text:
                          "With our app, you can easily manage your tasks and stay organized throughout the day. Whether you have a long to-do list or just a few important tasks to complete, our app is designed to help you stay on top of your goals and get things done.",
                      style: TextStyle(
                        color: AppColors.greyTextColor,
                        fontSize: 14,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ],
                ),
              ),
              constHightSizedBox(0.04, size.height),
              Form(
                child: Column(
                  children: [
                    AppTextField(
                      hintText: "Mobile Number",
                      obscureText: false,
                      textEditingController: phoneTextEditingController,
                      suffixIcon: const Icon(Icons.close),
                      onValidate: () {},
                    ),
                    constHightSizedBox(0.02, size.height),
                    AppTextField(
                      hintText: "Email address",
                      obscureText: false,
                      textEditingController: phoneTextEditingController,
                      suffixIcon: const Icon(Icons.close),
                      onValidate: () {},
                    ),
                    constHightSizedBox(0.02, size.height),
                    AppTextField(
                      hintText: "Username",
                      obscureText: false,
                      textEditingController: phoneTextEditingController,
                      suffixIcon: const Icon(Icons.close),
                      onValidate: () {},
                    ),
                    constHightSizedBox(0.02, size.height),
                    AppTextField(
                      hintText: "Password",
                      obscureText: true,
                      textEditingController: passwordTextEditingController,
                      suffixIcon: const Icon(Icons.remove_red_eye),
                      onValidate: () {
                        //!show nd hide password
                      },
                    ),
                  ],
                ),
              ),
              constHightSizedBox(0.06, size.height),
              GestureDetector(
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
                      "Sign up",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                        color: Colors.grey.shade200,
                      ),
                    ),
                  )),
                ),
              ),
              constHightSizedBox(0.06, size.height),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Already have an account? ",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      //! Navigate to login page
                    },
                    child: const Text(
                      "Login",
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
