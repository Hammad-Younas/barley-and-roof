import 'package:barley_and_roof/Constants/AppPaddings/AppPadding.dart';
import 'package:barley_and_roof/Views/UserViews/Login/Login.dart';
import 'package:barley_and_roof/Widgets/AppButton/AppButton.dart';
import 'package:barley_and_roof/Widgets/PropertyLists/PropertiesLists.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:readmore/readmore.dart';
import '../../../Constants/Colors/AppColors.dart';
import '../../../Constants/Svgs/SvgIcons.dart';
import '../../../Widgets/Facilities/Facilities.dart';
import '../../../Widgets/Texts/CommonText.dart';

class SingleProperty extends StatefulWidget {
  String roomName, roomImage, location;
  List<Widget>? actions;

  SingleProperty({
    super.key,
    required this.location,
    required this.roomImage,
    required this.roomName,
    this.actions,
  });

  @override
  State<SingleProperty> createState() => _SkipSpecificRoomState();
}

class _SkipSpecificRoomState extends State<SingleProperty> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Get.back();
          },
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SvgPicture.string(
              SvgIcons.backArrow,
              height: 30,
            ),
          ),
        ),
        centerTitle: true,
        title: SizedBox(
          width: MediaQuery.of(context).size.width * 0.30,
          child: Row(
            children: [
              CommonText(
                text: widget.roomName,
                color: Colors.black,
                fontWeight: FontWeight.w600,
              ),
              SvgPicture.string(SvgIcons.downArrow),
            ],
          ),
        ),
        actions: widget.actions ??
            [
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: InkWell(
                  onTap: () {
                    Get.offAll(
                      () => Login(),
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: AppColors.primaryColor,
                        borderRadius: BorderRadius.circular(28)),
                    width: MediaQuery.of(context).size.width * 0.17,
                    child: const Center(
                      child: CommonText(text: "Login"),
                    ),
                  ),
                ),
              ),
            ],
        elevation: 0,
        backgroundColor: const Color(0xffFFFFFF),
      ),
      body: SingleChildScrollView(
        child: SpecificRoomWidget(
          onTap: () {
            Get.offAll(() => Login());
          },
          location: widget.location,
          roomImage: widget.roomImage,
          roomName: widget.roomName,
        ),
      ),
  
  
    );
  }
}

class SpecificRoomWidget extends StatelessWidget {
  String roomName, location;
  String roomImage;
  void Function()? onTap;
  bool showBookingButton;
  SpecificRoomWidget({
    Key? key,
    required this.location,
    required this.roomImage,
    required this.roomName,
    this.onTap,
    this.showBookingButton = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        PropertiesList(
          roomImageUrl: roomImage,
          roomTitle: roomName,
          roomLocation: location,
        ),
        const SizedBox(
          height: 20,
        ),
        Container(
          margin: AppPadding.defaultPadding,
          child: 
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CommonText(
                text: "About Property",
                fontWeight: FontWeight.w600,
                fontSize: 20,
              ),
              const SizedBox(
                height: 10,
              ),
              ReadMoreText(
                'Featuring a bar, Grandi by Center Hotels is  in Reykjavík in the Reykvik Greater region, 2.4km from Solfar Sun Voyager and 2.6 km from the Hallgrímskirkja Church. Among the facilities of this property are a restaurant, a 24-hour.Out of formation pool after the myth.CCinema located ate this location after these these pictures.Lets go their.  ',
                trimLines: 5,
                preDataTextStyle: GoogleFonts.jost(fontWeight: FontWeight.w700),
                style: GoogleFonts.jost(color: Colors.black),
                colorClickableText: AppColors.primaryColor,
                trimMode: TrimMode.Line,
                trimCollapsedText: '...Read more',
                trimExpandedText: ' Show less',
              ),
              const SizedBox(
                height: 20,
              ),
              const CommonText(
                text: "Facilities",
                fontWeight: FontWeight.w600,
                fontSize: 20,
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Facilities(
                    text: " Free Wifi",
                    svgpic: SvgIcons.wifi,
                  ),
                  Facilities(
                    text: " Parking",
                    svgpic: SvgIcons.parking,
                  ),
                  Facilities(
                    text: " Laundary",
                    svgpic: SvgIcons.laundary,
                  ),
                  Facilities(
                    text: " Pool",
                    svgpic: SvgIcons.pool,
                  ),
                ],
              ),
              const SizedBox(
                height: 35,
              ),
              showBookingButton
                  ? AppButton(
                      isLoading: false,
                      text: "Book Room",
                      onTap: onTap,
                    )
                  : Container(),
              const SizedBox(
                height: 8,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 49,
                    width: 48,
                    decoration: BoxDecoration(
                        color: const Color(0xff000000),
                        borderRadius: BorderRadius.circular(12)),
                    child: Center(
                      child: SvgPicture.string(SvgIcons.mapIcon),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.69,
                    height: 49,
                    decoration: BoxDecoration(
                        color: const Color(0xff00BB1E),
                        borderRadius: BorderRadius.circular(12)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.string(SvgIcons.whatsapp),
                        const SizedBox(
                          width: 3,
                        ),
                        const CommonText(
                          text: "Whatsapp Agent",
                          fontSize: 16,
                          color: Colors.white,
                        )
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
      
        ),
      ],
    );
  }
}
