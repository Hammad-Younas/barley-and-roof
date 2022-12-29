import 'package:barley_and_roof/Widgets/UserRequests/UserRequests.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:readmore/readmore.dart';
import '../../../../Constants/Svgs/SvgIcons.dart';
import '../../../../Widgets/Texts/CommonText.dart';
import '../../../Constants/AppPaddings/AppPadding.dart';
import '../../../Constants/Colors/AppColors.dart';
import '../../../Widgets/Facilities/Facilities.dart';

class AdminSpecificRoom extends StatelessWidget {
  // BookRoomsServices bookRoomsServices = BookRoomsServices();
  // String roomName, roomImage, location;
  // bool showBookingButton;

  AdminSpecificRoom({
    super.key,

    // required this.roomName,
    // required this.roomImage,
    // required this.location,
    // this.showBookingButton = true,
  });

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
              const CommonText(
                text: "room1",
                color: Colors.black,
                fontWeight: FontWeight.w600,
              ),
              SvgPicture.string(SvgIcons.downArrow),
            ],
          ),
        ),
        elevation: 0,
        backgroundColor: const Color(0xffFFFFFF),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: AppPadding.defaultPaddingList,
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.circular(12),
                  image: const DecorationImage(
                    image: NetworkImage(
                      "https://media.istockphoto.com/id/1026205392/photo/beautiful-luxury-home-exterior-at-twilight.jpg?s=612x612&w=0&k=20&c=HOCqYY0noIVxnp5uQf1MJJEVpsH_d4WtVQ6-OwVoeDo=",
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
                        const CommonText(
                          text: "const",
                          fontWeight: FontWeight.w700,
                          fontSize: 20,
                        ),
                        Row(
                          children: [
                            SvgPicture.string(SvgIcons.locationIcon),
                            const SizedBox(
                              width: 5,
                            ),
                            const CommonText(
                              text: "roomLocation",
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
                    preDataTextStyle:
                        GoogleFonts.jost(fontWeight: FontWeight.w700),
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
                  const CommonText(
                    text: "Tenants",
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                  Column(
                    children: List.generate(3, (index) {
                      return User_Requests(
                        nameText: "Joshua Milian",
                        addressText: "Empire Buildings 628",
                        color: Colors.white,
                        priceText: "\$2.5k",
                        timeText: "In 3 days",
                        pic2: const AssetImage("assets/Images/pic2.jpg"),
                      );
                    }),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
