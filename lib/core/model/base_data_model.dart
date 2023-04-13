import 'dart:convert';

BaseModel baseModelFromJson(String str) => BaseModel.fromJson(json.decode(str));

String baseModelToJson(BaseModel data) => json.encode(data.toJson());

class BaseModel {
  BaseModel({
    required this.message,
  });

  String message;

  factory BaseModel.fromJson(Map<String, dynamic> json) => BaseModel(
        message: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "token": message,
      };
}
