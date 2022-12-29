import 'package:barley_and_roof/Models/RoomDataModel/RoomDataModel.dart';
import 'package:barley_and_roof/Services/RoomsServices/GetAllRooms.dart';
import 'package:barley_and_roof/Services/GetFirebaseImages.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../Utils/Snackbar.dart';

class UploadRoomsData {
  GetAllRoomsServices allRooms = GetAllRoomsServices();
  uploadRoomsData() async {
    try {
      await allRooms.getAllRoomsData();
      List.generate(allRooms.allroomsList.length, (index) {
        FirebaseFirestore.instance
            .collection("Available Rooms")
            .doc(allRooms.allroomsList[index].title)
            .set(
              RoomDataModel(
                desc: allRooms.allroomsList[index].desc,
                title: allRooms.allroomsList[index].title,
                price: allRooms.allroomsList[index].price,
                imageurl: allRooms.allroomsList[index].imageurl,
              ).toJson(),
            );
      });
      Utils().snacbar("Message", "uploaded successfully");
    } catch (e) {
      String txt = e.toString();
      String substring = txt.substring(txt.indexOf("]") + 1);
      Utils().snacbar("Error", substring);
    }
  }
}
