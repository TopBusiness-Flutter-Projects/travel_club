// To parse this JSON data, do
//
//     final suitCaseReservationDetailsModel = suitCaseReservationDetailsModelFromJson(jsonString);

import 'dart:convert';

import 'suitcase_reservation.dart';

SuitCaseReservationDetailsModel suitCaseReservationDetailsModelFromJson(String str) => SuitCaseReservationDetailsModel.fromJson(json.decode(str));

String suitCaseReservationDetailsModelToJson(SuitCaseReservationDetailsModel data) => json.encode(data.toJson());

class SuitCaseReservationDetailsModel {
    String? msg;
    Data? data;
    int? status;

    SuitCaseReservationDetailsModel({
        this.msg,
        this.data,
        this.status,
    });

    factory SuitCaseReservationDetailsModel.fromJson(Map<String, dynamic> json) => SuitCaseReservationDetailsModel(
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
    SuitCaseReservation? suitCaseReservation;
    String? image;
    int? nightCount;
    int? transactionId;
    String? date;
    int? process;
    String? rule;
    int? totalPrice;
    num? vat;
    num? totalPriceAfterVat;
    dynamic canCancel;

    Data({
        this.id,
        this.suitCaseReservation,           
        this.process,
        this.rule,
        this.totalPrice,
        this.vat,
        this.totalPriceAfterVat,
        this.canCancel,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        suitCaseReservation: json["suit_case_reservation"] == null ? null : SuitCaseReservation.fromJson(json["suit_case_reservation"]),
    
        rule: json["rule"],
        totalPrice: json["total_price"],
        vat: json["vat"],
        totalPriceAfterVat: json["total_price_after_vat"],
        canCancel: json["canCancel"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "suit_case_reservation": suitCaseReservation?.toJson(),
   
      
        "process": process,
        "rule": rule,
        "total_price": totalPrice,
        "vat": vat,
        "total_price_after_vat": totalPriceAfterVat,
        "canCancel": canCancel,
    };
}
