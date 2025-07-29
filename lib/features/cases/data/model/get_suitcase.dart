// To parse this JSON data, do
//
//     final getNotificationsModel = getNotificationsModelFromJson(jsonString);

import 'dart:convert';

GetSuitCaseModel getNotificationsModelFromJson(String str) => GetSuitCaseModel.fromJson(json.decode(str));

String getNotificationsModelToJson(GetSuitCaseModel data) => json.encode(data.toJson());

class GetSuitCaseModel {
  String? msg;
  List<SuitCaseData>? data;
  int? status;

  GetSuitCaseModel({
    this.msg,
    this.data,
    this.status,
  });

  factory GetSuitCaseModel.fromJson(Map<String, dynamic> json) => GetSuitCaseModel(
    msg: json["msg"],
    data: json["data"] == null ? [] : List<SuitCaseData>.from(json["data"]!.map((x) => SuitCaseData.fromJson(x))),
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "msg": msg,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    "status": status,
  };
}


 
class SuitCaseData {
  int? id;
  String? title;
  num? price;
  num? discount;
  num? priceAfterDiscount;
  String? image;

  SuitCaseData({
    this.id,
    this.title,
    this.price,
    this.discount,
    this.priceAfterDiscount,
    this.image,
  });

  factory SuitCaseData.fromJson(Map<String, dynamic> json) => SuitCaseData(
        id: json["id"],
        title: json["title"],
        price: json["price"],
        discount: json["discount"],
        priceAfterDiscount: json["price_after_discount"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "price": price,
        "discount": discount,
        "price_after_discount": priceAfterDiscount,
        "image": image,
      };
}
