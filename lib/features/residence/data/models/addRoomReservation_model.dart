// To parse this JSON data, do
//
//     final addRoomReservationModel = addRoomReservationModelFromJson(jsonString);

import 'dart:convert';

import 'package:travel_club/features/residence/data/models/rooms_model.dart';

import 'lodges_model.dart';

AddRoomReservationModel addRoomReservationModelFromJson(String str) => AddRoomReservationModel.fromJson(json.decode(str));

String addRoomReservationModelToJson(AddRoomReservationModel data) => json.encode(data.toJson());

class AddRoomReservationModel {
  String? msg;
  ReservationData? data;
  int? status;

  AddRoomReservationModel({
    this.msg,
    this.data,
    this.status,
  });

  factory AddRoomReservationModel.fromJson(Map<String, dynamic> json) => AddRoomReservationModel(
    msg: json["msg"],
    data: json["data"] == null ? null : ReservationData.fromJson(json["data"]),
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "msg": msg,
    "data": data?.toJson(),
    "status": status,
  };
}

class ReservationData {
  int? id;
  DateTime? from;
  DateTime? to;
  int? guest;
  LodgeModel? lodge;
  List<RoomModel>? rooms;
  double? totalPrice;
  double? vat;
  double? totalPriceAfterVat;

  ReservationData({
    this.id,
    this.from,
    this.to,
    this.guest,
    this.lodge,
    this.rooms,
    this.totalPrice,
    this.vat,
    this.totalPriceAfterVat,
  });

  factory ReservationData.fromJson(Map<String, dynamic> json) => ReservationData(
    id: json["id"],
    from: json["from"] == null ? null : DateTime.parse(json["from"]),
    to: json["to"] == null ? null : DateTime.parse(json["to"]),
    guest: json["guest"],
    lodge: json["lodge"] == null ? null : LodgeModel.fromJson(json["lodge"]),
    rooms: json["rooms"] == null ? [] : List<RoomModel>.from(json["rooms"]!.map((x) => RoomModel.fromJson(x))),
    totalPrice: json["total_price"],
    vat: json["vat"]?.toDouble(),
    totalPriceAfterVat: json["total_price_after_vat"]?.toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "from": "${from!.year.toString().padLeft(4, '0')}-${from!.month.toString().padLeft(2, '0')}-${from!.day.toString().padLeft(2, '0')}",
    "to": "${to!.year.toString().padLeft(4, '0')}-${to!.month.toString().padLeft(2, '0')}-${to!.day.toString().padLeft(2, '0')}",
    "guest": guest,
    "lodge": lodge?.toJson(),
    "rooms": rooms == null ? [] : List<dynamic>.from(rooms!.map((x) => x.toJson())),
    "total_price": totalPrice,
    "vat": vat,
    "total_price_after_vat": totalPriceAfterVat,
  };
}


