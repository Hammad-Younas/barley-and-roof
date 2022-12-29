import 'package:barley_and_roof/Views/UserViews/AllPropertiesList/SpecificRoom.dart';
import 'package:barley_and_roof/Views/SkipScreens/SkipSpecificRoom/SkipSpecificRoom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../Constants/AppPaddings/AppPadding.dart';
import '../../Constants/Colors/AppColors.dart';
import '../../Constants/Svgs/SvgIcons.dart';
import '../Texts/CommonText.dart';

class PropertiesList extends StatelessWidget {
  String roomTitle, roomLocation, roomImageUrl;
  void Function()? onTap;

  PropertiesList({
    super.key,
    required this.roomImageUrl,
    this.onTap,
    required this.roomLocation,
    required this.roomTitle,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap ??
          () {
            Get.to(
              () => SingleProperty(
                roomName: roomTitle,
                roomImage: roomImageUrl,
                location: roomLocation,
              ),
            );
          },
      child: 
      Container(
        margin: AppPadding.defaultPaddingList,
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: AppColors.primaryColor,
                borderRadius: BorderRadius.circular(12),
                image: DecorationImage(
                  image: NetworkImage(
                    roomImageUrl,
                  ),
                  fit: BoxFit.cover,
                ),
              ),
              height: 181,
              child: Container(),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 3,
                right: 3,
                top: 5,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CommonText(
                        text: roomTitle,
                        fontWeight: FontWeight.w700,
                        fontSize: 20,
                      ),
                      Row(
                        children: [
                          SvgPicture.string(SvgIcons.locationIcon),
                          const SizedBox(
                            width: 5,
                          ),
                          CommonText(
                            text: roomLocation,
                            fontWeight: FontWeight.w500,
                            color: Color(0xff808080),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      const CommonText(
                        text: "\$2.5k",
                        fontWeight: FontWeight.w700,
                        fontSize: 20,
                        color: AppColors.primaryColor,
                      ),
                      Row(
                        children: const [
                          CommonText(
                            text: "per month",
                            fontWeight: FontWeight.w700,
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
  
    );
  }
}
