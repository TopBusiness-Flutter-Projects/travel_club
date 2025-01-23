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
    int? guest;
    List<RoomModel>? rooms;
    dynamic totalPrice;
    dynamic totalNights;
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
       this. totalNights,
        this.vat,
        this.totalPriceAfterVat,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        from: json["from"],
        to: json["to"],
        canCancel: json["canCancel"],
        process: json["process"],
        guest: json["guest"],
        rooms: json["rooms"] == null ? [] : List<RoomModel>.from(json["rooms"]!.map((x) => RoomModel.fromJson(x))),
        totalPrice: json["total_price"],
        totalNights: json["total_nights"],
        vat: json["vat"],
        totalPriceAfterVat: json["total_price_after_vat"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "from": "${from!.year.toString().padLeft(4, '0')}-${from!.month.toString().padLeft(2, '0')}-${from!.day.toString().padLeft(2, '0')}",
        "to": "${to!.year.toString().padLeft(4, '0')}-${to!.month.toString().padLeft(2, '0')}-${to!.day.toString().padLeft(2, '0')}",
        "canCancel": canCancel,
        "process": process,
        "guest": guest,
        "rooms": rooms == null ? [] : List<dynamic>.from(rooms!.map((x) => x.toJson())),
        "total_price": totalPrice,
        "total_nights": totalNights,
        "vat": vat,
        "total_price_after_vat": totalPriceAfterVat,
    };
}
