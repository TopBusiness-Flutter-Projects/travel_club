// To parse this JSON data, do
//
//     final getHomeModel = getHomeModelFromJson(jsonString);

import 'dart:convert';

import 'package:travel_club/features/cases/data/model/get_suitcase.dart';

import '../../../auth/data/models/login_model.dart';

GetHomeModel getHomeModelFromJson(String str) =>
    GetHomeModel.fromJson(json.decode(str));

String getHomeModelToJson(GetHomeModel data) => json.encode(data.toJson());

class GetHomeModel {
  String? msg;
  Data? data;
  int? status;

  GetHomeModel({
    this.msg,
    this.data,
    this.status,
  });

  factory GetHomeModel.fromJson(Map<String, dynamic> json) => GetHomeModel(
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
  int? notifications;
  UserDataModel? user;
  List<ModuleModel>? modules;
  List<Offer>? offers;
  List<SuitCaseData>? suitcases;

  Data({
    this.notifications,
    this.user,
    this.modules,
    this.offers,
    this.suitcases,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        notifications: json["notifications"],
        user: json["user"],
        modules: json["modules"] == null
            ? []
            : List<ModuleModel>.from(
                json["modules"]!.map((x) => ModuleModel.fromJson(x))),
        offers: json["offers"] == null
            ? []
            : List<Offer>.from(json["offers"]!.map((x) => Offer.fromJson(x))),
        suitcases: json["suitcases"] == null
            ? []
            : List<SuitCaseData>.from(
                json["suitcases"]!.map((x) => SuitCaseData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "notifications": notifications,
        "user": user,
        "modules": modules == null
            ? []
            : List<dynamic>.from(modules!.map((x) => x.toJson())),
        "offers": offers == null
            ? []
            : List<dynamic>.from(offers!.map((x) => x.toJson())),
        "suitcases": suitcases == null
            ? []
            : List<dynamic>.from(suitcases!.map((x) => x.toJson())),
      };
}

class ModuleModel {
  int? id;
  String? name;
  String? image;
  int? type;

  ModuleModel({
    this.id,
    this.name,
    this.image,
    this.type,
  });

  factory ModuleModel.fromJson(Map<String, dynamic> json) => ModuleModel(
        id: json["id"],
        name: json["name"],
        image: json["image"],
        type: json["type"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image": image,
        "type": type,
      };
}

class Offer {
  int? id;
  String? title;
  int? discount;
  String? image;
  String? description;

  Offer({
    this.id,
    this.title,
    this.discount,
    this.image,
    this.description,
  });

  factory Offer.fromJson(Map<String, dynamic> json) => Offer(
        id: json["id"],
        title: json["title"],
        discount: json["discount"],
        image: json["image"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "discount": discount,
        "image": image,
        "description": description,
      };
}
