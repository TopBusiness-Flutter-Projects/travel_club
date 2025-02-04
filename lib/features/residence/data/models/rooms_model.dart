// To parse this JSON data, do
//
//     final getLodgesRooms = getLodgesRoomsFromJson(jsonString);

import 'dart:convert';

GetLodgesRooms getLodgesRoomsFromJson(String str) =>
    GetLodgesRooms.fromJson(json.decode(str));

String getLodgesRoomsToJson(GetLodgesRooms data) => json.encode(data.toJson());

class GetLodgesRooms {
  String? msg;
  List<RoomModel>? data;
  int? status;

  GetLodgesRooms({
    this.msg,
    this.data,
    this.status,
  });

  factory GetLodgesRooms.fromJson(Map<String, dynamic> json) => GetLodgesRooms(
        msg: json["msg"],
        data: json["data"] == null
            ? []
            : List<RoomModel>.from(
                json["data"]!.map((x) => RoomModel.fromJson(x))),
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

class RoomModel {
  int? id;
  String? name;
  int? beds;
  int? diff;
  dynamic totalPrice;
  dynamic price;
  int? lodgeId;
  dynamic canCancel;
  String? type;
  List<Facility>? facilities;
  RoomModel? recommend;
  bool isSelectedRecommend;

  RoomModel({
    this.id,
    this.name,
    this.beds,
    this.totalPrice,
    this.price,
    this.lodgeId,
    this.canCancel,
    this.type,
    this.facilities,
    this.recommend,
    this.diff,
    this.isSelectedRecommend = false,
  });

  factory RoomModel.fromJson(Map<String, dynamic> json) => RoomModel(
        id: json["id"],
        name: json["name"],
        beds: json["beds"],
        totalPrice: json["totalPrice"],
        price: json["price"],
    diff: json["diff"],
        lodgeId: json["lodge_id"],
        canCancel: json["canCancel"] ,
        type: json["type"],
        facilities: json["facilities"] == null
            ? []
            : List<Facility>.from(
                json["facilities"]!.map((x) => Facility.fromJson(x))),
        recommend: json["recommend"] == null
            ? null
            : RoomModel.fromJson(json["recommend"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "beds": beds,
        "totalPrice": totalPrice,
        "price": price,
        "diff": diff,
        "lodge_id": lodgeId,
        "canCancel":canCancel,
           // "${canCancel!.year.toString().padLeft(4, '0')}-${canCancel!.month.toString().padLeft(2, '0')}-${canCancel!.day.toString().padLeft(2, '0')}",
        "type": type,
        "facilities": facilities == null
            ? []
            : List<dynamic>.from(facilities!.map((x) => x.toJson())),
        "recommend": recommend?.toJson(),
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
