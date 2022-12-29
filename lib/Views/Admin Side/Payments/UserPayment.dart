import 'package:barley_and_roof/Constants/AppPaddings/AppPadding.dart';
import 'package:barley_and_roof/Widgets/AppButton/AppButton.dart';
import 'package:barley_and_roof/Widgets/InputFields/InputField.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../Constants/Colors/AppColors.dart';
import '../../../Constants/Svgs/SvgIcons.dart';
import '../../../Widgets/Texts/CommonText.dart';

class Payments extends StatefulWidget {
  Payments({
    super.key,
  });

  @override
  State<Payments> createState() => _PaymentsacceptState();
}

class _PaymentsacceptState extends State<Payments> {
  bool hasFocus = false;

  FocusNode focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appBackgroundColor,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(16.0),
          child: InkWell(
            onTap: () {
              Get.back();
            },
            child: SvgPicture.string(
              SvgIcons.backArrow,
              height: 30,
            ),
          ),
        ),
        centerTitle: true,
        title: const CommonText(
          text: "Payment",
          color: Colors.black,
          fontSize: 20,
          fontWeight: FontWeight.w500,
        ),
        elevation: 0,
        backgroundColor: const Color(0xffFFFFFF),
      ),
      body: Column(
        children: [
          Container(
            margin: AppPadding.defaultPadding,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 20, top: 20),
                  child: Container(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    height: 70,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              height: 46,
                              width: 46,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image: AssetImage("assets/Images/pic1.jpg"),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 3,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 2),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const CommonText(
                                    text: "nameText",
                                    fontWeight: FontWeight.w600,
                                    fontSize: 15,
                                  ),
                                  Row(
                                    children: [
                                      SvgPicture.string(SvgIcons.locationIcon),
                                      const SizedBox(
                                        width: 2,
                                      ),
                                      const CommonText(
                                        text: "addressText",
                                        fontWeight: FontWeight.w600,
                                        fontSize: 12,
                                        color: const Color(0xff808080),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const CommonText(
                              text: "yg",
                              fontWeight: FontWeight.w600,
                              fontSize: 18,
                              color: AppColors.primaryColor,
                            ),
                            Row(
                              children: [
                                SvgPicture.string(SvgIcons.locationIcon),
                                const SizedBox(
                                  width: 2,
                                ),
                                const CommonText(
                                  text: "timeText",
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12,
                                  color: Color(0xffC5C5C5),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const CommonText(
                  text: "Mark Payment as Paid",
                  fontSize: 20,
                  color: AppColors.primaryColor,
                  fontWeight: FontWeight.w500,
                ),
                const CommonText(
                  text: "Please enter details",
                  fontSize: 15,
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
                const SizedBox(
                  height: 10,
                ),
                InputField(
                    prefixIcon: Container(),
                    keyboardType: TextInputType.phone,
                    labelText: "Select Date of the Payment Recieved",
                    hintText: "DD MM YYYY"),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 160,
                  child: InputField(
                      height: 90,
                      keyboardType: TextInputType.multiline,
                      maxlines: null,
                      prefixIcon: Container(),
                      labelText: "Notes",
                      hintText: "Enter here"),
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ],
      ),
      bottomSheet: Padding(
        padding: const EdgeInsets.only(left: 25, right: 25, bottom: 30),
        child: AppButton(text: "Mark as Paid"),
      ),
    );
  }
}
