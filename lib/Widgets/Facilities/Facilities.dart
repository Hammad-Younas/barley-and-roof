import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../Texts/CommonText.dart';

class Facilities extends StatelessWidget {
  String text;
  String svgpic;
  void Function()? ontap;

  Facilities({
    Key? key,
    required this.text,
    required this.svgpic,
    this.ontap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
              color: const Color(0xffEEEEEE),
              borderRadius: BorderRadius.circular(10)),
          height: 60,
          width: MediaQuery.of(context).size.width * 0.17,
          child: InkWell(
            onTap: ontap,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: SvgPicture.string(svgpic),
            ),
          ),
        ),
        const SizedBox(
          height: 7,
        ),
        CommonText(
          text: text,
          fontWeight: FontWeight.w600,
          fontSize: 16,
        ),
      ],
    );
  }
}
