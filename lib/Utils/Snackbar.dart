import 'package:barley_and_roof/Constants/Colors/AppColors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Utils {
  snacbar(
    title,
    message,
  ) {
    Get.snackbar(
      title,
      message,
      backgroundColor: AppColors.primaryColor,
      colorText: Colors.white,
    );
  }
}
