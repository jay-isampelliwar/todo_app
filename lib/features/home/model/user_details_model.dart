// To parse this JSON data, do
//
//     final userDataModel = userDataModelFromJson(jsonString);

import 'dart:convert';

UserDataModel userDataModelFromJson(String str) =>
    UserDataModel.fromJson(json.decode(str));

String userDataModelToJson(UserDataModel data) => json.encode(data.toJson());

class UserDataModel {
  UserDataModel({
    required this.status,
    required this.message,
    required this.data,
  });

  bool status;
  String message;
  Data data;

  factory UserDataModel.fromJson(Map<String, dynamic> json) => UserDataModel(
        status: json["status"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data.toJson(),
      };
}

class Data {
  Data({
    required this.status,
    required this.username,
    required this.phone,
    required this.email,
  });

  bool status;
  String username;
  String phone;
  String email;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        status: json["status"],
        username: json["username"],
        phone: json["phone"],
        email: json["email"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "username": username,
        "phone": phone,
        "email": email,
      };
}
