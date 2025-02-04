// To parse this JSON data, do
//
//     final getLodgesModel = getLodgesModelFromJson(jsonString);

import 'dart:convert';

GetLodgesModel getLodgesModelFromJson(String str) =>
    GetLodgesModel.fromJson(json.decode(str));

String getLodgesModelToJson(GetLodgesModel data) => json.encode(data.toJson());

class GetLodgesModel {
  String? msg;
  List<LodgeModel>? data;
  int? status;

  GetLodgesModel({
    this.msg,
    this.data,
    this.status,
  });

  factory GetLodgesModel.fromJson(Map<String, dynamic> json) => GetLodgesModel(
        msg: json["msg"],
        data: json["data"] == null
            ? []
            : List<LodgeModel>.from(
                json["data"]!.map((x) => LodgeModel.fromJson(x))),
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "msg": msg,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
        "status": status,
      };
}

class LodgeModel {
  int? id;
  String? name;
  double? latitude;
  double? longitude;
  int? placeId;
  String? media;
  dynamic rate;
  dynamic rules;
  int? users;
  bool? isFav;
  bool isSelected;

  LodgeModel({
    this.id,
    this.name,
    this.latitude,
    this.longitude,
    this.placeId,
    this.media,
    this.rate,
    this.users,
    this.isFav,
    this.rules,
    this.isSelected = false,
  });

  factory LodgeModel.fromJson(Map<String, dynamic> json) => LodgeModel(
        id: json["id"],
        name: json["name"],
        latitude: json["latitude"]?.toDouble(),
        longitude: json["longitude"]?.toDouble(),
        placeId: json["place_id"],
        media: json["media"],
        rate: json["rate"],
        rules: json["rules"],
        users: json["users"],
    isFav: json["is_fav"],
  );
    
  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "latitude": latitude,
        "longitude": longitude,
        "place_id": placeId,
        "media": media,
        "rate": rate,
        "rules": rules,
    "users": users,
    "is_fav": isFav,
  };
}
