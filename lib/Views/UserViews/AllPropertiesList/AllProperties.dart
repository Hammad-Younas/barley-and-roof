import 'package:barley_and_roof/Constants/AppPaddings/AppPadding.dart';
import 'package:barley_and_roof/Constants/Colors/AppColors.dart';
import 'package:barley_and_roof/Constants/Svgs/SvgIcons.dart';
import 'package:barley_and_roof/Services/RoomsServices/BookRooms.dart';
import 'package:barley_and_roof/Services/RoomsServices/GetAvailableRooms.dart';
import 'package:barley_and_roof/Views/UserViews/AllPropertiesList/SpecificRoom.dart';
import 'package:barley_and_roof/Widgets/PropertyLists/PropertiesLists.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../Widgets/Texts/CommonText.dart';

class AllProperties extends StatelessWidget {
  String email;
  GetAvailableRoomsServices availableRoomsServices =
      GetAvailableRoomsServices();
  BookRoomsServices bookRoomsServices = BookRoomsServices();
  AllProperties({
    super.key,
    required this.email,
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
        title: Container(
          height: 40,
          width: MediaQuery.of(context).size.width * 0.44,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: AppColors.appBackgroundColor,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CommonText(
                text: "Downtown, LA",
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontSize: 15,
              ),
              SvgPicture.string(SvgIcons.downArrow),
            ],
          ),
        ),
        elevation: 0,
        backgroundColor: const Color(0xffFFFFFF),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: AppPadding.defaultPaddingList,
              child: CommonText(
                text: "Available Rooms",
                color: AppColors.primaryColor,
                fontWeight: FontWeight.w600,
                fontSize: 20,
              ),
            ),
            FutureBuilder(
                future: availableRoomsServices.getAvailableRoomsData(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return availableRoomsServices.availableRoomsList.isEmpty
                        ? const Center(
                            child: CommonText(
                              text: "No Room Available",
                              fontSize: 16,
                            ),
                          )
                        : Column(
                            children: List.generate(
                              availableRoomsServices.availableRoomsList.length,
                              (index) {
                                return PropertiesList(
                                  onTap: () {
                                    Get.to(
                                      () => SpecificRoom(
                                          roomName: availableRoomsServices
                                              .availableRoomsList[index].title!,
                                          roomImage: availableRoomsServices
                                              .availableRoomsList[index]
                                              .imageurl!,
                                          location: availableRoomsServices
                                              .availableRoomsList[index].desc!),
                                    );
                                  },
                                  roomImageUrl: availableRoomsServices
                                      .availableRoomsList[index].imageurl!,
                                  roomLocation: availableRoomsServices
                                      .availableRoomsList[index].desc!,
                                  roomTitle: availableRoomsServices
                                      .availableRoomsList[index].title!,
                                );
                              },
                            ),
                          );
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                }),
            const Padding(
              padding: AppPadding.defaultPaddingList,
              child: CommonText(
                text: "Booked Rooms",
                color: AppColors.primaryColor,
                fontWeight: FontWeight.w600,
                fontSize: 20,
              ),
            ),
            FutureBuilder(
                future: bookRoomsServices.getAllBookedRoomsData(email),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return bookRoomsServices.listOfBookedRooms.isEmpty
                        ? const Center(
                            child: CommonText(
                              text: "No Room Booked",
                              fontSize: 16,
                            ),
                          )
                        : Column(
                            children: List.generate(
                              bookRoomsServices.listOfBookedRooms.length,
                              (index) {
                                return PropertiesList(
                                  onTap: () {
                                    Get.to(
                                      () => SpecificRoom(
                                          showBookingButton: false,
                                          roomName: bookRoomsServices
                                              .listOfBookedRooms[index].title!,
                                          roomImage: bookRoomsServices
                                              .listOfBookedRooms[index]
                                              .imageurl!,
                                          location: bookRoomsServices
                                              .listOfBookedRooms[index].desc!),
                                    );
                                  },
                                  roomImageUrl: bookRoomsServices
                                      .listOfBookedRooms[index].imageurl!,
                                  roomLocation: bookRoomsServices
                                      .listOfBookedRooms[index].desc!,
                                  roomTitle: bookRoomsServices
                                      .listOfBookedRooms[index].title!,
                                );
                              },
                            ),
                          );
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                }),
          ],
        ),
      ),
    );
  }
}
