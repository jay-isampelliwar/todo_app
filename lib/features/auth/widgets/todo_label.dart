import 'package:flutter/material.dart';

import '../../../core/constant/app_colors.dart';
import '../../../core/constant/const_sizeBox.dart';

class TodoLabel extends StatelessWidget {
  const TodoLabel({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        Row(
          children: [
            SizedBox(
              height: 200,
              child: Center(child: Image.asset("lib/assets/todo.png")),
            ),
            constWidthSizedBox(0.04, size.width),
            Text(
              "TO\nDO",
              style: TextStyle(
                  fontSize: (size.width + size.height / 2) * 0.1,
                  fontWeight: FontWeight.bold,
                  color: AppColors.blackColor),
            ),
          ],
        ),
        constHightSizedBox(
          0.04,
          size.height,
        ),
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: "Welcome, ",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: AppColors.blackColor),
              ),
              TextSpan(
                text:
                    "With our app, you can easily manage your tasks and stay organized throughout the day. Whether you have a long to-do list or just a few important tasks to complete, our app is designed to help you stay on top of your goals and get things done.",
                style: TextStyle(
                  color: AppColors.greyTextColor,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
