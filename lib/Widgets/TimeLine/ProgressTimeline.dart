import 'package:flutter/material.dart';
import 'package:timelines/timelines.dart';

class ProgressTimeLine extends StatelessWidget {
  Color color1, color2, color3, color4, color5;
  ProgressTimeLine({
    required this.color1,
    required this.color2,
    required this.color3,
    required this.color4,
    required this.color5,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TimeLineWidget(
          colorcircle: color1,
        ),
        TimeLineWidget(
          colorcircle: color2,
        ),
        TimeLineWidget(
          colorcircle: color3,
        ),
        TimeLineWidget(
          colorcircle: color4,
        ),
        DotIndicator(
          color: color5,
        )
      ],
    );
  }
}

class TimeLineWidget extends StatelessWidget {
  Color colorcircle;
  TimeLineWidget({
    Key? key,
    required this.colorcircle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TimelineTheme(
          data: TimelineThemeData.fallback(),
          child: DotIndicator(
            color: colorcircle,
          ),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.13,
          child: const DashedLineConnector(
            gap: 4,
            color: Color(0xff000000),
            dash: 2,
            indent: 4,
            endIndent: 4,
            direction: Axis.horizontal,
            thickness: 2,
          ),
        ),
      ],
    );
  }
}
