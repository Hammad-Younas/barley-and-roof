import 'package:barley_and_roof/Services/RoomsServices/BookRooms.dart';
import 'package:barley_and_roof/Services/RoomsServices/GetAllRooms.dart';
import 'package:barley_and_roof/Services/UploadRooms/RoomsDataUpload.dart';
import 'package:barley_and_roof/Views/UserViews/Login/Login.dart';
import 'package:barley_and_roof/Widgets/PropertyLists/PropertiesLists.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../Constants/Colors/AppColors.dart';
import '../../../Constants/Svgs/SvgIcons.dart';
import '../../../Widgets/Texts/CommonText.dart';

class SkipUnitScreens extends StatefulWidget {
  const SkipUnitScreens({super.key});

  @override
  State<SkipUnitScreens> createState() => _SkipUnitScreensState();
}

class _SkipUnitScreensState extends State<SkipUnitScreens> {
  BookRoomsServices bookedRooms = BookRoomsServices();
  GetAllRoomsServices allRooms = GetAllRoomsServices();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    allRooms.getAllRoomsData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(16.0),
          child: InkWell(
            onTap: () {
              Get.back();
            },
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
              SvgPicture.string(SvgIcons.downArrow)
            ],
          ),
        ),
        elevation: 0,
        backgroundColor: const Color(0xffFFFFFF),
        actions: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: InkWell(
              onTap: () async {
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
          )
        ],
      ),
      body: SingleChildScrollView(
        child: FutureBuilder(
            future: allRooms.getAllRoomsData(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Column(
                  children: List.generate(
                    allRooms.allroomsList.length,
                    (index) {
                      return PropertiesList(
                        roomImageUrl: allRooms.allroomsList[index].imageurl!,
                        roomLocation: allRooms.allroomsList[index].desc!,
                        roomTitle: allRooms.allroomsList[index].title!,
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
      ),
    );
  }
}
