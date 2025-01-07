// To parse this JSON data, do
//
//     final facilitiesModel = facilitiesModelFromJson(jsonString);

import 'dart:convert';

FacilitiesModel facilitiesModelFromJson(String str) => FacilitiesModel.fromJson(json.decode(str));

String facilitiesModelToJson(FacilitiesModel data) => json.encode(data.toJson());

class FacilitiesModel {
  String? msg;
  List<Datum>? data;
  int? status;

  FacilitiesModel({
    this.msg,
    this.data,
    this.status,
  });

  factory FacilitiesModel.fromJson(Map<String, dynamic> json) => FacilitiesModel(
    msg: json["msg"],
    data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "msg": msg,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    "status": status,
  };
}

class Datum {
  int? id;
  String? name;
  String? image;
  int? type;

  Datum({
    this.id,
    this.name,
    this.image,
    this.type,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    name: json["name"],
    image: json["image"],
    type: json["type"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "image": image,
    "type": type,
  };
}
