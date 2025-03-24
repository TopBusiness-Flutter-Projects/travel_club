// To parse this JSON data, do
//
//     final addEntertainmentReservationModel = addEntertainmentReservationModelFromJson(jsonString);

import 'dart:convert';

AddEntertainmentReservationModel addEntertainmentReservationModelFromJson(String str) => AddEntertainmentReservationModel.fromJson(json.decode(str));

String addEntertainmentReservationModelToJson(AddEntertainmentReservationModel data) => json.encode(data.toJson());

class AddEntertainmentReservationModel {
    String? msg;
    Data? data;
    int? status;

    AddEntertainmentReservationModel({
        this.msg,
        this.data,
        this.status,
    });

    factory AddEntertainmentReservationModel.fromJson(Map<String, dynamic> json) => AddEntertainmentReservationModel(
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
    int? reservationId;
    dynamic totalPrice;
    dynamic totalPriceAfterVat;
    dynamic vat;

    Data({
        this.reservationId,
        this.totalPrice,
        this.totalPriceAfterVat,
        this.vat,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        reservationId: json["reservation_id"],
        totalPrice: json["total_price"],
        totalPriceAfterVat: json["total_price_after_vat"],
        vat: json["vat"],
    );

    Map<String, dynamic> toJson() => {
        "reservation_id": reservationId,
        "total_price": totalPrice,
        "total_price_after_vat": totalPriceAfterVat,
        "vat": vat,
    };
}
