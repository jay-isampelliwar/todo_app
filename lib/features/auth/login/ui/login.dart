import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/features/auth/signup/ui/signup.dart';
import 'package:todo_app/core/constant/app_colors.dart';
import 'package:todo_app/core/helper/app_validator.dart';

import '../../../../core/constant/app_text_field.dart';
import '../../../../core/constant/const_sizeBox.dart';

import '../../../home/ui/home.dart';
import '../../widgets/todo_label.dart';
import '../bloc/login_bloc.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});
  TextEditingController phoneTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final LoginBloc loginBloc = LoginBloc();
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
              BlocConsumer<LoginBloc, LoginState>(
                bloc: loginBloc,
                listenWhen: (previous, current) => current is LoginActionState,
                buildWhen: (previous, current) => current is! LoginActionState,
                listener: (context, state) {
                  if (state is LoginButtonClickedActionState) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HomePage()));
                  } else if (state is LoginSignUpNavigateActionState) {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SignUpPage()));
                  }
                },
                builder: (context, state) {
                  return Form(
                    key: formKey,
                    child: Column(
                      children: [
                        AppTextField(
                          hintText: "Mobile Number",
                          inputType: TextInputType.number,
                          obscureText: false,
                          textEditingController: phoneTextEditingController,
                          validator: (text) =>
                              FieldValidator.numberValidator(text),
                        ),
                        constHightSizedBox(0.02, size.height),
                        AppTextField(
                          hintText: "Password",
                          inputType: TextInputType.text,
                          obscureText: state is! LoginPasswordShowState,
                          textEditingController: passwordTextEditingController,
                          suffixIcon: Icon(
                            state is! LoginPasswordShowState
                                ? Icons.remove_red_eye
                                : Icons.highlight_remove_outlined,
                            color: AppColors.blackColor,
                          ),
                          onSuffix: () {
                            if (state is LoginPasswordShowState) {
                              loginBloc.add(LoginPasswordHideButtonEvent());
                            } else {
                              loginBloc.add(LoginPasswordShowButtonEvent());
                            }
                          },
                          validator: (text) =>
                              FieldValidator.passwordValidator(text),
                        ),
                        constHightSizedBox(0.06, size.height),
                        GestureDetector(
                          onTap: () {
                            // print(formKey.currentState!.validate());
                            if (formKey.currentState!.validate()) {
                              loginBloc
                                  .add(LoginLoginButtonClickedActionEvent());
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
                              visible: state is! LoginLoginLoadingButtonState,
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
                      ],
                    ),
                  );
                },
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

                      loginBloc.add(LoginSignUpNavigateActionEvent());
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
