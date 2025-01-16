// To parse this JSON data, do
//
//     final facilitiesModel = facilitiesModelFromJson(jsonString);

import 'dart:convert';

FacilitiesModel facilitiesModelFromJson(String str) => FacilitiesModel.fromJson(json.decode(str));

String facilitiesModelToJson(FacilitiesModel data) => json.encode(data.toJson());

class FacilitiesModel {
  String? msg;
  List<FacilityModel>? data;
  int? status;

  FacilitiesModel({
    this.msg,
    this.data,
    this.status,
  });

  factory FacilitiesModel.fromJson(Map<String, dynamic> json) => FacilitiesModel(
    msg: json["msg"],
    data: json["data"] == null ? [] : List<FacilityModel>.from(json["data"]!.map((x) => FacilityModel.fromJson(x))),
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "msg": msg,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    "status": status,
  };

}

class FacilityModel {
  int? id;
  String? name;
  String? image;
  int? type;
bool isChecked ;
  FacilityModel({
    this.id,
    this.name,
    this.image,
    this.type,
    this.isChecked = false,
  });

  factory FacilityModel.fromJson(Map<String, dynamic> json) => FacilityModel(
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


