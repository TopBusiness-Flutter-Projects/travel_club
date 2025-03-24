// To parse this JSON data, do
//
//     final getEntertainmentReservationDetailsModel = getEntertainmentReservationDetailsModelFromJson(jsonString);

import 'dart:convert';

GetEntertainmentReservationDetailsModel getEntertainmentReservationDetailsModelFromJson(String str) => GetEntertainmentReservationDetailsModel.fromJson(json.decode(str));

String getEntertainmentReservationDetailsModelToJson(GetEntertainmentReservationDetailsModel data) => json.encode(data.toJson());

class GetEntertainmentReservationDetailsModel {
  String? msg;
  EntertainmentData? data;
  int? status;

  GetEntertainmentReservationDetailsModel({
    this.msg,
    this.data,
    this.status,
  });

  factory GetEntertainmentReservationDetailsModel.fromJson(Map<String, dynamic> json) => GetEntertainmentReservationDetailsModel(
    msg: json["msg"],
    data: json["data"] == null ? null : EntertainmentData.fromJson(json["data"]),
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "msg": msg,
    "data": data?.toJson(),
    "status": status,
  };
}

class EntertainmentData {
  int? id;
  int? organizationId;
  DateTime? canCancel;
  String? clientCount;
  DateTime? date;
  String? userName;
  String? userPhone;
  String? rule;
  bool? isRated;
  dynamic vat;
 dynamic totalPrice;
  dynamic totalPriceAfterVat;

  EntertainmentData({
    this.id,
    this.organizationId,
    this.canCancel,
    this.clientCount,
    this.date,
    this.userName,
    this.userPhone,
    this.rule,
    this.isRated,
    this.vat,
    this.totalPrice,
    this.totalPriceAfterVat,
  });

  factory EntertainmentData.fromJson(Map<String, dynamic> json) => EntertainmentData(
    id: json["id"],
    organizationId: json["organization_id"],
    canCancel: json["canCancel"] == null ? null : DateTime.parse(json["canCancel"]),
    clientCount: json["client_count"],
    date: json["date"] == null ? null : DateTime.parse(json["date"]),
    userName: json["user_name"],
    rule: json["rule"],
    userPhone: json["user_phone"],
    isRated: json["is_rated"],
    vat: json["vat"],
    totalPrice: json["total_price"],
    totalPriceAfterVat: json["total_price_after_vat"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "organization_id": organizationId,
    "canCancel": "${canCancel!.year.toString().padLeft(4, '0')}-${canCancel!.month.toString().padLeft(2, '0')}-${canCancel!.day.toString().padLeft(2, '0')}",
    "client_count": clientCount,
    "date": "${date!.year.toString().padLeft(4, '0')}-${date!.month.toString().padLeft(2, '0')}-${date!.day.toString().padLeft(2, '0')}",
    "user_name": userName,
    "user_phone": userPhone,
    "rule": rule,
    "is_rated": isRated,
    "vat": vat,
    "total_price": totalPrice,
    "total_price_after_vat": totalPriceAfterVat,
  };
}
