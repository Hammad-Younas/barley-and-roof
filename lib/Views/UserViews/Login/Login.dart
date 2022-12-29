import 'package:barley_and_roof/Constants/AppPaddings/AppPadding.dart';
import 'package:barley_and_roof/Constants/Colors/AppColors.dart';
import 'package:barley_and_roof/Constants/Svgs/SvgIcons.dart';
import 'package:barley_and_roof/Controllers/Login/LoginController.dart';
import 'package:barley_and_roof/Models/UserModel/UserModel.dart';
import 'package:barley_and_roof/Services/FirebaseLogin/LoginServices.dart';
import 'package:barley_and_roof/Services/GetFirebaseImages.dart';
import 'package:barley_and_roof/Views/SkipScreens/SkipUnitScreen/SkipUnitScreen.dart';
import 'package:barley_and_roof/Widgets/Texts/CommonText.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../Widgets/AppButton/AppButton.dart';
import '../../../Widgets/InputFields/InputField.dart';
import '../Register/Register.dart';

class Login extends StatefulWidget {
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool obsecure = true;
  FocusNode focusNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
        init: LoginController(),
        builder: (controller) {
          return Scaffold(
            backgroundColor: AppColors.appBackgroundColor,
            body: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/Images/BackgroundImage.png"),
                  fit: BoxFit.cover,
                ),
              ),
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: InkWell(
                      onTap: () {
                        Get.to(
                          () => const SkipUnitScreens(),
                        );
                      },
                      child: Container(
                        height: 26,
                        width: 50,
                        margin: const EdgeInsets.only(top: 60, right: 20),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.40),
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: const Center(
                          child: CommonText(
                            text: 'Skip',
                          ),
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: Container(
                      margin: EdgeInsets.only(bottom: 250),
                      height: 132,
                      width: 132,
                      child: Image.asset(
                        "assets/Images/logo.png",
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.9,
                      height: 400,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(15),
                          topLeft: Radius.circular(15),
                        ),
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: AppPadding.defaultPadding,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const SizedBox(
                                  height: 20,
                                ),
                                const CommonText(
                                  text: "Login",
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700,
                                  color: AppColors.primaryColor,
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                const CommonText(
                                  text: "Please enter your details",
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                InputField(
                                  keyboardType: TextInputType.emailAddress,
                                  controller: controller.email,
                                  hintText: "Enter Here",
                                  labelText: "Email",
                                  prefixIcon:
                                      SvgPicture.string(SvgIcons.person),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                InputField(
                                  keyboardType: TextInputType.visiblePassword,
                                  controller: controller.password,
                                  hintText: "Enter Here",
                                  obsecureText: obsecure,
                                  labelText: "Password",
                                  prefixIcon: InkWell(
                                    onTap: () {
                                      setState(() {
                                        obsecure = !obsecure;
                                      });
                                    },
                                    child: SvgPicture.string(SvgIcons.lock),
                                  ),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                const Align(
                                  alignment: Alignment.centerRight,
                                  child: CommonText(
                                    text: "Forgot Password?",
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12,
                                  ),
                                ),
                                const SizedBox(
                                  height: 18,
                                ),
                                AppButton(
                                  isLoading: controller.isloading,
                                  onTap: () async {
                                    setState(() {
                                      controller.isloading = true;
                                    });
                                    await controller.isValidUser();
                                    setState(() {
                                      controller.isloading = false;
                                    });
                                  },
                                  text: 'Login',
                                ),
                                const SizedBox(
                                  height: 25,
                                ),
                                InkWell(
                                  onTap: () {
                                    Get.to(
                                      () => const Register(),
                                    );
                                  },
                                  child: RichText(
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                          text:
                                              'Dont have an account? You can ',
                                          style: GoogleFonts.jost(
                                            color: Colors.black,
                                            fontSize: 12,
                                          ),
                                        ),
                                        TextSpan(
                                          text: 'Register here.',
                                          style: GoogleFonts.jost(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w700,
                                            fontSize: 12,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
