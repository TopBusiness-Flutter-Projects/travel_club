// To parse this JSON data, do
//
//     final getSubServicesModel = getSubServicesModelFromJson(jsonString);

import 'dart:convert';

GetSubServicesModel getSubServicesModelFromJson(String str) => GetSubServicesModel.fromJson(json.decode(str));

String getSubServicesModelToJson(GetSubServicesModel data) => json.encode(data.toJson());

class GetSubServicesModel {
  String? msg;
  List<SubServicesData>? data;
  int? status;

  GetSubServicesModel({
    this.msg,
    this.data,
    this.status,
  });

  factory GetSubServicesModel.fromJson(Map<String, dynamic> json) => GetSubServicesModel(
    msg: json["msg"],
    data: json["data"] == null ? [] : List<SubServicesData>.from(json["data"]!.map((x) => SubServicesData.fromJson(x))),
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "msg": msg,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    "status": status,
  };
}

class SubServicesData {
  int? id;
  String? title;
  String? logo;
  int? latitude;
  int? longitude;
  String? whatsapp;
  String? phone;
  int? rate;
  int? users;
  bool? isFav;

  SubServicesData({
    this.id,
    this.title,
    this.logo,
    this.latitude,
    this.longitude,
    this.whatsapp,
    this.phone,
    this.rate,
    this.users,
    this.isFav,
  });

  factory SubServicesData.fromJson(Map<String, dynamic> json) => SubServicesData(
    id: json["id"],
    title: json["title"],
    logo: json["logo"],
    latitude: json["latitude"],
    longitude: json["longitude"],
    whatsapp: json["whatsapp"],
    phone: json["phone"],
    rate: json["rate"],
    users: json["users"],
    isFav: json["is_fav"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "logo": logo,
    "latitude": latitude,
    "longitude": longitude,
    "whatsapp": whatsapp,
    "phone": phone,
    "rate": rate,
    "users": users,
    "is_fav": isFav,
  };
}
