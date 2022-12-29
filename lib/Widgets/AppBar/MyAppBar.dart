import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../Constants/Svgs/SvgIcons.dart';
import '../Texts/CommonText.dart';

class MyAppBar extends StatelessWidget {
  String userName;
  MyAppBar({
    Key? key,
    required this.userName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
      ),
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              SizedBox(
                width: 15,
              ),
              ClipOval(
                child: Image.asset(
                  "assets/Images/profileImage.jpg",
                  fit: BoxFit.cover,
                  height: 45,
                  width: 45,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CommonText(
                    text: userName,
                    fontSize: 17,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                  const CommonText(
                    text: 'Good Morning!',
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff808080),
                  ),
                ],
              ),
            ],
          ),
          Container(
            height: 40,
            width: 40,
            margin: const EdgeInsets.only(right: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: const Color(0xffF4F4F4),
            ),
            child: Center(
              child: SvgPicture.string(SvgIcons.bellIcon),
            ),
          ),
        ],
      ),
    );
  }
}
