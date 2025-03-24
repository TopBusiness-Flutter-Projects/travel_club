// To parse this JSON data, do
//
//     final getWaysModel = getWaysModelFromJson(jsonString);

import 'dart:convert';

GetWaysModel getWaysModelFromJson(String str) => GetWaysModel.fromJson(json.decode(str));

String getWaysModelToJson(GetWaysModel data) => json.encode(data.toJson());

class GetWaysModel {
  String? msg;
  List<WaysData>? data;
  int? status;

  GetWaysModel({
    this.msg,
    this.data,
    this.status,
  });

  factory GetWaysModel.fromJson(Map<String, dynamic> json) => GetWaysModel(
    msg: json["msg"],
    data: json["data"] == null ? [] : List<WaysData>.from(json["data"]!.map((x) => WaysData.fromJson(x))),
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "msg": msg,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    "status": status,
  };
}

class WaysData {
  int? id;
  String? name;
  String? image;

  WaysData({
    this.id,
    this.name,
    this.image,
  });

  factory WaysData.fromJson(Map<String, dynamic> json) => WaysData(
    id: json["id"],
    name: json["name"],
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "image": image,
  };
}
