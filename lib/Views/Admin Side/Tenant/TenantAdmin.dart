import 'package:barley_and_roof/Constants/AppPaddings/AppPadding.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:timelines/timelines.dart';

import '../../../Constants/Colors/AppColors.dart';
import '../../../Constants/Svgs/SvgIcons.dart';
import '../../../Widgets/Texts/CommonText.dart';
import '../Requests/RequestsAdmin.dart';

class TenantAdmin extends StatefulWidget {
  const TenantAdmin({super.key});

  @override
  State<TenantAdmin> createState() => _TenantAdminState();
}

class _TenantAdminState extends State<TenantAdmin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appBackgroundColor,
      resizeToAvoidBottomInset: true,
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
          text: "Tenant",
          color: Colors.black,
          fontSize: 20,
          fontWeight: FontWeight.w500,
        ),
        elevation: 0,
        backgroundColor: const Color(0xffFFFFFF),
      ),
      body: SingleChildScrollView(
          child: Container(
        padding: AppPadding.defaultPadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 40),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12)),
                    height: 85,
                    child: const Padding(
                      padding: EdgeInsets.only(top: 15),
                      child: Center(
                          child: CommonText(
                        text: "Jessica Shikaya",
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      )),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: AssetImage("assets/Images/pic2.jpg"),
                          fit: BoxFit.cover),
                    ),
                    height: 78,
                    width: 78,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              padding: const EdgeInsets.only(left: 15, right: 15),
              height: 50,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(12)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  CommonText(
                    text: "Passport No.",
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                  CommonText(
                    text: "47375389JHJ",
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: AppColors.primaryColor,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              padding: const EdgeInsets.only(left: 15, right: 15),
              height: 50,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(12)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  CommonText(
                    text: "Passport Expiry",
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                  CommonText(
                    text: "12 jan 2025",
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: AppColors.primaryColor,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            const CommonText(
              text: "Tenant Flow",
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              padding: const EdgeInsets.only(left: 15, right: 15),
              height: 70,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(12)),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 12,
                      ),
                      Row(
                        children: [
                          const CommonText(
                            text: "New Booking",
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          Container(
                            height: 22,
                            width: MediaQuery.of(context).size.width * 0.24,
                            decoration: BoxDecoration(
                              color: const Color(0xffFFB800),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: const Center(
                              child: CommonText(
                                text: "In Progress",
                                color: Colors.white,
                              ),
                            ),
                          )
                        ],
                      ),
                      const CommonText(
                        text: "Submitted on 12 feb 2023",
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff808080),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            StepTimelineVertical(
              stepText: "Step 1 of 5",
              updateText: "Request Submitted",
              detailText:
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pharetra ridiculus odio odio turpis velit. Sodales blandit  cursus est non. In placerat eget maecenas.",
            ),
            StepTimelineVertical(
              stepText: "Step 2 of 5",
              updateText: "Payment Done",
              detailText:
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pharetra ridiculus odio odio turpis velit. Sodales blandit  cursus est non. In placerat eget maecenas.",
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 100,
                  width: 25,
                  child: Column(
                    children: [
                      Row(
                        children: const [
                          DotIndicator(
                            size: 25,
                            color: Colors.black,
                            child: Icon(
                              Icons.check,
                              color: Color(0xffFFFFFF),
                              size: 18,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          SizedBox(
                            height: 75,
                            child: DashedLineConnector(
                              gap: 4,
                              color: Color(0xff000000),
                              dash: 5,
                              indent: 4,
                              endIndent: 4,
                              direction: Axis.vertical,
                              thickness: 1,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CommonText(
                      text: "Step 3 of 5",
                      fontWeight: FontWeight.w600,
                      fontSize: 15,
                    ),
                    const CommonText(
                      text: "User Document",
                      fontWeight: FontWeight.w600,
                      fontSize: 13,
                      color: Color(0xff555555),
                    ),
                    const SizedBox(
                      height: 7,
                    ),
                    Row(
                      children: [
                        Container(
                          height: 49,
                          width: MediaQuery.of(context).size.width * 0.36,
                          decoration: BoxDecoration(
                              color: AppColors.primaryColor,
                              borderRadius: BorderRadius.circular(15)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.string(SvgIcons.workpass),
                              const Padding(
                                padding: EdgeInsets.only(left: 4),
                                child: CommonText(text: "Workpass"),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Container(
                          height: 49,
                          width: MediaQuery.of(context).size.width * 0.36,
                          decoration: BoxDecoration(
                              color: AppColors.primaryColor,
                              borderRadius: BorderRadius.circular(15)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.string(SvgIcons.passport),
                              const Padding(
                                padding: EdgeInsets.only(left: 4),
                                child: CommonText(text: "Passport"),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 100,
                  width: 25,
                  child: Column(
                    children: [
                      Row(
                        children: const [
                          DotIndicator(
                            size: 25,
                            color: Colors.black,
                            child: Icon(
                              Icons.check,
                              color: Color(0xffFFFFFF),
                              size: 18,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          SizedBox(
                            height: 75,
                            child: DashedLineConnector(
                              gap: 4,
                              color: Color(0xff000000),
                              dash: 5,
                              indent: 4,
                              endIndent: 4,
                              direction: Axis.vertical,
                              thickness: 1,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    CommonText(
                      text: "Step 4 of 5",
                      fontWeight: FontWeight.w600,
                      fontSize: 15,
                    ),
                    CommonText(
                      text: "Full Payment",
                      fontWeight: FontWeight.w600,
                      fontSize: 13,
                      color: Color(0xff555555),
                    ),
                  ],
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 80,
                  width: 25,
                  child: Column(
                    children: [
                      Row(
                        children: const [
                          DotIndicator(
                            size: 25,
                            color: Colors.black,
                            child: Icon(
                              Icons.check,
                              color: Color(0xffFFFFFF),
                              size: 18,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    CommonText(
                      text: "Step 5 of 5",
                      fontWeight: FontWeight.w600,
                      fontSize: 15,
                    ),
                    CommonText(
                      text: "Booking Done",
                      fontWeight: FontWeight.w600,
                      fontSize: 13,
                      color: Color(0xff555555),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      )),
    );
  }
}
