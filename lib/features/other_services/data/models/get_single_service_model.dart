// To parse this JSON data, do
//
//     final getSingleServiceMoedl = getSingleServiceMoedlFromJson(jsonString);

import 'dart:convert';

GetSubServiceDetailsModel getSingleServiceMoedlFromJson(String str) =>
    GetSubServiceDetailsModel.fromJson(json.decode(str));

String getSingleServiceMoedlToJson(GetSubServiceDetailsModel data) =>
    json.encode(data.toJson());

class GetSubServiceDetailsModel {
  String? msg;
  SingleServiceData? data;
  int? status;

  GetSubServiceDetailsModel({
    this.msg,
    this.data,
    this.status,
  });

  factory GetSubServiceDetailsModel.fromJson(Map<String, dynamic> json) =>
      GetSubServiceDetailsModel(
        msg: json["msg"],
        data: json["data"] == null
            ? null
            : SingleServiceData.fromJson(json["data"]),
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "msg": msg,
        "data": data?.toJson(),
        "status": status,
      };
}

class SingleServiceData {
  int? id;
  String? logo;
  String? title;
  dynamic about;
  String? latitude;
  String? longitude;
  String? whatsapp;
  String? phone;
  List<String>? media;
 int? rate;
  int? users;
  bool? isFav;
  SingleServiceData({
    this.id,
    this.logo,
    this.title,
    this.about,
    this.latitude,
    this.longitude,
    this.whatsapp,
    this.phone,
    this.media, this.rate,
    this.users,
    this.isFav,
  });

  factory SingleServiceData.fromJson(Map<String, dynamic> json) =>
      SingleServiceData(
        id: json["id"],
        logo: json["logo"],
        title: json["title"],
        about: json["about"],
        latitude: json["latitude"],
        longitude: json["longitude"],
        whatsapp: json["whatsapp"],
        phone: json["phone"], rate: json["rate"],
    users: json["users"],
    isFav: json["is_fav"],
        media: json["media"] == null
            ? []
            : List<String>.from(json["media"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "logo": logo,
        "title": title,
        "about": about,
        "latitude": latitude,
        "longitude": longitude,
        "whatsapp": whatsapp,
        "phone": phone,
          "rate": rate,
    "users": users,
    "is_fav": isFav,
        "media": media == null ? [] : List<dynamic>.from(media!.map((x) => x)),
      };
}
