import 'package:barley_and_roof/Models/RoomDataModel/RoomDataModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../Utils/Snackbar.dart';

class GetAllRoomsServices {
  List<RoomDataModel> allroomsList = [];
  getAllRoomsData() async {
    try {
      allroomsList.clear();
      var roomsData =
          await FirebaseFirestore.instance.collection("All Rooms").get();

      for (var i in roomsData.docs) {
        allroomsList.add(
          RoomDataModel.fromJson(
            i.data(),
          ),
        );
      }

      return allroomsList;
    } catch (e) {
      String txt = e.toString();
      String substring = txt.substring(txt.indexOf("]") + 1);
      Utils().snacbar("Error", substring);
    }
  }
}
