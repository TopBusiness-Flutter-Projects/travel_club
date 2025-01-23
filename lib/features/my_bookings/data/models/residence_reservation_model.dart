
import 'dart:convert';

import 'package:travel_club/features/residence/data/models/lodges_model.dart';

GetMyResidenceReservationModel getResidenceReservationModelFromJson(String str) => GetMyResidenceReservationModel.fromJson(json.decode(str));

String getResidenceReservationModelToJson(GetMyResidenceReservationModel data) => json.encode(data.toJson());

class GetMyResidenceReservationModel {
    String? msg;
    Data? data;
    int? status;

    GetMyResidenceReservationModel({
        this.msg,
        this.data,
        this.status,
    });

    factory GetMyResidenceReservationModel.fromJson(Map<String, dynamic> json) => GetMyResidenceReservationModel(
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
    List<ResidenceReservationModel>? reservations;

    Data({
        this.reservations,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        reservations: json["reservations"] == null ? [] : List<ResidenceReservationModel>.from(json["reservations"]!.map((x) => ResidenceReservationModel.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "reservations": reservations == null ? [] : List<dynamic>.from(reservations!.map((x) => x.toJson())),
    };
}

class ResidenceReservationModel {
    int? id;
    LodgeModel? lodge;
    dynamic transactionId;
    int? process;
    String? from;
    dynamic totalNights;
    dynamic totalPrice;
    dynamic discount;
    ResidenceReservationModel({
        this.id,
        this.lodge,
        this.transactionId,
        this.process,
        this.from,
        this.totalNights,
        this.totalPrice,
        this.discount,
    });

    factory ResidenceReservationModel.fromJson(Map<String, dynamic> json) => ResidenceReservationModel(
        id: json["id"],
        lodge: json["lodge"] == null ? null : LodgeModel.fromJson(json["lodge"]),
        transactionId: json["transaction_id"],
        process: json["process"],
        from: json["from"] ,
        totalNights: json["total_nights"],
        totalPrice: json["total_price"],
        discount: json["discount"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "lodge": lodge?.toJson(),
        "transaction_id": transactionId,
        "process": process,
        "from": from,
        "total_nights": totalNights,
        "total_price": totalPrice,
        "discount": discount,
    };
}
