import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/core/constant/app_font_styles.dart';
import 'package:todo_app/core/wigets/app_snacbar.dart';
import 'package:todo_app/features/auth/signup/ui/signup.dart';
import 'package:todo_app/core/constant/app_colors.dart';
import 'package:todo_app/core/helper/app_validator.dart';

import '../../../../core/constant/app_text_field.dart';
import '../../../../core/constant/const_sizebox.dart';

import '../../../home/ui/home.dart';
import '../../widgets/todo_label.dart';
import '../bloc/login_bloc.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();
  TextEditingController forgetPasswordTextEditingController =
      TextEditingController();
  TextEditingController forgetPasswordEmailTextEditingController =
      TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  GlobalKey<FormState> forgetKey = GlobalKey<FormState>();
  FocusNode focusNode = FocusNode();
  final LoginBloc loginBloc = LoginBloc();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
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
                  if (state is LoginLoadingSuccessState) {
                    final loginLoadingSuccessState = state;
                    ScaffoldMessenger.of(context).showSnackBar(appSnackBar(
                        size: size,
                        message: loginLoadingSuccessState.message,
                        color: Colors.green));
                  } else if (state is LoginErrorState) {
                    final loginErrorState = state;
                    ScaffoldMessenger.of(context).showSnackBar(appSnackBar(
                        size: size,
                        message: loginErrorState.message,
                        color: Colors.red));
                  } else if (state is LoginHomePageNavigateActionState) {
                    Navigator.pushReplacement(
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
                          hintText: "Email",
                          inputType: TextInputType.emailAddress,
                          obscureText: false,
                          textEditingController: emailTextEditingController,
                          validator: (text) =>
                              FieldValidator.emailValidator(text),
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
                              text!.isEmpty ? "Required" : null,
                        ),
                        constHightSizedBox(0.01, size.height),
                        Row(
                          children: [
                            const Spacer(),
                            GestureDetector(
                              onTap: () {
                                showDialog(
                                    context: context,
                                    builder: (context) {
                                      return dialogBox(
                                        size,
                                        context,
                                      );
                                    });
                              },
                              child: Text(
                                "Forget Password?",
                                style: AppTextStyle.text16(true)
                                    .copyWith(color: Colors.blue),
                              ),
                            ),
                          ],
                        ),
                        constHightSizedBox(0.04, size.height),
                        GestureDetector(
                          onTap: () {
                            FocusScope.of(context).unfocus();
                            if (formKey.currentState!.validate()) {
                              loginBloc.add(LoginLoginButtonClickedActionEvent(
                                  email: emailTextEditingController.text,
                                  password:
                                      passwordTextEditingController.text));
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

  Dialog dialogBox(Size size, BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
              vertical: size.height * 0.02, horizontal: size.width * 0.02),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Form(
                key: forgetKey,
                child: Column(
                  children: [
                    AppTextField(
                      hintText: "Email",
                      inputType: TextInputType.text,
                      textEditingController:
                          forgetPasswordEmailTextEditingController,
                      obscureText: false,
                      validator: (value) =>
                          FieldValidator.emailValidator(value),
                    ),
                    constHightSizedBox(0.01, size.height),
                    AppTextField(
                      hintText: "New Password",
                      inputType: TextInputType.text,
                      textEditingController:
                          forgetPasswordTextEditingController,
                      obscureText: false,
                      validator: (value) =>
                          FieldValidator.passwordValidator(value),
                    ),
                  ],
                ),
              ),
              constHightSizedBox(0.02, size.height),
              GestureDetector(
                onTap: () {
                  FocusScope.of(context).unfocus();
                  if (forgetKey.currentState!.validate()) {
                    loginBloc.add(LoginForgetPasswordActionEvent(
                        password: forgetPasswordTextEditingController.text,
                        email: forgetPasswordEmailTextEditingController.text));
                    Navigator.pop(context);
                    forgetPasswordEmailTextEditingController.clear();
                    forgetPasswordTextEditingController.clear();
                  }
                },
                child: Container(
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.black87,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Align(
                      child: Text(
                    "Save",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                      color: Colors.grey.shade200,
                    ),
                  )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
