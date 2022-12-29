import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../Constants/Colors/AppColors.dart';
import '../../Constants/Svgs/SvgIcons.dart';
import '../Texts/CommonText.dart';

class User_Requests extends StatelessWidget {
  double? width;
  String? nameText, addressText, priceText, timeText;
  Color color;
  ImageProvider? pic2;
  void Function()? ontap;

  User_Requests({
    Key? key,
    required this.color,
    this.nameText = "",
    this.addressText = "",
    this.priceText = "",
    this.timeText = "",
    this.pic2,
    this.width,
    this.ontap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: ontap,
          child: Container(
            padding: const EdgeInsets.only(left: 10, right: 10),
            width: width,
            height: 70,
            decoration: BoxDecoration(
                color: color, borderRadius: BorderRadius.circular(12)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      height: 46,
                      width: 46,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          fit: BoxFit.fill,
                          image: pic2!,
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
                          CommonText(
                            text: nameText ?? "",
                            fontWeight: FontWeight.w600,
                            fontSize: 15,
                          ),
                          Row(
                            children: [
                              SvgPicture.string(SvgIcons.locationIcon),
                              const SizedBox(
                                width: 2,
                              ),
                              CommonText(
                                text: addressText ?? "",
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
                    CommonText(
                      text: priceText ?? "",
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
                        CommonText(
                          text: timeText ?? "",
                          fontWeight: FontWeight.w600,
                          fontSize: 12,
                          color: const Color(0xffC5C5C5),
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
