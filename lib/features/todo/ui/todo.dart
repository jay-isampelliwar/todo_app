import 'package:flutter/material.dart';
import 'package:todo_app/core/constant/app_colors.dart';
import 'package:todo_app/core/constant/app_font_styles.dart';
import 'package:todo_app/core/constant/const_sizeBox.dart';

class TodoPage extends StatelessWidget {
  TodoPage({super.key});

  TextEditingController todoTextEditingController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(
          horizontal: size.width * 0.04,
        ),
        child: ListView(children: [
          Row(
            children: [
              const Spacer(),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  height: 50,
                  width: 50,
                  margin: EdgeInsets.only(
                    top: size.height * 0.04,
                    right: size.width * 0.04,
                  ),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: AppColors.blackColor,
                      width: 2,
                    ),
                  ),
                  child: Align(
                    child: Icon(
                      Icons.close_rounded,
                      color: AppColors.greyTextColor,
                      size: 34,
                    ),
                  ),
                ),
              )
            ],
          ),
          constHightSizedBox(0.2, size.height),
          Form(
            key: formKey,
            child: TextFormField(
              maxLines: null,
              maxLength: 60,
              controller: todoTextEditingController,
              decoration: InputDecoration(
                hintText: "Todo Title",
                hintStyle: AppTextStyle.text20(
                  false,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
              ),
              style: AppTextStyle.text20(false),
              validator: (value) {
                if (value!.isEmpty) return "Task name should not empty";
                return null;
              },
            ),
          ),
          constHightSizedBox(0.04, size.height),
          GestureDetector(
            onTap: () {},
            child: Container(
              height: 60,
              decoration: BoxDecoration(
                color: Colors.black87,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Align(
                  child: Text(
                "Add Todo",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  color: Colors.grey.shade200,
                ),
              )),
            ),
          ),
          constHightSizedBox(0.04, size.height),
        ]),
      ),
    );
  }
}
