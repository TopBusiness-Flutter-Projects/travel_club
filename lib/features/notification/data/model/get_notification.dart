// To parse this JSON data, do
//
//     final getNotificationsModel = getNotificationsModelFromJson(jsonString);

import 'dart:convert';

GetNotificationsModel getNotificationsModelFromJson(String str) => GetNotificationsModel.fromJson(json.decode(str));

String getNotificationsModelToJson(GetNotificationsModel data) => json.encode(data.toJson());

class GetNotificationsModel {
  String? msg;
  List<NotificationData>? data;
  int? status;

  GetNotificationsModel({
    this.msg,
    this.data,
    this.status,
  });

  factory GetNotificationsModel.fromJson(Map<String, dynamic> json) => GetNotificationsModel(
    msg: json["msg"],
    data: json["data"] == null ? [] : List<NotificationData>.from(json["data"]!.map((x) => NotificationData.fromJson(x))),
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "msg": msg,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    "status": status,
  };
}

class NotificationData {
  int? id;
  String? title;
  int? seen;
  String? body;
  int? moduleId;
  int? referenceId;
  String? referenceTable;
  String? createdAt;

  NotificationData({
    this.id,
    this.title,
    this.seen,
    this.body,
    this.moduleId,
    this.referenceId,
    this.referenceTable,
    this.createdAt,
  });

  factory NotificationData.fromJson(Map<String, dynamic> json) => NotificationData(
    id: json["id"],
    title: json["title"],
    seen: json["seen"],
    body: json["body"],
    moduleId: json["module_id"],
    referenceId: json["reference_id"],
    referenceTable: json["reference_table"],
    createdAt: json["created_at"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "seen": seen,
    "body": body,
    "module_id": moduleId,
    "reference_id": referenceId,
    "reference_table": referenceTable,
    "created_at": createdAt,
  };
}
