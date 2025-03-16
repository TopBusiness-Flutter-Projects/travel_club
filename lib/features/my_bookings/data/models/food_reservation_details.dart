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
  int? restaurantId;
  DateTime? canCancel;
  String? clientCount;
  String? userPhone;
  String? userName;
  bool? isRated;
    dynamic totalPrice;
  dynamic vat;
  dynamic rule;
  dynamic totalPriceAfterVat;

  FoodReservationDetails({
    this.id,
    this.restaurantId,
    this.canCancel,
    this.clientCount,
    this.userPhone,
    this.userName,
    this.isRated,
     this.totalPrice,
    this.vat, this.rule,
    this.totalPriceAfterVat,
  });

  factory FoodReservationDetails.fromJson(Map<String, dynamic> json) => FoodReservationDetails(
    id: json["id"],
    restaurantId: json["restaurant_id"],
    canCancel: json["canCancel"] == null ? null : DateTime.parse(json["canCancel"]),
    clientCount: json["client_count"],
    userPhone: json["user_phone"],
    userName: json["user_name"],
    isRated: json["is_rated"],
      rule: json["rule"],
        totalPrice: json["total_price"],
        vat: json["vat"],
        totalPriceAfterVat: json["total_price_after_vat"],
    
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "restaurant_id": restaurantId,
    "canCancel": "${canCancel!.year.toString().padLeft(4, '0')}-${canCancel!.month.toString().padLeft(2, '0')}-${canCancel!.day.toString().padLeft(2, '0')}",
    "client_count": clientCount,
    "user_phone": userPhone,
    "user_name": userName,
    "is_rated": isRated,
    "rule": rule,
           "total_price": totalPrice,

        "vat": vat,
        "total_price_after_vat": totalPriceAfterVat,
  };
}
