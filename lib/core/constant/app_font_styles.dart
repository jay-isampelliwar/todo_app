import 'package:flutter/cupertino.dart';
import 'package:todo_app/core/constant/app_colors.dart';

class AppTextStyle {
  static TextStyle text14(bool bold) {
    return TextStyle(
      fontSize: 14,
      color: AppColors.blackColor,
      fontWeight: bold ? FontWeight.bold : FontWeight.normal,
    );
  }

  static TextStyle text16(bool bold) {
    return TextStyle(
      fontSize: 16,
      color: AppColors.blackColor,
      fontWeight: bold ? FontWeight.bold : FontWeight.normal,
    );
  }

  static TextStyle text20(bool bold) {
    return TextStyle(
      fontSize: 20,
      color: AppColors.blackColor,
      fontWeight: bold ? FontWeight.bold : FontWeight.normal,
    );
  }

  static TextStyle text24(bool bold) {
    return TextStyle(
      fontSize: 24,
      color: AppColors.blackColor,
      fontWeight: bold ? FontWeight.bold : FontWeight.normal,
    );
  }

  static TextStyle text44() {
    return TextStyle(
      fontSize: 44,
      color: AppColors.blackColor,
      fontWeight: FontWeight.bold,
    );
  }
}
