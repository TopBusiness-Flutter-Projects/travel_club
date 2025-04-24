// To parse this JSON data, do
//
//     final getPaymentTypes = getPaymentTypesFromJson(jsonString);

import 'dart:convert';

GetPaymentMethodsModel getPaymentTypesFromJson(String str) => GetPaymentMethodsModel.fromJson(json.decode(str));

String getPaymentTypesToJson(GetPaymentMethodsModel data) => json.encode(data.toJson());

class GetPaymentMethodsModel {
    String? msg;
    List<PaymentType>? data;
    int? status;

    GetPaymentMethodsModel({
        this.msg,
        this.data,
        this.status,
    });

    factory GetPaymentMethodsModel.fromJson(Map<String, dynamic> json) => GetPaymentMethodsModel(
        msg: json["msg"],
        data: json["data"] == null ? [] : List<PaymentType>.from(json["data"]!.map((x) => PaymentType.fromJson(x))),
        status: json["status"],
    );

    Map<String, dynamic> toJson() => {
        "msg": msg,
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
        "status": status,
    };
}
class PaymentType {
    int? id;
    String? name;
    bool? need;
    String? dev;
    PaymentType({
        this.id,
        this.name,
        this.need,
        this.dev,
    });
    factory PaymentType.fromJson(Map<String, dynamic> json) => PaymentType(
        id: json["id"],
        name: json["name"],
        need: json["need"],
        dev: json["dev"],
    );
    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "need": need,
        "dev": dev,
    };
}
