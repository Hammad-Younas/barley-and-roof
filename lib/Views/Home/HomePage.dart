import 'package:barley_and_roof/Constants/AppPaddings/AppPadding.dart';
import 'package:barley_and_roof/Constants/Colors/AppColors.dart';
import 'package:barley_and_roof/Constants/Svgs/SvgIcons.dart';
import 'package:barley_and_roof/Services/RoomsServices/GetAvailableRooms.dart';
import 'package:barley_and_roof/Views/UserViews/AllPropertiesList/AllProperties.dart';
import 'package:barley_and_roof/Views/UserViews/AllPropertiesList/SpecificRoom.dart';
import 'package:barley_and_roof/Widgets/AppBar/MyAppBar.dart';
import 'package:barley_and_roof/Widgets/Texts/CommonText.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../Widgets/AppButton/AppButton.dart';
import '../../Widgets/TimeLine/ProgressTimeline.dart';
import 'PaymentPage.dart';
import 'RequestPage.dart';
import 'SettingsPage.dart';

class HomePage extends StatefulWidget {
  String userName;
  String email;
  HomePage({
    Key? key,
    required this.userName,
    required this.email,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedItem = 0;
  String fcmToken = '';

  Future<void> getDeviceTokenToSendNotification() async {
    final FirebaseMessaging _fcm = FirebaseMessaging.instance;
    final token = await _fcm.getToken();
    fcmToken = token.toString();
    print("Token Value $fcmToken");
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    FirebaseMessaging.instance.getToken().then((value) {
      print(value);
    });
  }

  @override
  Widget build(BuildContext context) {
    List HomeScreens = [
      HomeBody(
        email: widget.email,
      ),
      PaymentPage(),
      RequestPage(),
      SettingsPage(),
    ];
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.appBackgroundColor,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: MyAppBar(
            userName: widget.userName,
          ),
        ),
        body: HomeScreens[selectedItem],
        bottomNavigationBar: Container(
          height: 63,
          color: Colors.transparent,
          child: Stack(
            children: [
              Align(
                alignment: Alignment.bottomCenter,
                child: BottomNavigationBar(
                  elevation: 0,
                  backgroundColor: Colors.white,
                  type: BottomNavigationBarType.fixed,
                  onTap: (value) {
                    setState(() {
                      selectedItem = value;
                    });
                  },
                  currentIndex: selectedItem,
                  selectedItemColor: AppColors.primaryColor,
                  showSelectedLabels: false,
                  showUnselectedLabels: false,
                  items: [
                    BottomNavigationBarItem(
                      icon: SvgPicture.string(
                        SvgIcons.home,
                        color: selectedItem == 0
                            ? AppColors.primaryColor
                            : Colors.black,
                      ),
                      label: "",
                    ),
                    BottomNavigationBarItem(
                      icon: SvgPicture.string(
                        SvgIcons.wallet,
                        color: selectedItem == 1
                            ? AppColors.primaryColor
                            : Colors.black,
                      ),
                      label: "",
                    ),
                    BottomNavigationBarItem(
                      icon: SvgPicture.string(
                        SvgIcons.requestBoard,
                        color: selectedItem == 2
                            ? AppColors.primaryColor
                            : Colors.black,
                      ),
                      label: "",
                    ),
                    BottomNavigationBarItem(
                      icon: SvgPicture.string(
                        SvgIcons.settings,
                        color: selectedItem == 3
                            ? AppColors.primaryColor
                            : Colors.black,
                      ),
                      label: "",
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    height: 11,
                    width: 11,
                    decoration: BoxDecoration(
                      color: selectedItem == 0
                          ? AppColors.primaryColor
                          : Colors.transparent,
                      shape: BoxShape.circle,
                    ),
                  ),
                  Container(
                    height: 11,
                    width: 11,
                    decoration: BoxDecoration(
                      color: selectedItem == 1
                          ? AppColors.primaryColor
                          : Colors.transparent,
                      shape: BoxShape.circle,
                    ),
                  ),
                  Container(
                    height: 11,
                    width: 11,
                    decoration: BoxDecoration(
                      color: selectedItem == 2
                          ? AppColors.primaryColor
                          : Colors.transparent,
                      shape: BoxShape.circle,
                    ),
                  ),
                  Container(
                    height: 11,
                    width: 11,
                    decoration: BoxDecoration(
                      color: selectedItem == 3
                          ? AppColors.primaryColor
                          : Colors.transparent,
                      shape: BoxShape.circle,
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class HomeBody extends StatelessWidget {
  String email;
  GetAvailableRoomsServices availableRoomsServices =
      GetAvailableRoomsServices();
  HomeBody({
    Key? key,
    required this.email,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: AppPadding.defaultPadding,
            child: Column(
              children: [
                Container(
                  height: 180,
                  decoration: BoxDecoration(
                    color: Color(0xffffffff),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: Color(0xffeeeeee),
                    ),
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 18.0, top: 10),
                        child: Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                CommonText(
                                  text: "Room No 123",
                                  fontWeight: FontWeight.w500,
                                  fontSize: 20,
                                ),
                                CommonText(
                                  text: "2 Months Remaining on Tenancy",
                                  fontWeight: FontWeight.w500,
                                  fontSize: 13,
                                  color: Color(0xff808080),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15.0, right: 15),
                        child: Center(
                          child: Container(
                            height: 97,
                            decoration: BoxDecoration(
                              color: AppColors.primaryColor,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(left: 18.0, right: 18),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const CommonText(
                                        text: "Last Payment",
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: const [
                                          CommonText(
                                            text: "\$7500",
                                            fontSize: 13,
                                            fontWeight: FontWeight.w500,
                                          ),
                                          CommonText(
                                            text: "12 Jan 2023",
                                            fontSize: 10,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const CommonText(
                                        text: "Next Payment",
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: const [
                                          CommonText(
                                            text: "\$4000",
                                            fontSize: 13,
                                            fontWeight: FontWeight.w500,
                                          ),
                                          CommonText(
                                            text: "12 Feb 2023(in 5 days)",
                                            fontSize: 10,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: const [
                    CommonText(
                      text: "Announcements",
                      fontSize: 17,
                      fontWeight: FontWeight.w500,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Center(
                  child: Container(
                    height: 73,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Color(0xffFFB800))),
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: 18.0,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              SvgPicture.string(SvgIcons.announmentIcon),
                              const SizedBox(
                                width: 10,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  CommonText(
                                    text: "Aircon cleaning schedule today",
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  CommonText(
                                    text:
                                        "Please allow the cleaner to open into \nyour room.",
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xff808080),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: const [
                    CommonText(
                      text: "My Requests",
                      fontSize: 17,
                      fontWeight: FontWeight.w500,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Center(child: progressRequest()),
                const SizedBox(
                  height: 10,
                ),
                AppButton(text: 'Request a Service'),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const CommonText(
                      text: "Explore Other Rooms",
                      fontSize: 17,
                      fontWeight: FontWeight.w500,
                    ),
                    InkWell(
                      onTap: () {
                        Get.to(
                          () => AllProperties(email: email),
                        );
                      },
                      child: const CommonText(
                        text: "See All",
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: AppColors.primaryColor,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
          FutureBuilder(
              future: availableRoomsServices.getAvailableRoomsData(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Wrap(
                      children: List.generate(
                          availableRoomsServices.availableRoomsList.length,
                          (index) {
                        return InkWell(
                          onTap: () {
                            Get.to(
                              () => SpecificRoom(
                                roomName: availableRoomsServices
                                    .availableRoomsList[index].title!,
                                roomImage: availableRoomsServices
                                    .availableRoomsList[index].imageurl!,
                                location: availableRoomsServices
                                    .availableRoomsList[index].desc!,
                              ),
                            );
                          },
                          child: Container(
                            height: 104,
                            width: 200,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              image: DecorationImage(
                                image: NetworkImage(
                                  availableRoomsServices
                                      .availableRoomsList[index].imageurl!,
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        );
                      }),
                    ),
                  );
                } else {
                  return const CircularProgressIndicator();
                }
              }),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}

class progressRequest extends StatelessWidget {
  progressRequest({Key? key}) : super(key: key);

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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const CommonText(
                  text: "Need New Air Conditioner",
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
                Container(
                  height: 20,
                  width: 79,
                  decoration: BoxDecoration(
                      color: Color(0xffFFF9EA),
                      borderRadius: BorderRadius.circular(5)),
                  child: const Center(
                    child: CommonText(
                      text: "In Progress",
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: Color(0xffFFB800),
                    ),
                  ),
                ),
              ],
            ),
            const CommonText(
              text: "Step 2 of 5 (Admin Looking at the mater)",
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: Color(0xff808080),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ProgressTimeLine(
                  color1: Colors.green,
                  color2: Colors.green,
                  color3: Colors.black,
                  color4: Colors.black,
                  color5: Colors.black,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
