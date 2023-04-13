// To parse this JSON data, do
//
//     final baseModel = baseModelFromJson(jsonString);

import 'dart:convert';

BaseModel baseModelFromJson(String str) => BaseModel.fromJson(json.decode(str));

String baseModelToJson(BaseModel data) => json.encode(data.toJson());

class BaseModel {
  BaseModel({
    required this.token,
  });

  String token;

  factory BaseModel.fromJson(Map<String, dynamic> json) => BaseModel(
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "token": token,
      };
}
