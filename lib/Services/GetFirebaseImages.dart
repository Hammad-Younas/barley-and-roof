import 'package:barley_and_roof/Models/RoomDataModel/RoomDataModel.dart';
import 'package:barley_and_roof/Models/UserModel/UserModel.dart';
import 'package:barley_and_roof/Utils/Snackbar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';

class GetImagesServices extends GetxController {
  List<String> imagesUrlList = [];
  List<String> imagesNames = [];
  RoomDataModel dataModel = RoomDataModel();
  List<RoomDataModel> allRooms = [];
  List<UserModel> list = [];

  uploadImagesinFirestore() async {
    try {
      var imgurl = await FirebaseStorage.instance.ref("UnitImages").list();

      for (var i in imgurl.items) {
        var roomName = i.name.substring(
          0,
          i.name.indexOf("."),
        );
        imagesNames.add(roomName);

        var image =
            await FirebaseStorage.instance.ref(i.fullPath).getDownloadURL();
        imagesUrlList.add(image);
      }

      List.generate(imagesUrlList.length, (index) async {
        await FirebaseFirestore.instance
            .collection("Admin")
            .doc("admin@gmail.com")
            .collection("All Rooms")
            .doc(imagesNames[index])
            .set(
              RoomDataModel(
                desc: "RoomDescription",
                imageurl: imagesUrlList[index],
                price: "25.0",
                title: imagesNames[index],
              ).toJson(),
            );
      });

      List.generate(imagesUrlList.length, (index) async {
        await FirebaseFirestore.instance
            .collection("Admin")
            .doc("admin@gmail.com")
            .collection("Available Rooms")
            .doc(imagesNames[index])
            .set(
              RoomDataModel(
                desc: "RoomDescription",
                imageurl: imagesUrlList[index],
                price: "25.0",
                title: imagesNames[index],
              ).toJson(),
            );
      });
      List.generate(imagesUrlList.length, (index) async {
        await FirebaseFirestore.instance
            .collection("All Rooms")
            .doc(imagesNames[index])
            .set(
              RoomDataModel(
                desc: "RoomDescription",
                imageurl: imagesUrlList[index],
                price: "25.0",
                title: imagesNames[index],
              ).toJson(),
            );
      });

      Utils().snacbar("Message", "Images uploaded Successfully");
    } catch (e) {
      String txt = e.toString();
      String substring = txt.substring(txt.indexOf("]") + 1);
      Utils().snacbar("Error", substring);
    }
  }

  getUsersData() async {
    var usersTable =
        await FirebaseFirestore.instance.collection("UsersData").get();

    for (var i in usersTable.docs) {
      list.add(
        UserModel.fromJson(
          i.data(),
        ),
      );
    }
    return list;
  }

  uploadAllRoomstoUser(String email) async {
    try {
      var res = await FirebaseFirestore.instance.collection('All Rooms').get();

      for (var i in res.docs) {
        allRooms.add(
          RoomDataModel.fromJson(
            i.data(),
          ),
        );
      }
      List.generate(allRooms.length, (index) async {
        await FirebaseFirestore.instance
            .collection("UsersData")
            .doc(email)
            .collection("Available Rooms")
            .doc(allRooms[index].title)
            .set(
              RoomDataModel(
                desc: "RoomDescription",
                imageurl: allRooms[index].imageurl,
                price: "25.0",
                title: allRooms[index].title,
              ).toJson(),
            );
      });
      Utils().snacbar("Message", "Images url are created SuccessFully");
      return allRooms;
    } catch (e) {
      String txt = e.toString();
      String substring = txt.substring(txt.indexOf("]") + 1);
      Utils().snacbar("Error", substring);
    }
  }

  bookRoom(String roomName, String email) async {
    try {
      var res = await FirebaseFirestore.instance
          .collection('UsersData')
          .doc(email)
          .collection("Available Rooms")
          .doc(roomName)
          .get();
      await FirebaseFirestore.instance
          .collection("UsersData")
          .doc(email)
          .collection("Booked Rooms")
          .doc(roomName)
          .set(res.data() as Map<String, dynamic>);
      var result = await FirebaseFirestore.instance
          .collection("UsersData")
          .doc(email)
          .collection("Booked Rooms")
          .doc(roomName)
          .get();
      dataModel = RoomDataModel.fromJson(result.data() as Map<String, dynamic>);

      Utils().snacbar("Message", "RoomBooked SuccessFully");
      await FirebaseFirestore.instance
          .collection("UsersData")
          .doc(email)
          .collection("Available Rooms")
          .doc(roomName)
          .delete();

      return dataModel;
    } catch (e) {
      String txt = e.toString();
      String substring = txt.substring(txt.indexOf("]") + 1);
      var result = await FirebaseFirestore.instance
          .collection("UsersData")
          .doc(email)
          .collection("Booked Rooms")
          .get();
      if (result.docs.any((element) {
        return element.exists;
      })) {
        Utils().snacbar("Error", "Room has been already Booked");
      } else {
        Utils().snacbar("Error", substring);
      }
    }
  }
}
