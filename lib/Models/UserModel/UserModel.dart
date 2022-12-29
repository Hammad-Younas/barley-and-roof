class UserModel {
  String? name;
  String? email;
  String? phone;
  String? age;
  String? occupation;
  String? password;

  UserModel(
      {this.name,
      this.email,
      this.phone,
      this.age,
      this.occupation,
      this.password});

  UserModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    age = json['age'];
    occupation = json['occupation'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = name;
    data['email'] = email;
    data['phone'] = phone;
    data['age'] = age;
    data['occupation'] = occupation;
    data['password'] = password;
    return data;
  }
}
