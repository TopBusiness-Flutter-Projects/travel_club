// To parse this JSON data, do
//
//     final getResidenceReservationDetailsModel = getResidenceReservationDetailsModelFromJson(jsonString);

import 'dart:convert';

import 'package:travel_club/features/residence/data/models/rooms_model.dart';

GetResidenceReservationDetailsModel getResidenceReservationDetailsModelFromJson(String str) => GetResidenceReservationDetailsModel.fromJson(json.decode(str));

String getResidenceReservationDetailsModelToJson(GetResidenceReservationDetailsModel data) => json.encode(data.toJson());

class GetResidenceReservationDetailsModel {
    String? msg;
    Data? data;
    int? status;
    GetResidenceReservationDetailsModel({
        this.msg,
        this.data,
        this.status,
    });
    factory GetResidenceReservationDetailsModel.fromJson(Map<String, dynamic> json) => GetResidenceReservationDetailsModel(
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
    dynamic from;
    dynamic to;
    dynamic canCancel;
    int? process;
    int? lodgeId;
    int? guest;  bool? isRated;

    List<RoomModel>? rooms;
    dynamic totalPrice;
    dynamic vat;
    dynamic totalPriceAfterVat;

    Data({
        this.id,
        this.from,
        this.to,
        this.canCancel,
        this.process,
        this.guest,
        this.rooms,
        this.totalPrice,
       this.lodgeId,    this.isRated,

        this.vat,
        this.totalPriceAfterVat,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        from: json["from"],
        to: json["to"],
        canCancel: json["canCancel"],
        process: json["process"],
        guest: json["guest"],    isRated: json["is_rated"],

        rooms: json["rooms"] == null ? [] : List<RoomModel>.from(json["rooms"]!.map((x) => RoomModel.fromJson(x))),
        totalPrice: json["total_price"],
        lodgeId: json["lodge_id"],

        vat: json["vat"],
        totalPriceAfterVat: json["total_price_after_vat"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "lodge_id": lodgeId,
        "from": "${from!.year.toString().padLeft(4, '0')}-${from!.month.toString().padLeft(2, '0')}-${from!.day.toString().padLeft(2, '0')}",
        "to": "${to!.year.toString().padLeft(4, '0')}-${to!.month.toString().padLeft(2, '0')}-${to!.day.toString().padLeft(2, '0')}",
        "canCancel": canCancel,
        "process": process,
        "guest": guest,    "is_rated": isRated,

        "rooms": rooms == null ? [] : List<dynamic>.from(rooms!.map((x) => x.toJson())),
        "total_price": totalPrice,
        "vat": vat,
        "total_price_after_vat": totalPriceAfterVat,
    };
}
