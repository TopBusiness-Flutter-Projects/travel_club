// To parse this JSON data, do
//
//     final getPaymentUrlModel = getPaymentUrlModelFromJson(jsonString);

import 'dart:convert';

GetPaymentUrlModel getPaymentUrlModelFromJson(String str) => GetPaymentUrlModel.fromJson(json.decode(str));

String getPaymentUrlModelToJson(GetPaymentUrlModel data) => json.encode(data.toJson());

class GetPaymentUrlModel {
    String? msg;
    Data? data;
    int? status;

    GetPaymentUrlModel({
        this.msg,
        this.data,
        this.status,
    });

    factory GetPaymentUrlModel.fromJson(Map<String, dynamic> json) => GetPaymentUrlModel(
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
    
    String? paymentUrl;

    Data({
        this.paymentUrl,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        paymentUrl: json["payment_url"],
    );

    Map<String, dynamic> toJson() => {
        "payment_url": paymentUrl,
    };
}
