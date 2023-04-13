// To parse this JSON data, do
//
//     final userDetailsModel = userDetailsModelFromJson(jsonString);

import 'dart:convert';

UserDetailsModel userDetailsModelFromJson(String str) =>
    UserDetailsModel.fromJson(json.decode(str));

String userDetailsModelToJson(UserDetailsModel data) =>
    json.encode(data.toJson());

class UserDetailsModel {
  UserDetailsModel({
    required this.username,
    required this.phone,
    required this.email,
  });

  String username;
  String phone;
  String email;

  factory UserDetailsModel.fromJson(Map<String, dynamic> json) =>
      UserDetailsModel(
        username: json["username"],
        phone: json["phone"],
        email: json["email"],
      );

  Map<String, dynamic> toJson() => {
        "username": username,
        "phone": phone,
        "email": email,
      };
}
