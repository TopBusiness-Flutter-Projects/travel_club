// To parse this JSON data, do
//
//     final getSettingModel = getSettingModelFromJson(jsonString);

import 'dart:convert';

GetSettingModel getSettingModelFromJson(String str) => GetSettingModel.fromJson(json.decode(str));

String getSettingModelToJson(GetSettingModel data) => json.encode(data.toJson());

class GetSettingModel {
  String? msg;
  Data? data;
  int? status;

  GetSettingModel({
    this.msg,
    this.data,
    this.status,
  });

  factory GetSettingModel.fromJson(Map<String, dynamic> json) => GetSettingModel(
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
  String? aboutUs;
  String? termsAndConditions;
  String? privacy;

  Data({
    this.aboutUs,
    this.termsAndConditions,
    this.privacy,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    aboutUs: json["about_us"],
    termsAndConditions: json["terms_and_conditions"],
    privacy: json["privacy"],
  );

  Map<String, dynamic> toJson() => {
    "about_us": aboutUs,
    "terms_and_conditions": termsAndConditions,
    "privacy": privacy,
  };
}
