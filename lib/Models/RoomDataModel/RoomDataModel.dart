class RoomDataModel {
  String? price;

  String? imageurl;
  String? title;
  String? desc;

  RoomDataModel({
    this.price,
    this.imageurl,
    this.title,
    this.desc,
  });

  RoomDataModel.fromJson(Map<String, dynamic> json) {
    price = json['price'];
    imageurl = json['imageurl'];
    title = json['title'];
    desc = json['desc'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['price'] = price;
    data['imageurl'] = imageurl;
    data['title'] = title;
    data['desc'] = desc;
    return data;
  }
}
