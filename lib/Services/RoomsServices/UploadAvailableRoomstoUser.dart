import 'package:barley_and_roof/Models/RoomDataModel/RoomDataModel.dart';
import 'package:barley_and_roof/Services/RoomsServices/GetAvailableRooms.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../Utils/Snackbar.dart';

class UploadAvailableRoomstoUser {
  List<RoomDataModel> availableRoomsList = [];

  uploadAvailableRoomstoUser() async {
    try {
      var roomsData =
          await FirebaseFirestore.instance.collection("Available Rooms").get();

      for (var i in roomsData.docs) {
        availableRoomsList.add(
          RoomDataModel.fromJson(
            i.data(),
          ),
        );
      }
    } catch (e) {
      String txt = e.toString();
      String substring = txt.substring(txt.indexOf("]") + 1);
      Utils().snacbar("Error", substring);
    }
  }
}
