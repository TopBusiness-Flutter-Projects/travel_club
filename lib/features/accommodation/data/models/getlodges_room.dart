// To parse this JSON data, do
//
//     final getLodgesRooms = getLodgesRoomsFromJson(jsonString);

import 'dart:convert';

GetLodgesRooms getLodgesRoomsFromJson(String str) => GetLodgesRooms.fromJson(json.decode(str));

String getLodgesRoomsToJson(GetLodgesRooms data) => json.encode(data.toJson());

class GetLodgesRooms {
  String? msg;
  List<LoadgyRoom>? data;
  int? status;

  GetLodgesRooms({
    this.msg,
    this.data,
    this.status,
  });

  factory GetLodgesRooms.fromJson(Map<String, dynamic> json) => GetLodgesRooms(
    msg: json["msg"],
    data: json["data"] == null ? [] : List<LoadgyRoom>.from(json["data"]!.map((x) => LoadgyRoom.fromJson(x))),
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "msg": msg,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    "status": status,
  };
}

class LoadgyRoom {
  int? id;
  String? name;
  int? beds;
  int? price;
  int? lodgeId;
  bool? canCancel;
  String? type;
  List<Facility>? facilities;

  LoadgyRoom({
    this.id,
    this.name,
    this.beds,
    this.price,
    this.lodgeId,
    this.canCancel,
    this.type,
    this.facilities,
  });

  factory LoadgyRoom.fromJson(Map<String, dynamic> json) => LoadgyRoom(
    id: json["id"],
    name: json["name"],
    beds: json["beds"],
    price: json["price"],
    lodgeId: json["lodge_id"],
    canCancel: json["canCancel"],
    type: json["type"],
    facilities: json["facilities"] == null ? [] : List<Facility>.from(json["facilities"]!.map((x) => Facility.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "beds": beds,
    "price": price,
    "lodge_id": lodgeId,
    "canCancel": canCancel,
    "type": type,
    "facilities": facilities == null ? [] : List<dynamic>.from(facilities!.map((x) => x.toJson())),
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
