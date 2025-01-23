// To parse this JSON data, do
//
//     final cancelReservation = cancelReservationFromJson(jsonString);

import 'dart:convert';

CancelReservationModel cancelReservationFromJson(String str) => CancelReservationModel.fromJson(json.decode(str));

String cancelReservationToJson(CancelReservationModel data) => json.encode(data.toJson());

class CancelReservationModel {
  String? msg;
  bool? data;
  int? status;

  CancelReservationModel({
    this.msg,
    this.data,
    this.status,
  });

  factory CancelReservationModel.fromJson(Map<String, dynamic> json) => CancelReservationModel(
    msg: json["msg"],
    data: json["data"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "msg": msg,
    "data": data,
    "status": status,
  };
}
