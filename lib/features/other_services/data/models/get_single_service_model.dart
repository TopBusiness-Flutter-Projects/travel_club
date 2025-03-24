// To parse this JSON data, do
//
//     final getSingleServiceMoedl = getSingleServiceMoedlFromJson(jsonString);

import 'dart:convert';

GetSingleServiceMoedl getSingleServiceMoedlFromJson(String str) => GetSingleServiceMoedl.fromJson(json.decode(str));

String getSingleServiceMoedlToJson(GetSingleServiceMoedl data) => json.encode(data.toJson());

class GetSingleServiceMoedl {
  String? msg;
  SingleServiceData? data;
  int? status;

  GetSingleServiceMoedl({
    this.msg,
    this.data,
    this.status,
  });

  factory GetSingleServiceMoedl.fromJson(Map<String, dynamic> json) => GetSingleServiceMoedl(
    msg: json["msg"],
    data: json["data"] == null ? null : SingleServiceData.fromJson(json["data"]),
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
  int? latitude;
  int? longitude;
  String? whatsapp;
  String? phone;
  List<dynamic>? media;

  SingleServiceData({
    this.id,
    this.logo,
    this.title,
    this.about,
    this.latitude,
    this.longitude,
    this.whatsapp,
    this.phone,
    this.media,
  });

  factory SingleServiceData.fromJson(Map<String, dynamic> json) => SingleServiceData(
    id: json["id"],
    logo: json["logo"],
    title: json["title"],
    about: json["about"],
    latitude: json["latitude"],
    longitude: json["longitude"],
    whatsapp: json["whatsapp"],
    phone: json["phone"],
    media: json["media"] == null ? [] : List<dynamic>.from(json["media"]!.map((x) => x)),
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
    "media": media == null ? [] : List<dynamic>.from(media!.map((x) => x)),
  };
}
