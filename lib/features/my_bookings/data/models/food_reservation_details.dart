// To parse this JSON data, do
//
//     final getFoodReservationDetailsModel = getFoodReservationDetailsModelFromJson(jsonString);

import 'dart:convert';

import '../../../food/data/models/get_menu_meals_model.dart';

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
  dynamic canCancel;
  String? clientCount;
  String? userPhone;
  String? userName;
  bool? isRated;
  int? priceTable;
  String? totalPrice;
  String? totalPriceAfterVat;
  String? rule;
  List<MealModel>? meals;
  int? vat;

  FoodReservationDetails({
    this.id,
    this.restaurantId,
    this.canCancel,
    this.clientCount,
    this.userPhone,
    this.userName,
    this.isRated,
    this.priceTable,
    this.totalPrice,
    this.totalPriceAfterVat,
    this.rule,
    this.meals,
    this.vat,
  });

  factory FoodReservationDetails.fromJson(Map<String, dynamic> json) => FoodReservationDetails(
    id: json["id"],
    restaurantId: json["restaurant_id"],
    canCancel: json["canCancel"],
    clientCount: json["client_count"],
    userPhone: json["user_phone"],
    userName: json["user_name"],
    isRated: json["is_rated"],
    priceTable: json["price_table"],
    totalPrice: json["total_price"],
    totalPriceAfterVat: json["total_price_after_vat"],
    rule: json["rule"],
    meals: json["meals"] == null ? [] : List<MealModel>.from(json["meals"]!.map((x) => MealModel.fromJson(x))),
    vat: json["vat"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "restaurant_id": restaurantId,
    "canCancel": canCancel,
    "client_count": clientCount,
    "user_phone": userPhone,
    "user_name": userName,
    "is_rated": isRated,
    "price_table": priceTable,
    "total_price": totalPrice,
    "total_price_after_vat": totalPriceAfterVat,
    "rule": rule,
    "meals": meals == null ? [] : List<dynamic>.from(meals!.map((x) => x.toJson())),
    "vat": vat,
  };
}

