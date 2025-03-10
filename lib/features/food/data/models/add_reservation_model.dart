// To parse this JSON data, do
//
//     final addFoodReservationModel = addFoodReservationModelFromJson(jsonString);

import 'dart:convert';

AddFoodReservationModel addFoodReservationModelFromJson(String str) => AddFoodReservationModel.fromJson(json.decode(str));

String addFoodReservationModelToJson(AddFoodReservationModel data) => json.encode(data.toJson());

class AddFoodReservationModel {
    String? msg;
    Data? data;
    int? status;

    AddFoodReservationModel({
        this.msg,
        this.data,
        this.status,
    });

    factory AddFoodReservationModel.fromJson(Map<String, dynamic> json) => AddFoodReservationModel(
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
    int? reservationId;
    dynamic totalPriceOfMeals;
    dynamic? priceTable;
    dynamic? totalPriceAfterVat;
    dynamic? vat;
    dynamic? totalPrice;

    Data({
        this.reservationId,
        this.totalPriceOfMeals,
        this.priceTable,
        this.totalPriceAfterVat,
        this.vat,
        this.totalPrice,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        reservationId: json["reservation_id"],
        totalPriceOfMeals: json["total_price_of_meals"],
        priceTable: json["price_table"],
        totalPriceAfterVat: json["total_price_after_vat"],
        vat: json["vat"],
        totalPrice: json["total_price"],
    );

    Map<String, dynamic> toJson() => {
        "reservation_id": reservationId,
        "total_price_of_meals": totalPriceOfMeals,
        "price_table": priceTable,
        "total_price_after_vat": totalPriceAfterVat,
        "vat": vat,
        "total_price": totalPrice,
    };
}
