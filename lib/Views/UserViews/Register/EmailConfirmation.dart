import 'package:barley_and_roof/Controllers/Register/RegisterController.dart';
import 'package:barley_and_roof/Utils/snackbar.dart';
import 'package:barley_and_roof/Views/UserViews/AllPropertiesList/AllProperties.dart';
import 'package:barley_and_roof/Views/Home/HomePage.dart';
import 'package:barley_and_roof/Widgets/AppButton/AppButton.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pinput/pinput.dart';

import '../../../Constants/Colors/AppColors.dart';
import '../../../Constants/Svgs/SvgIcons.dart';
import '../../../Models/UserModel/UserModel.dart';
import '../../../Widgets/Texts/CommonText.dart';

class EmailConfirmation extends StatefulWidget {
  final String verificationId;
  String phoneNo;
  EmailConfirmation({
    Key? key,
    required this.verificationId,
    required this.phoneNo,
  }) : super(key: key);

  @override
  State<EmailConfirmation> createState() => _EmailConfirmationState();
}

class _EmailConfirmationState extends State<EmailConfirmation> {
  UserModel userModel = UserModel();

  getUserData() async {
    String? email = await FirebaseAuth.instance.currentUser?.email;
    var res = await FirebaseFirestore.instance
        .collection("UsersData")
        .doc(email)
        .get();
    userModel = UserModel.fromJson(res.data()!);

    return userModel;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  TextEditingController pinController = TextEditingController();

  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
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
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                height: 10,
              ),
              const CommonText(
                text: "OTP Confirmation",
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: AppColors.primaryColor,
              ),
              const SizedBox(
                height: 5.0,
              ),
              CommonText(
                text:
                    "We have sent a 6 digit code on your ${widget.phoneNo} please enter that to verify the account.",
                fontSize: 15,
                fontWeight: FontWeight.w500,
              ),
              SizedBox(
                height: height * 0.1,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: SizedBox(
                  width: width,
                  child: Pinput(
                    controller: pinController,
                    length: 6,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    defaultPinTheme: PinTheme(
                      height: 50,
                      width: 43,
                      textStyle: GoogleFonts.urbanist(
                        fontSize: 24.0,
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.white,
                        border: Border.all(
                          color: Colors.black.withOpacity(0.5),
                          width: 1.0,
                        ),
                      ),
                    ),
                    focusedPinTheme: PinTheme(
                      height: 50,
                      width: 43,
                      textStyle: GoogleFonts.nunitoSans(
                        fontSize: 24.0,
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.white,
                        border: Border.all(
                          color: Colors.black,
                          width: 1.0,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              InkWell(
                onTap: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(
                      Icons.replay,
                      size: 14,
                    ),
                    CommonText(
                      text: 'Resend Code',
                      fontSize: 13.0,
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
                  ],
                ),
              ),
              const Expanded(
                child: SizedBox(),
              ),
              GetBuilder<RegisterController>(
                init: RegisterController(),
                builder: (controller) {
                  return AppButton(
                    onTap: () async {
                      setState(() {
                        controller.isloading = true;
                      });
                      try {
                        var res = await PhoneAuthProvider.credential(
                          verificationId: widget.verificationId,
                          smsCode: pinController.text,
                        );

                        await controller.registerAUser();
                        await getUserData();
                        Get.offAll(
                          () => HomePage(
                            userName: userModel.name!,
                            email: userModel.email!,
                          ),
                        );
                      } catch (e) {
                        String txt = e.toString();
                        String substring = txt.substring(txt.indexOf("]") + 1);
                        Utils().snacbar(
                            "Error", "Please Enter Correct OTP $substring");
                      }
                      setState(() {
                        controller.isloading = false;
                      });
                    },
                    isLoading: controller.isloading,
                    text: 'Done',
                  );
                },
              ),
              const SizedBox(
                height: 16.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
