// To parse this JSON data, do
//
//     final getOrganizationsModel = getOrganizationsModelFromJson(jsonString);

import 'dart:convert';

GetOrganizationsModel getOrganizationsModelFromJson(String str) => GetOrganizationsModel.fromJson(json.decode(str));

String getOrganizationsModelToJson(GetOrganizationsModel data) => json.encode(data.toJson());

class GetOrganizationsModel {
  String? msg;
  List<OrginizationData>? data;
  int? status;

  GetOrganizationsModel({
    this.msg,
    this.data,
    this.status,
  });

  factory GetOrganizationsModel.fromJson(Map<String, dynamic> json) => GetOrganizationsModel(
    msg: json["msg"],
    data: json["data"] == null ? [] : List<OrginizationData>.from(json["data"]!.map((x) => OrginizationData.fromJson(x))),
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "msg": msg,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    "status": status,
  };
}

class OrginizationData {
  int? id;
  String? name;
  String? logo;
  dynamic? rate;
  int? users;
  bool? isFav;

  OrginizationData({
    this.id,
    this.name,
    this.logo,
    this.rate,
    this.users,
    this.isFav,
  });

  factory OrginizationData.fromJson(Map<String, dynamic> json) => OrginizationData(
    id: json["id"],
    name: json["name"],
    logo: json["logo"],
    rate: json["rate"],
    users: json["users"],
    isFav: json["is_fav"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "logo": logo,
    "rate": rate,
    "users": users,
    "is_fav": isFav,
  };
}
