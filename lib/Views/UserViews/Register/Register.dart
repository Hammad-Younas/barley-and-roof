import 'package:barley_and_roof/Constants/AppPaddings/AppPadding.dart';
import 'package:barley_and_roof/Constants/Colors/AppColors.dart';
import 'package:barley_and_roof/Constants/Svgs/SvgIcons.dart';
import 'package:barley_and_roof/Controllers/Register/RegisterController.dart';
import 'package:barley_and_roof/Widgets/InputFields/InputField.dart';
import 'package:barley_and_roof/Widgets/InputFields/PhoneField.dart';
import 'package:barley_and_roof/Widgets/Texts/CommonText.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../Widgets/AppButton/AppButton.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  bool isLoading = false;
  bool obsecure = true;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RegisterController>(
        init: RegisterController(),
        builder: (controller) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              elevation: 0,
              leading: InkWell(
                onTap: () {
                  Get.back();
                },
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: SvgPicture.string(
                    SvgIcons.backArrow,
                    height: 30,
                  ),
                ),
              ),
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: AppPadding.defaultPadding,
                child: SizedBox(
                  height: Get.height * 0.89,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      const CommonText(
                        text: "Register",
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: AppColors.primaryColor,
                      ),
                      const CommonText(
                        text: "Please enter your details",
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      InputField(
                        controller: controller.name,
                        prefixIcon: SvgPicture.string(SvgIcons.person),
                        labelText: 'Full Name',
                        hintText: 'Enter here',
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      InputField(
                        controller: controller.email,
                        prefixIcon: SvgPicture.string(SvgIcons.mail),
                        labelText: 'Email',
                        hintText: 'Enter here',
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      PhoneField(
                        onTap: () {
                          controller.selectPhoneNo(context);
                        },
                        prefixIcon: SvgPicture.string(SvgIcons.phone),
                        labelText: "Phone",
                        phone: controller.phoneNo,
                        hintText: "Enter here",
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      InputField(
                        keyboardType: TextInputType.number,
                        controller: controller.age,
                        prefixIcon: SvgPicture.string(SvgIcons.calendar),
                        labelText: 'Age',
                        hintText: 'Enter here',
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      InputField(
                        controller: controller.occupation,
                        prefixIcon: SvgPicture.string(SvgIcons.occupation),
                        labelText: 'Occupation',
                        hintText: 'Enter here',
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      InputField(
                        obsecureText: obsecure,
                        controller: controller.password,
                        prefixIcon: InkWell(
                          onTap: () {
                            setState(() {
                              obsecure = !obsecure;
                            });
                          },
                          child: SvgPicture.string(SvgIcons.lock),
                        ),
                        labelText: 'Password',
                        hintText: 'Enter here',
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      InputField(
                        obsecureText: obsecure,
                        controller: controller.confirmPassword,
                        prefixIcon: InkWell(
                          onTap: () {
                            setState(() {
                              obsecure = !obsecure;
                            });
                          },
                          child: SvgPicture.string(SvgIcons.lock),
                        ),
                        labelText: 'Confirm Password',
                        hintText: 'Enter here',
                      ),
                      Row(
                        children: [
                          Checkbox(
                            value: controller.checkValue,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6),
                            ),
                            onChanged: (value) {
                              controller.changeCheckValue(value);
                            },
                            activeColor: AppColors.primaryColor,
                          ),
                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: 'I accept the ',
                                  style: GoogleFonts.jost(
                                    color: Colors.black,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                TextSpan(
                                  text: 'Terms & Condtions',
                                  style: GoogleFonts.jost(
                                    color: Colors.black,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                    decoration: TextDecoration.underline,
                                  ),
                                ),
                                TextSpan(
                                  text: ' an ',
                                  style: GoogleFonts.jost(
                                    color: Colors.black,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                TextSpan(
                                  text: 'Privacy Policy.',
                                  style: GoogleFonts.jost(
                                    color: Colors.black,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                    decoration: TextDecoration.underline,
                                    decorationColor: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const Expanded(
                        child: SizedBox(),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: AppButton(
                          onTap: () async {
                            setState(() {
                              isLoading = true;
                            });

                            await controller.isValidUser();
                            setState(() {
                              isLoading = false;
                            });
                          },
                          isLoading: isLoading,
                          text: 'Next',
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}
