import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/features/auth/login/ui/login.dart';
import 'package:todo_app/features/auth/signup/bloc/sign_up_bloc.dart';

import '../../../../core/constant/app_colors.dart';
import '../../../../core/constant/const_sizeBox.dart';
import '../../../../core/constant/app_text_field.dart';
import '../../../../core/helper/app_validator.dart';
import '../../../home/ui/home.dart';
import '../../widgets/todo_label.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController phoneTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController nameTextEditingController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  FocusNode focusNode = FocusNode();
  bool flag = true;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final SignUpBloc signUpBloc = SignUpBloc();
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
              right: size.width * 0.06,
              left: size.width * 0.06,
              bottom: size.height * 0.03),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              constHightSizedBox(0.06, size.height),
              const TodoLabel(),
              constHightSizedBox(0.04, size.height),
              BlocConsumer<SignUpBloc, SignUpState>(
                bloc: signUpBloc,
                listenWhen: (previous, current) => current is SignUpActionState,
                buildWhen: (previous, current) => current is! SignUpActionState,
                listener: (context, state) {
                  switch (state.runtimeType) {
                    case SignUpLoginNavigatorActionState:
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) => LoginPage()));
                      break;
                    case SignUpHomePageNavigatorActionState:
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const HomePage()));
                      break;
                    case SignUpShowSnackBarState:
                      final signUpShowSnackBarState =
                          state as SignUpShowSnackBarState;
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(signUpShowSnackBarState.message),
                        ),
                      );
                  }
                },
                builder: (context, state) {
                  flag = !flag;
                  return Form(
                    key: formKey,
                    child: Column(
                      children: [
                        AppTextField(
                          hintText: "Name",
                          // focusNode: nameNode,
                          inputType: TextInputType.name,
                          obscureText: false,
                          textEditingController: nameTextEditingController,

                          validator: (text) =>
                              FieldValidator.nameValidator(text),
                        ),
                        constHightSizedBox(0.02, size.height),

                        AppTextField(
                          inputType: TextInputType.emailAddress,
                          hintText: "Email address",
                          obscureText: false,
                          textEditingController: emailTextEditingController,
                          validator: (text) =>
                              FieldValidator.emailValidator(text),
                        ),
                        constHightSizedBox(0.02, size.height),
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
                          obscureText: flag,
                          textEditingController: passwordTextEditingController,
                          suffixIcon: Icon(
                            flag
                                ? Icons.remove_red_eye
                                : Icons.highlight_remove_outlined,
                            color: AppColors.blackColor,
                          ),
                          onSuffix: () {
                            signUpBloc
                                .add(SignUpPasswordShowButtonClickedEvent());
                          },
                          validator: (text) =>
                              FieldValidator.passwordValidator(text),
                        ),
                        constHightSizedBox(0.03, size.height),
                        //!CUstom button
                        GestureDetector(
                          onTap: () {
                            if (formKey.currentState!.validate()) {
                              signUpBloc.add(SignUpButtonClickedActionEvent(
                                name: nameTextEditingController.text,
                                email: emailTextEditingController.text,
                                phone: phoneTextEditingController.text,
                                password: passwordTextEditingController.text,
                              ));
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
                              visible: state is! SignUpButtonLoadingState,
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
                    "Already have an account? ",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      signUpBloc.add(SignUpLoginButtonClickedActionEvent());
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
