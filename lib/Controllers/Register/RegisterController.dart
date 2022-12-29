import 'package:barley_and_roof/Services/FirebaseRegistration/RegisterInFirebase.dart';
import 'package:barley_and_roof/Utils/Snackbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_field/phone_number.dart';

import '../../Constants/Colors/AppColors.dart';
import '../../Views/UserViews/Register/EmailConfirmation.dart';
import '../../Widgets/AppButton/AppButton.dart';

class RegisterController extends GetxController {
  RegisterUserService registerUser = RegisterUserService();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController age = TextEditingController();
  TextEditingController occupation = TextEditingController();

  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  String? phoneNo;
  String otp = '';
  bool checkValue = false;
  changeCheckValue(value) {
    checkValue = value;
    update();
  }

  bool isloading = false;

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
    if (name.text.trim().isEmpty) {
      Get.snackbar(
        "Error",
        "Name should not be empty",
        colorText: Colors.white,
        backgroundColor: AppColors.primaryColor,
      );
    } else if (email.text.trim().isEmpty) {
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
    } else if (phone.text.trim().isEmpty) {
      Get.snackbar(
        "Error",
        "Phone Number should not be empty",
        colorText: Colors.white,
        backgroundColor: AppColors.primaryColor,
      );
    } else if (age.text.trim().isEmpty) {
      Get.snackbar(
        "Error",
        "age should not be empty",
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
    } else if (password.text.trim().length < 6) {
      Get.snackbar(
        "Error",
        "Password length should be 6",
        colorText: Colors.white,
        backgroundColor: AppColors.primaryColor,
      );
    } else if (confirmPassword.text.trim() != password.text.trim()) {
      Get.snackbar(
        "Error",
        "Password Does not matched",
        colorText: Colors.white,
        backgroundColor: AppColors.primaryColor,
      );
    } else {
      await phoneAuth();
    }
    update();
  }

  phoneAuth() async {
    try {
      await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: phoneNo,
        timeout: Duration(seconds: 60),
        verificationCompleted: (phoneAuthCredential) {
          otp = phoneAuthCredential.smsCode!;
        },
        verificationFailed: (error) {
          String txt = error.toString();
          String substring = txt.substring(txt.indexOf("]") + 1);
          Utils().snacbar("Error", substring);
          debugPrint(error.toString());
        },
        codeSent: (verificationId, forceResendingToken) {
          Get.to(
            () => EmailConfirmation(
              verificationId: verificationId,
              phoneNo: phone.text,
            ),
          );
        },
        codeAutoRetrievalTimeout: (verificationId) {
          debugPrint(verificationId);
        },
      );
    } catch (e) {
      debugPrint(e.toString());
      String txt = e.toString();
      String substring = txt.substring(txt.indexOf("]") + 1);
      Utils().snacbar("Error", substring);
    }
    update();
  }

  selectPhoneNo(context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          actions: [
            SizedBox(
              width: 50,
              child: AppButton(
                onTap: () {
                  phone.text = phoneNo!;
                  update();
                  Get.back();
                },
                text: "Ok",
              ),
            ),
          ],
          content: IntlPhoneField(
            showCountryFlag: false,
            decoration: const InputDecoration(
              labelText: 'Phone Number',
              border: OutlineInputBorder(
                borderSide: BorderSide(),
              ),
            ),
            initialCountryCode: 'PK',
            onChanged: (phone) {
              phoneNo = phone.completeNumber;
              update();
            },
          ),
        );
      },
    );
    update();
  }

  registerAUser() async {
    await registerUser.registerUser(
      name.text,
      email.text,
      age.text,
      password.text,
      phone.text,
      occupation.text,
    );
  }
}
