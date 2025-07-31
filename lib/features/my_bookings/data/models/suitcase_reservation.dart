// To parse this JSON data, do
//
//     final suitCaseReservationModel = suitCaseReservationModelFromJson(jsonString);

import 'dart:convert';

SuitCaseReservationModel suitCaseReservationModelFromJson(String str) => SuitCaseReservationModel.fromJson(json.decode(str));

String suitCaseReservationModelToJson(SuitCaseReservationModel data) => json.encode(data.toJson());

class SuitCaseReservationModel {
    String? msg;
    Data? data;
    int? status;

    SuitCaseReservationModel({
        this.msg,
        this.data,
        this.status,
    });

    factory SuitCaseReservationModel.fromJson(Map<String, dynamic> json) => SuitCaseReservationModel(
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
    List<SuitCaseReservation>? reservations;

    Data({
        this.reservations,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        reservations: json["reservations"] == null ? [] : List<SuitCaseReservation>.from(json["reservations"]!.map((x) => SuitCaseReservation.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "reservations": reservations == null ? [] : List<dynamic>.from(reservations!.map((x) => x.toJson())),
    };
}

class SuitCaseReservation {
    int? id;
    String? title;
    String? image;
    int? transactionId;
    String? date;
    num? totalPrice;
    int? process;
    int? nights;

    SuitCaseReservation({
        this.id,
        this.title,
        this.image,
        this.transactionId,
        this.date,
        this.totalPrice,
        this.process,
        this.nights,
    });

    factory SuitCaseReservation.fromJson(Map<String, dynamic> json) => SuitCaseReservation(
        id: json["id"],
        title: json["title"],
        image: json["image"],
        transactionId: json["transaction_id"],
        date: json["date"] ,
        totalPrice: json["total_price_after_vat"],
        process: json["process"],
        nights: json["night_count"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "image": image,
        "transaction_id": transactionId,
        "date": date,
        "total_price_after_vat": totalPrice,
        "process": process,
        "night_count": nights,
    };
}
