// To parse this JSON data, do
//
//     final bookSuitCaseDetailsModel = bookSuitCaseDetailsModelFromJson(jsonString);

import 'dart:convert';

BookSuitCaseDetailsModel bookSuitCaseDetailsModelFromJson(String str) => BookSuitCaseDetailsModel.fromJson(json.decode(str));

String bookSuitCaseDetailsModelToJson(BookSuitCaseDetailsModel data) => json.encode(data.toJson());

class BookSuitCaseDetailsModel {
    String? msg;
    Data? data;
    int? status;

    BookSuitCaseDetailsModel({
        this.msg,
        this.data,
        this.status,
    });

    factory BookSuitCaseDetailsModel.fromJson(Map<String, dynamic> json) => BookSuitCaseDetailsModel(
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
    int? nightCount;
    num? totalPrice;
    num? vat;
    num? totalPriceAfterVat;

    Data({
        this.id,
        this.nightCount,
        this.totalPrice,
        this.vat,
        this.totalPriceAfterVat,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        nightCount: json["night_count"],
        totalPrice: json["total_price"],
        vat: json["vat"],
        totalPriceAfterVat: json["total_price_after_vat"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "night_count": nightCount,
        "total_price": totalPrice,
        "vat": vat,
        "total_price_after_vat": totalPriceAfterVat,
    };
}
