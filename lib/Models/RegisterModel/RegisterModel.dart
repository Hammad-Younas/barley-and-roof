class RegisterModel {
  String? name;
  String? email;
  String? phone;
  String? age;
  String? occupation;
  String? password;

  RegisterModel({
    required this.name,
    required this.email,
    required this.age,
    this.occupation,
    required this.password,
    required this.phone,
  });

  RegisterModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    age = json['age'];
    occupation = json['occupation'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['name'] = name;
    data['email'] = email;
    data['phone'] = phone;
    data['age'] = age;
    data['occupation'] = occupation;
    data['password'] = password;

    return data;
  }
}
