import 'package:barley_and_roof/Constants/Colors/AppColors.dart';
import 'package:barley_and_roof/Services/FirebaseLogin/LoginServices.dart';
import 'package:barley_and_roof/Views/Home/HomePage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Models/UserModel/UserModel.dart';

class LoginController extends GetxController {
  bool isloading = false;
  LoginServices loginServices = LoginServices();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  UserModel userModel = UserModel();

  bool isEmailValid(String email) {
    String exp =
        r'^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

    RegExp regExp = RegExp(exp);
    return regExp.hasMatch(email);
  }

  bool ispasswordvalid(String password) {
    String exp =
        r'^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$';

    RegExp regExp = RegExp(exp);
    return regExp.hasMatch(password);
  }

  isValidUser() async {
    if (email.text.trim().isEmpty) {
      Get.snackbar(
        "Error",
        "Email should not be empty",
        colorText: Colors.white,
        backgroundColor: AppColors.primaryColor,
      );
    } else if (!isEmailValid(email.text)) {
      Get.snackbar(
        "Error",
        "Email is invalid\nEmail must be like:- abc@gmail.com",
        colorText: Colors.white,
        backgroundColor: AppColors.primaryColor,
      );
    } else if (password.text.trim().isEmpty) {
      Get.snackbar(
        "Error",
        "Password should not be empty",
        colorText: Colors.white,
        backgroundColor: AppColors.primaryColor,
      );
    } else if (!ispasswordvalid(password.text)) {
      Get.snackbar(
        "Error",
        "Password should contain minimum 8 characters with alphabets,numeric and special characters",
        colorText: Colors.white,
        backgroundColor: AppColors.primaryColor,
      );
    } else {
      await loginServices.login(
        email.text.trim(),
        password.text.trim(),
      );
      await getUserData();
      Get.to(
        () => HomePage(
          userName: userModel.name!,
          email: userModel.email!,
        ),
      );
    }
  }

  getUserData() async {
    var res = await FirebaseFirestore.instance
        .collection("UsersData")
        .doc(email.text)
        .get();
    userModel = UserModel.fromJson(res.data()!);

    return userModel;
  }
}
