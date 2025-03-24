// To parse this JSON data, do
//
//     final getOthersModel = getOthersModelFromJson(jsonString);

import 'dart:convert';

GetOthersModel getOthersModelFromJson(String str) => GetOthersModel.fromJson(json.decode(str));

String getOthersModelToJson(GetOthersModel data) => json.encode(data.toJson());

class GetOthersModel {
  String? msg;
  List<Others>? data;
  int? status;

  GetOthersModel({
    this.msg,
    this.data,
    this.status,
  });

  factory GetOthersModel.fromJson(Map<String, dynamic> json) => GetOthersModel(
    msg: json["msg"],
    data: json["data"] == null ? [] : List<Others>.from(json["data"]!.map((x) => Others.fromJson(x))),
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "msg": msg,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    "status": status,
  };
}

class Others {
  int? id;
  String? title;
  String? image;

  Others({
    this.id,
    this.title,
    this.image,
  });

  factory Others.fromJson(Map<String, dynamic> json) => Others(
    id: json["id"],
    title: json["title"],
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "image": image,
  };
}
