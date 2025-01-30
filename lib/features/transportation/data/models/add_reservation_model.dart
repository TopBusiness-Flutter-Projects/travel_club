// To parse this JSON data, do
//
//     final addBusReservationModel = addBusReservationModelFromJson(jsonString);

import 'dart:convert';

AddBusReservationModel addBusReservationModelFromJson(String str) => AddBusReservationModel.fromJson(json.decode(str));

String addBusReservationModelToJson(AddBusReservationModel data) => json.encode(data.toJson());

class AddBusReservationModel {
    String? msg;
    Data? data;
    int? status;

    AddBusReservationModel({
        this.msg,
        this.data,
        this.status,
    });

    factory AddBusReservationModel.fromJson(Map<String, dynamic> json) => AddBusReservationModel(
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
    dynamic totalPrice;
    dynamic vat;
    dynamic totalPriceAfterVat;
    List<ReservedChairsNumber>? departureReservedChairsNumber;
    List<ReservedChairsNumber>? returnReservedChairsNumber;

    Data({
        this.totalPrice,
        this.vat,
        this.totalPriceAfterVat,
        this.departureReservedChairsNumber,
        this.returnReservedChairsNumber,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        totalPrice: json["total_price"],
        vat: json["vat"],
        totalPriceAfterVat: json["total_price_after_vat"],
        departureReservedChairsNumber: json["departureReservedChairsNumber"] == null ? [] : List<ReservedChairsNumber>.from(json["departureReservedChairsNumber"]!.map((x) => ReservedChairsNumber.fromJson(x))),
        returnReservedChairsNumber: json["returnReservedChairsNumber"] == null ? [] : List<ReservedChairsNumber>.from(json["returnReservedChairsNumber"]!.map((x) => ReservedChairsNumber.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "total_price": totalPrice,
        "vat": vat,
        "total_price_after_vat": totalPriceAfterVat,
        "departureReservedChairsNumber": departureReservedChairsNumber == null ? [] : List<dynamic>.from(departureReservedChairsNumber!.map((x) => x.toJson())),
        "returnReservedChairsNumber": returnReservedChairsNumber == null ? [] : List<dynamic>.from(returnReservedChairsNumber!.map((x) => x.toJson())),
    };
}

class ReservedChairsNumber {
    int? id;
    int? number;
    int? status;

    ReservedChairsNumber({
        this.id,
        this.number,
        this.status,
    });

    factory ReservedChairsNumber.fromJson(Map<String, dynamic> json) => ReservedChairsNumber(
        id: json["id"],
        number: json["number"],
        status: json["status"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "number": number,
        "status": status,
    };
}
