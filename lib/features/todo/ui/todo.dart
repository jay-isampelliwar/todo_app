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
          constHightSizedBox(0.02, size.height),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              DateTimeWidget(
                icon: Icon(
                  Icons.calendar_month_rounded,
                  color: AppColors.greyTextColor,
                ),
                text: "Today",
              ),
              DateTimeWidget(
                icon: Icon(
                  Icons.watch_later_outlined,
                  color: AppColors.greyTextColor,
                ),
                text: "Time",
              ),
            ],
          ),
          constHightSizedBox(0.03, size.height),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CategoryChip(
                category: "Personal",
                isSelected: false,
                color: AppColors.personalColor,
                onSelected: (value) {},
              ),
              CategoryChip(
                category: "Urgent",
                isSelected: true,
                color: AppColors.urgentColor,
                onSelected: (value) {},
              ),
              CategoryChip(
                category: "Business",
                isSelected: false,
                color: AppColors.businessColor,
                onSelected: (value) {},
              ),
            ],
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

class CategoryChip extends StatelessWidget {
  CategoryChip({
    required this.category,
    required this.onSelected,
    required this.isSelected,
    required this.color,
    Key? key,
  }) : super(key: key);

  String category;
  bool isSelected;
  Function(bool)? onSelected;
  Color color;

  @override
  Widget build(BuildContext context) {
    return FilterChip(
      label: Text(category),
      labelPadding: const EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 4,
      ),
      labelStyle: AppTextStyle.text16(true),
      selected: isSelected,
      selectedColor: color,
      onSelected: onSelected,
    );
  }
}

class DateTimeWidget extends StatelessWidget {
  DateTimeWidget({
    required this.icon,
    required this.text,
    Key? key,
  }) : super(key: key);

  Icon icon;
  String text;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.08,
      width: size.width * 0.4,
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.08),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          50,
        ),
        border: Border.all(
          color: AppColors.blackColor.withOpacity(0.2),
          width: 1,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          icon,
          Text(
            text,
            style: AppTextStyle.text20(false)
                .copyWith(color: AppColors.greyTextColor),
          )
        ],
      ),
    );
  }
}
