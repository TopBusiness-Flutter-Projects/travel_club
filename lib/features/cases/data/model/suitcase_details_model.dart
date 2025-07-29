// To parse this JSON data, do
//
//     final getSuitCaseDetailsModel = getSuitCaseDetailsModelFromJson(jsonString);

import 'dart:convert';

GetSuitCaseDetailsModel getSuitCaseDetailsModelFromJson(String str) => GetSuitCaseDetailsModel.fromJson(json.decode(str));

String getSuitCaseDetailsModelToJson(GetSuitCaseDetailsModel data) => json.encode(data.toJson());

class GetSuitCaseDetailsModel {
    String? msg;
    Data? data;
    int? status;

    GetSuitCaseDetailsModel({
        this.msg,
        this.data,
        this.status,
    });

    factory GetSuitCaseDetailsModel.fromJson(Map<String, dynamic> json) => GetSuitCaseDetailsModel(
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
    int? id;
    String? title;
    String? image;
    int? price;
    int? discount;
    double? priceAfterDiscount;
    String? description;
    String? priceWithMonths;
    List<StartsDate>? startsDates;

    Data({
        this.id,
        this.title,
        this.image,
        this.price,
        this.discount,
        this.priceAfterDiscount,
        this.description,
        this.priceWithMonths,
        this.startsDates,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        title: json["title"],
        image: json["image"],
        price: json["price"],
        discount: json["discount"],
        priceAfterDiscount: json["price_after_discount"]?.toDouble(),
        description: json["description"],
        priceWithMonths: json["price_with_months"],
        startsDates: json["starts_dates"] == null ? [] : List<StartsDate>.from(json["starts_dates"]!.map((x) => StartsDate.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "image": image,
        "price": price,
        "discount": discount,
        "price_after_discount": priceAfterDiscount,
        "description": description,
        "price_with_months": priceWithMonths,
        "starts_dates": startsDates == null ? [] : List<dynamic>.from(startsDates!.map((x) => x.toJson())),
    };
}

class StartsDate {
    int? id;
    String? from;
    String? to;
    int? available;
   

    StartsDate({
        this.id,
        this.from,
        this.to,
        this.available,
        
    });

    factory StartsDate.fromJson(Map<String, dynamic> json) => StartsDate(
        id: json["id"],
        from: json["from"] ,
        to: json["to"],
        available: json["available"],
       
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "from": from,
        "to": to,
        "available": available,
      
    };
}
