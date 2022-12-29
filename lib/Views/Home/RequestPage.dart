import 'package:barley_and_roof/Constants/AppPaddings/AppPadding.dart';
import 'package:barley_and_roof/Views/Home/HomePage.dart';
import 'package:barley_and_roof/Widgets/AppButton/AppButton.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Widgets/Texts/CommonText.dart';
import '../../Widgets/TimeLine/ProgressTimeline.dart';

class RequestPage extends StatelessWidget {
  const RequestPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppPadding.defaultPadding,
      child: Column(
        children: [
          SizedBox(
            height: 15,
          ),
          Row(
            children: const [
              CommonText(
                text: "My Current Requests",
                fontSize: 17,
                fontWeight: FontWeight.w500,
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          progressRequest(),
          SizedBox(
            height: 20,
          ),
          Row(
            children: const [
              CommonText(
                text: "Previous Requests",
                fontSize: 17,
                fontWeight: FontWeight.w500,
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          PreviousRequest(
            color1: Colors.green,
            color2: Colors.green,
            color3: Colors.green,
            color4: Colors.green,
            color5: Colors.green,
            servicename: 'Stove Issue',
            status: 'Completed',
            Date: 'Stove issue was resolved on 12 jan 2022',
            boxwidth: 79,
            boxcolor: Colors.green.withOpacity(0.11),
            boxtextcolor: Colors.green,
          ),
          SizedBox(
            height: 10,
          ),
          PreviousRequest(
            color1: Colors.green,
            color2: Colors.green,
            color3: Colors.red,
            color4: Colors.red,
            color5: Colors.red,
            servicename: 'Need New Air Fryer',
            status: 'Not Completed',
            Date: 'Admin said its not part of agreement',
            boxwidth: 103,
            boxcolor: Colors.red.withOpacity(0.11),
            boxtextcolor: Colors.red,
          ),
          Expanded(child: SizedBox()),
          AppButton(text: 'Request a Service'),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}

class PreviousRequest extends StatelessWidget {
  Color color1, color2, color3, color4, color5;
  String servicename, status, Date;
  Color boxcolor, boxtextcolor;
  double boxwidth;
  PreviousRequest({
    Key? key,
    required this.color1,
    required this.color2,
    required this.color3,
    required this.color4,
    required this.color5,
    required this.servicename,
    required this.status,
    required this.Date,
    required this.boxwidth,
    required this.boxcolor,
    required this.boxtextcolor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 97,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Color(0xffeeeeee))),
      child: Padding(
        padding: const EdgeInsets.only(left: 18.0, right: 18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Text(
                  servicename,
                  style: GoogleFonts.jost(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Container(
                  height: 20,
                  width: boxwidth,
                  decoration: BoxDecoration(
                      color: boxcolor, borderRadius: BorderRadius.circular(5)),
                  child: Center(
                    child: Text(
                      status,
                      style: GoogleFonts.jost(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: boxtextcolor,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Text(
              Date,
              style: GoogleFonts.jost(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: Color(0xff808080),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ProgressTimeLine(
                  color1: color1,
                  color2: color2,
                  color3: color3,
                  color4: color4,
                  color5: color5,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
