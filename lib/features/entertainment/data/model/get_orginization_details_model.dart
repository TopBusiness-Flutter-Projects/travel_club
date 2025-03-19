// To parse this JSON data, do
//
//     final getOrganizationDetails = getOrganizationDetailsFromJson(jsonString);

import 'dart:convert';

GetOrganizationDetails getOrganizationDetailsFromJson(String str) => GetOrganizationDetails.fromJson(json.decode(str));

String getOrganizationDetailsToJson(GetOrganizationDetails data) => json.encode(data.toJson());

class GetOrganizationDetails {
  String? msg;
  Data? data;
  int? status;

  GetOrganizationDetails({
    this.msg,
    this.data,
    this.status,
  });

  factory GetOrganizationDetails.fromJson(Map<String, dynamic> json) => GetOrganizationDetails(
    msg: json["msg"],
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "msg": msg,
    "data": data?.toJson(),
    "status": status,
  };
}

class Data {
  int? id;
  String? name;
  String? about;
  dynamic rule;
  int? rate;
  String? latitude;
  String? longitude;
  List<WayService>? wayServices;
  List<Media>? media;

  Data({
    this.id,
    this.name,
    this.about,
    this.rule,
    this.rate,
    this.latitude,
    this.longitude,
    this.wayServices,
    this.media,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"],
    name: json["name"],
    about: json["about"],
    rule: json["rule"],
    rate: json["rate"],
    latitude: json["latitude"],
    longitude: json["longitude"],
    wayServices: json["way_services"] == null ? [] : List<WayService>.from(json["way_services"]!.map((x) => WayService.fromJson(x))),
    media: json["media"] == null ? [] : List<Media>.from(json["media"]!.map((x) => Media.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "about": about,
    "rule": rule,
    "rate": rate,
    "latitude": latitude,
    "longitude": longitude,
    "way_services": wayServices == null ? [] : List<dynamic>.from(wayServices!.map((x) => x.toJson())),
    "media": media == null ? [] : List<dynamic>.from(media!.map((x) => x.toJson())),
  };
}

class Media {
  int? id;
  String? image;

  Media({
    this.id,
    this.image,
  });

  factory Media.fromJson(Map<String, dynamic> json) => Media(
    id: json["id"],
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "image": image,
  };
}

class WayService {
  int? id;
  String? name;
  String? price;

  WayService({
    this.id,
    this.name,
    this.price,
  });

  factory WayService.fromJson(Map<String, dynamic> json) => WayService(
    id: json["id"],
    name: json["name"],
    price: json["price"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "price": price,
  };
}
