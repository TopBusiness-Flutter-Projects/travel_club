// To parse this JSON data, do
//
//     final checkCopouneModel = checkCopouneModelFromJson(jsonString);

import 'dart:convert';

CheckCopouneModel checkCopouneModelFromJson(String str) => CheckCopouneModel.fromJson(json.decode(str));

String checkCopouneModelToJson(CheckCopouneModel data) => json.encode(data.toJson());

class CheckCopouneModel {
    String? msg;
    double? data;
    int? status;

    CheckCopouneModel({
        this.msg,
        this.data,
        this.status,
    });

    factory CheckCopouneModel.fromJson(Map<String, dynamic> json) => CheckCopouneModel(
        msg: json["msg"],
        data: json["data"]?.toDouble(),
        status: json["status"],
    );

    Map<String, dynamic> toJson() => {
        "msg": msg,
        "data": data,
        "status": status,
    };
}
