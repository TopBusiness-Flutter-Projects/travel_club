// To parse this JSON data, do
//
//     final getMenuMealsModel = getMenuMealsModelFromJson(jsonString);

import 'dart:convert';

GetMenuMealsModel getMenuMealsModelFromJson(String str) => GetMenuMealsModel.fromJson(json.decode(str));

String getMenuMealsModelToJson(GetMenuMealsModel data) => json.encode(data.toJson());

class GetMenuMealsModel {
    String? msg;
    List<MealModel>? data;
    int? status;

    GetMenuMealsModel({
        this.msg,
        this.data,
        this.status,
    });

    factory GetMenuMealsModel.fromJson(Map<String, dynamic> json) => GetMenuMealsModel(
        msg: json["msg"],
        data: json["data"] == null ? [] : List<MealModel>.from(json["data"]!.map((x) => MealModel.fromJson(x))),
        status: json["status"],
    );

    Map<String, dynamic> toJson() => {
        "msg": msg,
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
        "status": status,
    };
}

class MealModel {
    int? id;
    String? title;
    String? description;
    String? image;
    dynamic? price;
    dynamic? priceAfterDiscount;
    dynamic? discount;
    int userQty ;

    MealModel({
        this.id,
        this.title,
        this.description,
        this.image,
        this.price,
        this.priceAfterDiscount,
        this.discount,
        this.userQty = 0,
    });

    factory MealModel.fromJson(Map<String, dynamic> json) => MealModel(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        image: json["image"],
        price: json["price"],
        priceAfterDiscount: json["price_after_discount"],
        discount: json["discount"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
        "image": image,
        "price": price,
        "price_after_discount": priceAfterDiscount,
        "discount": discount,
    };
}
