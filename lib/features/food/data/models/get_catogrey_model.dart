// To parse this JSON data, do
//
//     final getCatogreyModel = getCatogreyModelFromJson(jsonString);

import 'dart:convert';

GetCatogreyFoodModel getCatogreyModelFromJson(String str) => GetCatogreyFoodModel.fromJson(json.decode(str));

String getCatogreyModelToJson(GetCatogreyFoodModel data) => json.encode(data.toJson());

class GetCatogreyFoodModel {
  String? msg;
  List<CatogreyDataFood>? data;
  int? status;

  GetCatogreyFoodModel({
    this.msg,
    this.data,
    this.status,
  });

  factory GetCatogreyFoodModel.fromJson(Map<String, dynamic> json) => GetCatogreyFoodModel(
    msg: json["msg"],
    data: json["data"] == null ? [] : List<CatogreyDataFood>.from(json["data"]!.map((x) => CatogreyDataFood.fromJson(x))),
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "msg": msg,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    "status": status,
  };
}

class CatogreyDataFood {
  int? id;
  String? name;
  double? latitude;
  double? longitude;
  Category? category;
  String? about;
  String? logo;
  String? media;
  int? rate;
  int? users;
  bool? isFav;

  CatogreyDataFood({
    this.id,
    this.name,
    this.latitude,
    this.longitude,
    this.category,
    this.about,
    this.logo,
    this.media,
    this.rate,
    this.users,
    this.isFav,
  });

  factory CatogreyDataFood.fromJson(Map<String, dynamic> json) => CatogreyDataFood(
    id: json["id"],
    name: json["name"],
    latitude: json["latitude"]?.toDouble(),
    longitude: json["longitude"]?.toDouble(),
    category: json["category"] == null ? null : Category.fromJson(json["category"]),
    about: json["about"],
    logo: json["logo"],
    media: json["media"],
    rate: json["rate"],
    users: json["users"],
    isFav: json["is_fav"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "latitude": latitude,
    "longitude": longitude,
    "category": category?.toJson(),
    "about": about,
    "logo": logo,
    "media": media,
    "rate": rate,
    "users": users,
    "is_fav": isFav,
  };
}

class Category {
  int? id;
  String? name;

  Category({
    this.id,
    this.name,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
    id: json["id"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
  };
}
