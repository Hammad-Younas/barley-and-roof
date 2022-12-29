import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../../Models/RoomDataModel/RoomDataModel.dart';

class GetAvailableRoomsServices extends GetxController {
  List<RoomDataModel> availableRoomsList = [];
  getAvailableRoomsData() async {
    availableRoomsList.clear();
    var roomsData =
        await FirebaseFirestore.instance.collection("Available Rooms").get();

    for (var i in roomsData.docs) {
      availableRoomsList.add(
        RoomDataModel.fromJson(
          i.data(),
        ),
      );
    }
    update();
    return availableRoomsList;
  }
}
