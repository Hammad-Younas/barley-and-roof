import 'package:barley_and_roof/Constants/AppPaddings/AppPadding.dart';
import 'package:barley_and_roof/Constants/Colors/AppColors.dart';
import 'package:barley_and_roof/Constants/Svgs/SvgIcons.dart';
import 'package:barley_and_roof/Views/Admin%20Side/Payments/UserPayment.dart';
import 'package:barley_and_roof/Widgets/Texts/CommonText.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../Widgets/TimeLine/ProgressTimeline.dart';
import '../../Widgets/UserRequests/UserRequests.dart';

class Admin extends StatefulWidget {
  const Admin({super.key});

  @override
  State<Admin> createState() => _AdminState();
}

class _AdminState extends State<Admin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appBackgroundColor,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70.0), // here the desired height
        child: AppBar(
          backgroundColor: const Color(0xffFFFFFF),
          elevation: 0.0,
          leading: Padding(
            padding: const EdgeInsets.only(left: 12, top: 8),
            child: Container(
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage("assets/Images/pic1.jpg"),
                ),
              ),
            ),
          ),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Padding(
                padding: EdgeInsets.only(top: 10),
                child: CommonText(
                  text: "Hi Admin",
                  fontWeight: FontWeight.w500,
                ),
              ),
              CommonText(
                text: "Good Morning",
                color: Color(0xff808080),
                fontSize: 12,
              )
            ],
          ),
          actions: [
            InkWell(
              onTap: () {},
              child: Container(
                margin: AppPadding.defaultPadding,
                height: 40,
                width: 40,
                decoration: const BoxDecoration(
                    color: Color(0xffF4F4F4), shape: BoxShape.circle),
                child: Center(
                  child: SvgPicture.string(SvgIcons.bellIcon),
                ),
              ),
            )
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: AppPadding.defaultPadding,
          child: Column(
            children: [
              Row_spacebetween(
                text1: 'Upcoming Payments',
                text2: 'See All',
              ),
              Column(
                children: List.generate(3, (index) {
                  return User_Requests(
                    ontap: () {
                      Get.to(Payments());
                    },
                    nameText: "Joshua Milian",
                    addressText: "Empire Buildings 628",
                    color: const Color(0xffFFFFFF),
                    priceText: "\$2.5k",
                    timeText: "In 3 days",
                    pic2: const AssetImage("assets/Images/pic1.jpg"),
                  );
                }),
              ),
              Row_spacebetween(
                text1: 'Tenants Requests',
                text2: 'See All',
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 20, top: 20),
                child: Container(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  height: 160,
                  decoration: BoxDecoration(
                      color: const Color(0xffFFFFFF),
                      borderRadius: BorderRadius.circular(12)),
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(left: 10, top: 3),
                            child: CommonText(
                              text: "Door Lock is Broken",
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(left: 10),
                            child: CommonText(
                              text: "Step 3 of 5 (Initiated the process)",
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                              color: Color(0xff808080),
                            ),
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          ProgressTimeLine(
                            color1: const Color(0xff00BB1E),
                            color2: const Color(0xff00BB1E),
                            color3: const Color(0xff00BB1E),
                            color4: const Color(0xff000000),
                            color5: const Color(0xff000000),
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: Container(
                              padding:
                                  const EdgeInsets.only(left: 10, right: 10),
                              height: 60,
                              width: MediaQuery.of(context).size.width * 0.69,
                              decoration: BoxDecoration(
                                  color: const Color(0xffF2F2F2),
                                  borderRadius: BorderRadius.circular(12)),
                              child: Row(
                                children: [
                                  Container(
                                    height: 46,
                                    width: 46,
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                        fit: BoxFit.fill,
                                        image: AssetImage(
                                            "assets/Images/pic2.jpg"),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 3,
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const CommonText(
                                        text: "nameText",
                                        fontWeight: FontWeight.w600,
                                        fontSize: 15,
                                      ),
                                      Row(
                                        children: [
                                          SvgPicture.string(
                                              SvgIcons.locationIcon),
                                          const SizedBox(
                                            width: 2,
                                          ),
                                          const CommonText(
                                            text: "addressText",
                                            fontWeight: FontWeight.w600,
                                            fontSize: 12,
                                            color: Color(0xff808080),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 20, top: 20),
                child: Container(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  height: 160,
                  decoration: BoxDecoration(
                      color: const Color(0xffFFFFFF),
                      borderRadius: BorderRadius.circular(12)),
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(left: 10, top: 3),
                            child: CommonText(
                              text: "Need New Air Conditioner",
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(left: 10),
                            child: CommonText(
                              text: "Step 1 of 5 (Sumitted request)",
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                              color: Color(0xff808080),
                            ),
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          ProgressTimeLine(
                            color1: const Color(0xff00BB1E),
                            color2: const Color(0xff000000),
                            color3: const Color(0xff000000),
                            color4: const Color(0xff000000),
                            color5: const Color(0xff000000),
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: Container(
                              padding:
                                  const EdgeInsets.only(left: 10, right: 10),
                              height: 60,
                              width: MediaQuery.of(context).size.width * 0.69,
                              decoration: BoxDecoration(
                                  color: const Color(0xffF2F2F2),
                                  borderRadius: BorderRadius.circular(12)),
                              child: Row(
                                children: [
                                  Container(
                                    height: 46,
                                    width: 46,
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                        fit: BoxFit.fill,
                                        image: AssetImage(
                                            "assets/Images/pic2.jpg"),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 3,
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const CommonText(
                                        text: "nameText",
                                        fontWeight: FontWeight.w600,
                                        fontSize: 15,
                                      ),
                                      Row(
                                        children: [
                                          SvgPicture.string(
                                              SvgIcons.locationIcon),
                                          const SizedBox(
                                            width: 2,
                                          ),
                                          const CommonText(
                                            text: "addressText",
                                            fontWeight: FontWeight.w600,
                                            fontSize: 12,
                                            color: Color(0xff808080),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Row_spacebetween(
                text1: 'Tenants Moving In Next 3 Days',
                text2: 'See All',
              ),
              Column(
                children: List.generate(4, (index) {
                  return Tenants_widget();
                }),
              ),
              Row_spacebetween(text1: "My Units", text2: "See All"),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    const SizedBox(
                      width: 15,
                    ),
                    Column(
                      children: [
                        Container(
                          height: 104,
                          width: 200,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            image: const DecorationImage(
                                image: AssetImage("assets/Images/room1.jpg"),
                                fit: BoxFit.cover),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: 150,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const CommonText(
                                    text: "Common Flats",
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  Row(
                                    children: [
                                      SvgPicture.string(SvgIcons.locationIcon),
                                      const CommonText(
                                        text: "Empire Buildings 628",
                                        fontSize: 12,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                CommonText(
                                  text: "\$2.5k",
                                  color: AppColors.primaryColor,
                                  fontSize: 15,
                                ),
                                CommonText(
                                  text: "Per Month",
                                  color: Color(0xffC5C5C5),
                                  fontSize: 11,
                                ),
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Column(
                      children: [
                        Container(
                          height: 104,
                          width: 200,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            image: const DecorationImage(
                              image: AssetImage("assets/Images/room2.jpg"),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: 150,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const CommonText(
                                    text: "Common Flats",
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  Row(
                                    children: [
                                      SvgPicture.string(SvgIcons.locationIcon),
                                      const CommonText(
                                        text: "Empire Buildings 628",
                                        fontSize: 12,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                CommonText(
                                  text: "\$2.5k",
                                  color: AppColors.primaryColor,
                                  fontSize: 15,
                                ),
                                CommonText(
                                  text: "Per Month",
                                  color: Color(0xffC5C5C5),
                                  fontSize: 11,
                                ),
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Tenants_widget extends StatelessWidget {
  const Tenants_widget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Container(
        padding: const EdgeInsets.only(left: 10, right: 10),
        height: 70,
        decoration: BoxDecoration(
            color: const Color(0xffFFFFFF),
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
                      image: AssetImage("assets/Images/pic2.jpg"),
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
            const CommonText(
              text: "In 1 day",
              color: Color(0xffC5C5C5),
              fontSize: 13,
              fontWeight: FontWeight.w500,
            )
          ],
        ),
      ),
    );
  }
}

class Row_spacebetween extends StatelessWidget {
  String text1;
  String text2;
  void Function()? ontap;
  Row_spacebetween({
    Key? key,
    required this.text1,
    required this.text2,
    this.ontap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CommonText(
            text: text1,
            fontSize: 17,
            fontWeight: FontWeight.w600,
          ),
          InkWell(
            onTap: ontap,
            child: CommonText(
              text: text2,
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: AppColors.primaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
