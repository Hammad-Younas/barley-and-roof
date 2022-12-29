import 'package:barley_and_roof/Models/RegisterModel/RegisterModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import '../../Constants/Colors/AppColors.dart';
import '../../Widgets/AppButton/AppButton.dart';

class RegisterUserService {
  registerUser(
    String name,
    String email,
    String age,
    String password,
    String phone,
    String occupation,
  ) async {
    try {
      await FirebaseFirestore.instance.collection("UsersData").doc(email).set(
            RegisterModel(
              name: name,
              email: email,
              age: age,
              password: password,
              phone: phone,
              occupation: occupation,
            ).toJson(),
          );
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } catch (e) {
      Get.snackbar(
        "Error",
        e.toString(),
        colorText: Colors.white,
        backgroundColor: AppColors.primaryColor,
      );
    }
  }
}
