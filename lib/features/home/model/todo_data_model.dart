// To parse this JSON data, do
//
//     final todoDataModel = todoDataModelFromJson(jsonString);

import 'dart:convert';

TodoDataModel todoDataModelFromJson(String str) =>
    TodoDataModel.fromJson(json.decode(str));

String todoDataModelToJson(TodoDataModel data) => json.encode(data.toJson());

class TodoDataModel {
  TodoDataModel({
    required this.status,
    required this.data,
  });

  bool status;
  List<Datum> data;

  factory TodoDataModel.fromJson(Map<String, dynamic> json) => TodoDataModel(
        status: json["status"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
    required this.id,
    // required this.userId,
    // required this.title,
    // required this.datumId,
    // required this.category,
    // required this.isDone,
    // required this.createdAt,
    // required this.updatedAt,
    // required this.v,
  });

  String id;
  // String userId;
  // String title;
  // String datumId;
  // String category;
  // bool isDone;
  // DateTime createdAt;
  // DateTime updatedAt;
  // int v;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["_id"],
        // userId: json["user_id"],
        // title: json["title"],
        // datumId: json["id"],
        // category: json["category"],
        // isDone: json["isDone"],
        // createdAt: DateTime.parse(json["createdAt"]),
        // updatedAt: DateTime.parse(json["updatedAt"]),
        // v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        // "user_id": userId,
        // "title": title,
        // "id": datumId,
        // "category": category,
        // "isDone": isDone,
        // "createdAt": createdAt.toIso8601String(),
        // "updatedAt": updatedAt.toIso8601String(),
        // "__v": v,
      };
}
