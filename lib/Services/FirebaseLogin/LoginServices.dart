import 'package:barley_and_roof/Models/UserModel/UserModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Constants/Colors/AppColors.dart';

class LoginServices {
  UserModel userModel = UserModel();
  login(String email, String password) async {
    try {
      var auth = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      if (email == "admin@gmail.com" && password == "1234567") {
        print("admin login");
        return userModel;
      } else {}
    } catch (e) {
      Get.snackbar(
        "Error",
        e.toString(),
        colorText: Colors.white,
        backgroundColor: AppColors.primaryColor,
      );
      return userModel;
    }
  }
}
