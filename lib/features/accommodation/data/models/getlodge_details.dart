// To parse this JSON data, do
//
//     final getLodgeDetail = getLodgeDetailFromJson(jsonString);

import 'dart:convert';

GetLodgeDetail getLodgeDetailFromJson(String str) => GetLodgeDetail.fromJson(json.decode(str));

String getLodgeDetailToJson(GetLodgeDetail data) => json.encode(data.toJson());

class GetLodgeDetail {
  String? msg;
  Data? data;
  int? status;

  GetLodgeDetail({
    this.msg,
    this.data,
    this.status,
  });

  factory GetLodgeDetail.fromJson(Map<String, dynamic> json) => GetLodgeDetail(
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
  int? stars;
  double? latitude;
  double? longitude;
  int? placeId;
  int? vat;
  List<Media>? media;
  List<Facility>? facilities;
  Rule? rule;
  int? rate;
  int? users;
  bool? isFav;

  Data({
    this.id,
    this.name,
    this.about,
    this.stars,
    this.latitude,
    this.longitude,
    this.placeId,
    this.vat,
    this.media,
    this.facilities,
    this.rule,
    this.rate,
    this.users,
    this.isFav,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"],
    name: json["name"],
    about: json["about"],
    stars: json["stars"],
    latitude: json["latitude"]?.toDouble(),
    longitude: json["longitude"]?.toDouble(),
    placeId: json["place_id"],
    vat: json["vat"],
    media: json["media"] == null ? [] : List<Media>.from(json["media"]!.map((x) => Media.fromJson(x))),
    facilities: json["facilities"] == null ? [] : List<Facility>.from(json["facilities"]!.map((x) => Facility.fromJson(x))),
    rule: json["rule"] == null ? null : Rule.fromJson(json["rule"]),
    rate: json["rate"],
    users: json["users"],
    isFav: json["is_fav"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "about": about,
    "stars": stars,
    "latitude": latitude,
    "longitude": longitude,
    "place_id": placeId,
    "vat": vat,
    "media": media == null ? [] : List<dynamic>.from(media!.map((x) => x.toJson())),
    "facilities": facilities == null ? [] : List<dynamic>.from(facilities!.map((x) => x.toJson())),
    "rule": rule?.toJson(),
    "rate": rate,
    "users": users,
    "is_fav": isFav,
  };
}

class Facility {
  int? id;
  String? name;
  String? image;
  int? type;

  Facility({
    this.id,
    this.name,
    this.image,
    this.type,
  });

  factory Facility.fromJson(Map<String, dynamic> json) => Facility(
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

class Rule {
  int? id;
  int? lodgeId;
  String? checkInFrom;
  String? checkInTo;
  String? checkOutFrom;
  String? checkOutTo;
  String? rule;

  Rule({
    this.id,
    this.lodgeId,
    this.checkInFrom,
    this.checkInTo,
    this.checkOutFrom,
    this.checkOutTo,
    this.rule,
  });

  factory Rule.fromJson(Map<String, dynamic> json) => Rule(
    id: json["id"],
    lodgeId: json["lodge_id"],
    checkInFrom: json["check_in_from"],
    checkInTo: json["check_in_to"],
    checkOutFrom: json["check_out_from"],
    checkOutTo: json["check_out_to"],
    rule: json["rule"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "lodge_id": lodgeId,
    "check_in_from": checkInFrom,
    "check_in_to": checkInTo,
    "check_out_from": checkOutFrom,
    "check_out_to": checkOutTo,
    "rule": rule,
  };
}
