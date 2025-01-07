// To parse this JSON data, do
//
//     final placesModel = placesModelFromJson(jsonString);

import 'dart:convert';

PlacesModel placesModelFromJson(String str) => PlacesModel.fromJson(json.decode(str));

String placesModelToJson(PlacesModel data) => json.encode(data.toJson());

class PlacesModel {
  String? msg;
  List<Datum>? data;
  int? status;

  PlacesModel({
    this.msg,
    this.data,
    this.status,
  });

  factory PlacesModel.fromJson(Map<String, dynamic> json) => PlacesModel(
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
  int? moduleId;
  int? moduleType;
  int? id;
  String? name;
  String? image;

  Datum({
    this.moduleId,
    this.moduleType,
    this.id,
    this.name,
    this.image,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    moduleId: json["module_id"],
    moduleType: json["module_type"],
    id: json["id"],
    name: json["name"],
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "module_id": moduleId,
    "module_type": moduleType,
    "id": id,
    "name": name,
    "image": image,
  };
}
