import 'package:barley_and_roof/Constants/AppPaddings/AppPadding.dart';
import 'package:barley_and_roof/Constants/Colors/AppColors.dart';
import 'package:barley_and_roof/Constants/Svgs/SvgIcons.dart';
import 'package:barley_and_roof/Widgets/AppButton/AppButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../Widgets/Texts/CommonText.dart';

class BookRoom extends StatelessWidget {
  const BookRoom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: const Icon(Icons.arrow_back),
        title: const Text("Book Room"),
        centerTitle: true,
      ),
      body: Padding(
        padding: AppPadding.defaultPadding,
        child: Column(
          children: [
            SizedBox(
              height: 15,
            ),
            Row(
              children: const [
                CommonText(
                  text: "Enter Details",
                  fontSize: 17,
                  fontWeight: FontWeight.w500,
                  color: AppColors.primaryColor,
                ),
              ],
            ),
            Row(
              children: const [
                CommonText(
                  text: "Step 1 of 3",
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 49,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Color(0xffeeeeee)),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CommonText(
                          text: "Commerence Date",
                          fontSize: 10,
                          fontWeight: FontWeight.w500,
                          color: AppColors.primaryColor,
                        ),
                        CommonText(
                          text: "DD MM YYYY",
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ],
                    ),
                    CommonText(
                      text: "*Max 1 Week",
                      fontSize: 10,
                      fontWeight: FontWeight.w500,
                      color: Color(0xffb8b8b8),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 111,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: Color(0xffeeeeee),
                ),
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.string(SvgIcons.workpass),
                    SizedBox(
                      height: 10,
                    ),
                    const CommonText(
                      text: "Upload Workpass",
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 111,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: Color(0xffeeeeee),
                ),
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.string(SvgIcons.passport),
                    SizedBox(
                      height: 10,
                    ),
                    const CommonText(
                      text: "Upload Passport",
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              child: SizedBox(),
            ),
            AppButton(text: "Next"),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
