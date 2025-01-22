// To parse this JSON data, do
//
//     final checkPaymentStatusModel = checkPaymentStatusModelFromJson(jsonString);

import 'dart:convert';

CheckPaymentStatusModel checkPaymentStatusModelFromJson(String str) => CheckPaymentStatusModel.fromJson(json.decode(str));

String checkPaymentStatusModelToJson(CheckPaymentStatusModel data) => json.encode(data.toJson());

class CheckPaymentStatusModel {
    String? msg;
    PaymentModel? data;
    int? status;

    CheckPaymentStatusModel({
        this.msg,
        this.data,
        this.status,
    });

    factory CheckPaymentStatusModel.fromJson(Map<String, dynamic> json) => CheckPaymentStatusModel(
        msg: json["msg"],
        data: json["data"] == null ? null : PaymentModel.fromJson(json["data"]),
        status: json["status"],
    );

    Map<String, dynamic> toJson() => {
        "msg": msg,
        "data": data?.toJson(),
        "status": status,
    };
}

class PaymentModel {
    bool? status;
    String? transactionId;

    PaymentModel({
        this.status,
        this.transactionId,
    });

    factory PaymentModel.fromJson(Map<String, dynamic> json) => PaymentModel(
        status: json["status"],
        transactionId: json["transaction_id"],
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "transaction_id": transactionId,
    };
}
