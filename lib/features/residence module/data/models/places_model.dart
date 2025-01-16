// To parse this JSON data, do
//
//     final placesModel = placesModelFromJson(jsonString);

import 'dart:convert';

PlacesModel placesModelFromJson(String str) => PlacesModel.fromJson(json.decode(str));

String placesModelToJson(PlacesModel data) => json.encode(data.toJson());

class PlacesModel {
  String? msg;
  List<PlaceModel>? data;
  int? status;

  PlacesModel({
    this.msg,
    this.data,
    this.status,
  });

  factory PlacesModel.fromJson(Map<String, dynamic> json) => PlacesModel(
    msg: json["msg"],
    data: json["data"] == null ? [] : List<PlaceModel>.from(json["data"]!.map((x) => PlaceModel.fromJson(x))),
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "msg": msg,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    "status": status,
  };
}

class PlaceModel {
  int? moduleId;
  int? moduleType;
  int? id;
  String? name;
  String? image;

  PlaceModel({
    this.moduleId,
    this.moduleType,
    this.id,
    this.name,
    this.image,
  });

  factory PlaceModel.fromJson(Map<String, dynamic> json) => PlaceModel(
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
