// To parse this JSON data, do
//
//     final getMyTransportationReservationModel = getMyTransportationReservationModelFromJson(jsonString);

import 'dart:convert';

GetMyTransportationReservationModel getMyTransportationReservationModelFromJson(String str) => GetMyTransportationReservationModel.fromJson(json.decode(str));

String getMyTransportationReservationModelToJson(GetMyTransportationReservationModel data) => json.encode(data.toJson());

class GetMyTransportationReservationModel {
    String? msg;
    Data? data;
    int? status;

    GetMyTransportationReservationModel({
        this.msg,
        this.data,
        this.status,
    });

    factory GetMyTransportationReservationModel.fromJson(Map<String, dynamic> json) => GetMyTransportationReservationModel(
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
    List<TransportationReservation>? reservations;

    Data({
        this.reservations,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        reservations: json["reservations"] == null ? [] : List<TransportationReservation>.from(json["reservations"]!.map((x) => TransportationReservation.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "reservations": reservations == null ? [] : List<dynamic>.from(reservations!.map((x) => x.toJson())),
    };
}

class TransportationReservation {
    int? id;
    String? bus;
    String? companyImage;
    int? capacity;
    String? departureTime;
    String? returnTime;
    dynamic transactionId;
    int? process;
    String? departureDate;
    String? returnDate;
    dynamic totalPrice;
    int? isDeparture;
    dynamic discount;

    TransportationReservation({
        this.id,
        this.bus,
        this.companyImage,
        this.capacity,
        this.departureTime,
        this.returnTime,
        this.transactionId,
        this.process,
        this.departureDate,
        this.returnDate,
        this.totalPrice,
        this.isDeparture,
        this.discount,
    });

    factory TransportationReservation.fromJson(Map<String, dynamic> json) => TransportationReservation(
        id: json["id"],
        bus: json["bus"],
        companyImage: json["company_image"],
        capacity: json["capacity"],
        departureTime: json["departure_time"],
        returnTime: json["return_time"],
        transactionId: json["transaction_id"],
        process: json["process"],
        departureDate: json["departure_date"],
        returnDate: json["return_date"] ,
        totalPrice: json["total_price"],
        isDeparture: json["is_departure"],
        discount: json["discount"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "bus": bus,
        "company_image": companyImage,
        "capacity": capacity,
        "departure_time": departureTime,
        "return_time": returnTime,
        "transaction_id": transactionId,
        "process": process,
        "departure_date": departureDate,
        "return_date": returnDate,
        "total_price": totalPrice,
        "is_departure": isDeparture,
        "discount": discount,
    };
}
