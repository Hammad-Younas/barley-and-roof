import 'package:barley_and_roof/Constants/AppPaddings/AppPadding.dart';
import 'package:barley_and_roof/Widgets/AppButton/AppButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:timelines/timelines.dart';

import '../../../Constants/Colors/AppColors.dart';
import '../../../Constants/Svgs/SvgIcons.dart';
import '../../../Widgets/InputFields/InputField.dart';
import '../../../Widgets/Texts/CommonText.dart';
import '../../../Widgets/UserRequests/UserRequests.dart';

class RequestsAdmin extends StatefulWidget {
  const RequestsAdmin({super.key});

  @override
  State<RequestsAdmin> createState() => _RequestsAdminState();
}

class _RequestsAdminState extends State<RequestsAdmin> {
  bool onclick = true;

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
          text: "Requests",
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
          children: [
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20, top: 20),
              child: Container(
                padding: const EdgeInsets.only(left: 10, right: 10),
                height: 150,
                decoration: BoxDecoration(
                    color: const Color(0xffFFFFFF),
                    borderRadius: BorderRadius.circular(12)),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(left: 15, top: 15),
                          child: CommonText(
                            text: "Need New Air Conditioner",
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 15),
                          child: CommonText(
                            text: "Step 1 of 5 (Sumitted request)",
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                            color: Color(0xff808080),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Container(
                            padding: const EdgeInsets.only(left: 10, right: 10),
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
                                      image:
                                          AssetImage("assets/Images/pic2.jpg"),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 3,
                                ),
                                Column(
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
            StepTimelineVertical(
              stepText: "Step 1 of 5",
              updateText: "Request Submitted",
              detailText:
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pharetra ridiculus odio odio turpis velit. Sodales blandit  cursus est non. In placerat eget maecenas.",
            ),
            StepTimelineVertical(
              stepText: "Step 2 of 5",
              updateText: "Looking at the meter",
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
                        children: [
                          DotIndicator(
                            size: 25,
                            color: onclick
                                ? Colors.black
                                : const Color(0xff00BB1E),
                            child: const Icon(
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
                  children: [
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            CommonText(
                              text: "Step 3 of 5",
                              fontWeight: FontWeight.w600,
                              fontSize: 15,
                            ),
                            CommonText(
                              text: "Initiate the process",
                              fontWeight: FontWeight.w600,
                              fontSize: 13,
                              color: Color(0xff555555),
                            ),
                          ],
                        ),
                        const SizedBox(
                          width: 60,
                        ),
                        SizedBox(
                            width: MediaQuery.of(context).size.width * 0.22,
                            child: onclick
                                ? AppButton(
                                    text: "Initiate",
                                    onTap: () {
                                      setState(() {
                                        onclick = false;
                                      });
                                    },
                                  )
                                : Container()),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    onclick
                        ? Container()
                        : Column(
                            children: [
                              SizedBox(
                                height: 160,
                                width: MediaQuery.of(context).size.width * 0.71,
                                child: InputField(
                                    height: 90,
                                    keyboardType: TextInputType.multiline,
                                    maxlines: null,
                                    prefixIcon: Container(),
                                    labelText: "Notes",
                                    hintText: "Enter here"),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.71,
                                  child: AppButton(
                                    text: "Done",
                                    onTap: () {
                                      setState(() {
                                        onclick = true;
                                      });
                                    },
                                  )),
                            ],
                          ),
                    const SizedBox(
                      height: 15,
                    ),
                  ],
                ),
              ],
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
                      text: "Under Process",
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
                      text: "Request Resolved",
                      fontWeight: FontWeight.w600,
                      fontSize: 13,
                      color: Color(0xff555555),
                    ),
                  ],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {},
                  child: Container(
                    height: 49,
                    width: MediaQuery.of(context).size.width * 0.40,
                    decoration: BoxDecoration(
                        color: const Color(0xffFF0000),
                        borderRadius: BorderRadius.circular(12)),
                    child: const Center(
                      child: CommonText(
                        text: "Close Request",
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.40,
                  child: AppButton(
                    text: "Mark as Done",
                    onTap: () {},
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      )),
    );
  }
}

class StepTimelineVertical extends StatelessWidget {
  String? stepText, updateText, detailText;
  StepTimelineVertical({
    Key? key,
    this.stepText,
    this.updateText,
    this.detailText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 130,
          width: 25,
          child: Column(
            children: [
              Row(
                children: const [
                  DotIndicator(
                    size: 25,
                    color: Color(0xff00BB1E),
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
                    height: 100,
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
            CommonText(
              text: stepText ?? "",
              fontWeight: FontWeight.w600,
              fontSize: 15,
            ),
            CommonText(
              text: updateText ?? "",
              fontWeight: FontWeight.w600,
              fontSize: 13,
              color: const Color(0xff555555),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.74,
              child: CommonText(
                text: detailText ?? "",
                fontSize: 13,
                color: const Color(0xff808080),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
