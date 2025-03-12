// To parse this JSON data, do
//
//     final getMyFoodReservationModel = getMyFoodReservationModelFromJson(jsonString);

import 'dart:convert';

GetMyFoodReservationModel getMyFoodReservationModelFromJson(String str) => GetMyFoodReservationModel.fromJson(json.decode(str));

String getMyFoodReservationModelToJson(GetMyFoodReservationModel data) => json.encode(data.toJson());

class GetMyFoodReservationModel {
  String? msg;
  Data? data;
  int? status;

  GetMyFoodReservationModel({
    this.msg,
    this.data,
    this.status,
  });

  factory GetMyFoodReservationModel.fromJson(Map<String, dynamic> json) => GetMyFoodReservationModel(
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
  List<ReservationFood>? reservations;

  Data({
    this.reservations,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    reservations: json["reservations"] == null ? [] : List<ReservationFood>.from(json["reservations"]!.map((x) => ReservationFood.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "reservations": reservations == null ? [] : List<dynamic>.from(reservations!.map((x) => x.toJson())),
  };
}

class ReservationFood {
  int? id;
  String? restaurant;
  String? date;
  dynamic transactionId;
  int? rate;
  int? process;
  String? totalPrice;
  dynamic discount;

  ReservationFood({
    this.id,
    this.restaurant,
    this.date,
    this.transactionId,
    this.rate,
    this.process,
    this.totalPrice,
    this.discount,
  });

  factory ReservationFood.fromJson(Map<String, dynamic> json) => ReservationFood(
    id: json["id"],
    restaurant: json["restaurant"],
    date: json["date"],
    transactionId: json["transaction_id"],
    rate: json["rate"],
    process: json["process"],
    totalPrice: json["total_price"],
    discount: json["discount"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "restaurant": restaurant,
    "date": date,
    "transaction_id": transactionId,
    "rate": rate,
    "process": process,
    "total_price": totalPrice,
    "discount": discount,
  };
}
