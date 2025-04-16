// To parse this JSON data, do
//
//     final getPointsHistoryModel = getPointsHistoryModelFromJson(jsonString);

import 'dart:convert';

GetPointsHistoryModel getPointsHistoryModelFromJson(String str) => GetPointsHistoryModel.fromJson(json.decode(str));

String getPointsHistoryModelToJson(GetPointsHistoryModel data) => json.encode(data.toJson());

class GetPointsHistoryModel {
    String? msg;
    List<PointModel>? data;
    int? status;

    GetPointsHistoryModel({
        this.msg,
        this.data,
        this.status,
    });

    factory GetPointsHistoryModel.fromJson(Map<String, dynamic> json) => GetPointsHistoryModel(
        msg: json["msg"],
        data: json["data"] == null ? [] : List<PointModel>.from(json["data"]!.map((x) => PointModel.fromJson(x))),
        status: json["status"],
    );

    Map<String, dynamic> toJson() => {
        "msg": msg,
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
        "status": status,
    };
}

class PointModel {
    int? id;
    dynamic? points;
    String? referenceTable;
    int? userId;
    String? createdAt;

    PointModel({
        this.id,
        this.points,
        this.referenceTable,
        this.userId,
        this.createdAt,
    });

    factory PointModel.fromJson(Map<String, dynamic> json) => PointModel(
        id: json["id"],
        points: json["points"],
        referenceTable: json["reference_table"],
        userId: json["user_id"],
        createdAt: json["created_at"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "points": points,
        "reference_table": referenceTable,
        "user_id": userId,
        "created_at": createdAt,
    };
}
