// To parse this JSON data, do
//
//     final getCatogreyModel = getCatogreyModelFromJson(jsonString);

import 'dart:convert';

GetCategoryFoodModel getCatogreyModelFromJson(String str) => GetCategoryFoodModel.fromJson(json.decode(str));

String getCatogreyModelToJson(GetCategoryFoodModel data) => json.encode(data.toJson());

class GetCategoryFoodModel {
  String? msg;
  List<CatogreyDataFood>? data;
  int? status;

  GetCategoryFoodModel({
    this.msg,
    this.data,
    this.status,
  });

  factory GetCategoryFoodModel.fromJson(Map<String, dynamic> json) => GetCategoryFoodModel(
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
  

  CatogreyDataFood({
    this.id,
    this.name,
   
  });

  factory CatogreyDataFood.fromJson(Map<String, dynamic> json) => CatogreyDataFood(
    id: json["id"],
    name: json["name"],
   
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
   
  };
}

