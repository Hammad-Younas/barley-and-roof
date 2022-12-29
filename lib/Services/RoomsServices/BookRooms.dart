import 'package:barley_and_roof/Models/RoomDataModel/RoomDataModel.dart';
import 'package:barley_and_roof/Services/RoomsServices/GetAvailableRooms.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../../Utils/Snackbar.dart';

class BookRoomsServices extends GetxController {
  List<RoomDataModel> listOfBookedRooms = [];
  GetAvailableRoomsServices availableRooms = GetAvailableRoomsServices();
  bookRoom(String roomTitle, String email) async {
    listOfBookedRooms.clear();
    try {
      await availableRooms.getAvailableRoomsData();
      var res = await FirebaseFirestore.instance
          .collection("Available Rooms")
          .doc(roomTitle)
          .get();
      await FirebaseFirestore.instance
          .collection("UsersData")
          .doc(email)
          .collection("Booked Rooms")
          .doc(roomTitle)
          .set(res.data() as Map<String, dynamic>);
      await FirebaseFirestore.instance
          .collection("Available Rooms")
          .doc(roomTitle)
          .delete();
      Utils().snacbar("Error", "Room has been Booked Successfully");
    } catch (e) {
      String txt = e.toString();
      String substring = txt.substring(txt.indexOf("]") + 1);
      Utils().snacbar("Error", substring);
    }
  }

  getAllBookedRoomsData(String email) async {
    listOfBookedRooms.clear();
    try {
      var res = await FirebaseFirestore.instance
          .collection("UsersData")
          .doc(email)
          .collection("Booked Rooms")
          .get();
      for (var i in res.docs) {
        listOfBookedRooms.add(
          RoomDataModel.fromJson(
            i.data(),
          ),
        );
      }

      return listOfBookedRooms;
    } catch (e) {
      String txt = e.toString();
      String substring = txt.substring(txt.indexOf("]") + 1);
      Utils().snacbar("Error", substring);
    }
  }
}
