import 'package:barley_and_roof/Services/RoomsServices/BookRooms.dart';
import 'package:barley_and_roof/Views/SkipScreens/SkipSpecificRoom/SkipSpecificRoom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../../Constants/Svgs/SvgIcons.dart';
import '../../../../Widgets/Texts/CommonText.dart';

class SpecificRoom extends StatelessWidget {
  BookRoomsServices bookRoomsServices = BookRoomsServices();
  String roomName, roomImage, location;
  bool showBookingButton;
  SpecificRoom({
    super.key,
    required this.roomName,
    required this.roomImage,
    required this.location,
    this.showBookingButton = true,
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
              CommonText(
                text: roomName,
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
        child: SpecificRoomWidget(
          showBookingButton: showBookingButton,
          onTap: () {
            bookRoomsServices.bookRoom(roomName, "shahzad90@gmail.com");
          },
          location: location,
          roomImage: roomImage,
          roomName: roomName,
        ),
      ),
    );
  }
}
