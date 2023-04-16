import 'package:flutter/material.dart';
import 'package:todo_app/core/constant/app_colors.dart';
import 'package:todo_app/core/constant/app_font_styles.dart';
import 'package:todo_app/core/constant/app_text_field.dart';
import 'package:todo_app/core/constant/const_sizeBox.dart';
import 'package:todo_app/core/helper/app_validator.dart';

class OTPScreen extends StatelessWidget {
  String email;
  OTPScreen({required this.email, super.key});
  TextEditingController textEditingController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(
                horizontal: size.width * 0.1, vertical: size.height * 0.1),
            child: Column(
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
                    validator: (value) => FieldValidator.otpValidator(value),
                  ),
                ),
                constHightSizedBox(0.06, size.height),
                GestureDetector(
                  onTap: () {
                    if (formKey.currentState!.validate()) {
                      //!EMIT the state
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
                      // visible: state is! SignUpButtonLoadingState,
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
            ),
          ),
        ),
      ),
    );
  }
}
