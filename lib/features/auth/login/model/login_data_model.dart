// To parse this JSON data, do
//
//     final baseModel = baseModelFromJson(jsonString);

import 'dart:convert';

TokenDataModel baseModelFromJson(String str) =>
    TokenDataModel.fromJson(json.decode(str));

String baseModelToJson(TokenDataModel data) => json.encode(data.toJson());

class TokenDataModel {
  TokenDataModel({
    required this.token,
  });

  String token;

  factory TokenDataModel.fromJson(Map<String, dynamic> json) => TokenDataModel(
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "token": token,
      };
}
