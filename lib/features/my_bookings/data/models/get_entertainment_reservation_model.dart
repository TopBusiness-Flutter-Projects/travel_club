// To parse this JSON data, do
//
//     final getEntertainmentReservationModel = getEntertainmentReservationModelFromJson(jsonString);

import 'dart:convert';

GetEntertainmentReservationModel getEntertainmentReservationModelFromJson(String str) => GetEntertainmentReservationModel.fromJson(json.decode(str));

String getEntertainmentReservationModelToJson(GetEntertainmentReservationModel data) => json.encode(data.toJson());

class GetEntertainmentReservationModel {
  String? msg;
  Data? data;
  int? status;

  GetEntertainmentReservationModel({
    this.msg,
    this.data,
    this.status,
  });

  factory GetEntertainmentReservationModel.fromJson(Map<String, dynamic> json) => GetEntertainmentReservationModel(
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
  List<ReservationEntertainment>? reservations;

  Data({
    this.reservations,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    reservations: json["reservations"] == null ? [] : List<ReservationEntertainment>.from(json["reservations"]!.map((x) => ReservationEntertainment.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "reservations": reservations == null ? [] : List<dynamic>.from(reservations!.map((x) => x.toJson())),
  };
}

class ReservationEntertainment {
  int? id;
  String? wayService;
  String? organization;
  String? date;
  dynamic transactionId;
  int? rate;
  int? process;
  String? totalPrice;
  dynamic discount;

  ReservationEntertainment({
    this.id,
    this.wayService,
    this.organization,
    this.date,
    this.transactionId,
    this.rate,
    this.process,
    this.totalPrice,
    this.discount,
  });

  factory ReservationEntertainment.fromJson(Map<String, dynamic> json) => ReservationEntertainment(
    id: json["id"],
    wayService: json["way_service"],
    organization: json["organization"],
    date: json["date"],
    transactionId: json["transaction_id"],
    rate: json["rate"],
    process: json["process"],
    totalPrice: json["total_price"],
    discount: json["discount"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "way_service": wayService,
    "organization": organization,
    "date": date,
    "transaction_id": transactionId,
    "rate": rate,
    "process": process,
    "total_price": totalPrice,
    "discount": discount,
  };
}
