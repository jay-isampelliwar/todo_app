import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/core/constant/app_colors.dart';
import 'package:todo_app/core/constant/app_font_styles.dart';
import 'package:todo_app/core/constant/app_text_field.dart';
import 'package:todo_app/core/constant/const_sizebox.dart';
import 'package:todo_app/core/helper/app_validator.dart';
import 'package:todo_app/core/wigets/app_snacbar.dart';
import 'package:todo_app/features/auth/otp/bloc/otp_bloc.dart';
import 'package:todo_app/features/home/ui/home.dart';

class OTPScreen extends StatelessWidget {
  String email;
  OTPScreen({required this.email, super.key});
  TextEditingController textEditingController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final OtpBloc _otpBloc = OtpBloc();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(
                horizontal: size.width * 0.1, vertical: size.height * 0.1),
            child: BlocConsumer<OtpBloc, OtpState>(
              bloc: _otpBloc,
              listenWhen: (previous, current) => current is OtpActionState,
              buildWhen: (previous, current) => current is! OtpActionState,
              listener: (context, state) {
                if (state is OtpVerifyErrorActionState) {
                  final otpVerifyErrorActionState = state;
                  ScaffoldMessenger.of(context).showSnackBar(appSnackBar(
                      size: size,
                      message: otpVerifyErrorActionState.message,
                      color: Colors.red));
                } else if (state is OtpVerifyButtonClickedActionState) {
                  final otpVerifyButtonClickedActionState = state;
                  ScaffoldMessenger.of(context).showSnackBar(appSnackBar(
                    size: size,
                    message: otpVerifyButtonClickedActionState.message,
                    color: Colors.green,
                  ));

                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const HomePage()));
                }
              },
              builder: (context, state) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Otp sent to your Email",
                      style: AppTextStyle.text16(false)
                          .copyWith(color: AppColors.greyTextColor),
                    ),
                    constHightSizedBox(0.01, size.height),
                    Text(
                      email.toString(),
                      style: AppTextStyle.text24(true).copyWith(fontSize: 26),
                    ),
                    constHightSizedBox(0.04, size.height),
                    Form(
                      key: formKey,
                      child: AppTextField(
                        hintText: "OTP",
                        inputType: TextInputType.number,
                        obscureText: false,
                        textEditingController: textEditingController,
                        validator: (value) =>
                            FieldValidator.otpValidator(value),
                      ),
                    ),
                    constHightSizedBox(0.06, size.height),
                    GestureDetector(
                      onTap: () {
                        FocusScope.of(context).unfocus();
                        if (formKey.currentState!.validate()) {
                          _otpBloc.add(OtpVerifyButtonClickedActionEvent(
                              otp: textEditingController.text, email: email));
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
                          visible: state is! OtpVerifyButtonLoadingState,
                          replacement: CircularProgressIndicator(
                            color: Colors.grey.shade200,
                            strokeWidth: 3,
                          ),
                          child: Text(
                            "Verify",
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
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
