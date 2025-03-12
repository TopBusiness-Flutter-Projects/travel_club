// To parse this JSON data, do
//
//     final getFoodReservationDetailsModel = getFoodReservationDetailsModelFromJson(jsonString);

import 'dart:convert';

GetFoodReservationDetailsModel getFoodReservationDetailsModelFromJson(String str) => GetFoodReservationDetailsModel.fromJson(json.decode(str));

String getFoodReservationDetailsModelToJson(GetFoodReservationDetailsModel data) => json.encode(data.toJson());

class GetFoodReservationDetailsModel {
  String? msg;
  FoodReservationDetails? data;
  int? status;

  GetFoodReservationDetailsModel({
    this.msg,
    this.data,
    this.status,
  });

  factory GetFoodReservationDetailsModel.fromJson(Map<String, dynamic> json) => GetFoodReservationDetailsModel(
    msg: json["msg"],
    data: json["data"] == null ? null : FoodReservationDetails.fromJson(json["data"]),
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "msg": msg,
    "data": data?.toJson(),
    "status": status,
  };
}

class FoodReservationDetails {
  int? id;
  DateTime? canCancel;
  String? clientCount;
  String? userPhone;
  String? userName;
  bool? isRated;

  FoodReservationDetails({
    this.id,
    this.canCancel,
    this.clientCount,
    this.userPhone,
    this.userName,
    this.isRated,
  });

  factory FoodReservationDetails.fromJson(Map<String, dynamic> json) => FoodReservationDetails(
    id: json["id"],
    canCancel: json["canCancel"] == null ? null : DateTime.parse(json["canCancel"]),
    clientCount: json["client_count"],
    userPhone: json["user_phone"],
    userName: json["user_name"],
    isRated: json["is_rated"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "canCancel": "${canCancel!.year.toString().padLeft(4, '0')}-${canCancel!.month.toString().padLeft(2, '0')}-${canCancel!.day.toString().padLeft(2, '0')}",
    "client_count": clientCount,
    "user_phone": userPhone,
    "user_name": userName,
    "is_rated": isRated,
  };
}
