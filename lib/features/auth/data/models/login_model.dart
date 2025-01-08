// To parse this JSON data, do
//
//     final loginModel = loginModelFromJson(jsonString);

import 'dart:convert';

LoginModel loginModelFromJson(String str) => LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
    String? msg;
    UserDataModel? data;
    int? status;

    LoginModel({
        this.msg,
        this.data,
        this.status,
    });

    factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        msg: json["msg"],
        data: json["data"] == null ? null : UserDataModel.fromJson(json["data"]),
        status: json["status"],
    );

    Map<String, dynamic> toJson() => {
        "msg": msg,
        "data": data?.toJson(),
        "status": status,
    };
}

class UserDataModel {
    int? id;
    String? name;
    dynamic phone;
    String? image;
    String? googleImage;
    String? code;
    dynamic points;
    dynamic notifications;
    String? token;

    UserDataModel({
        this.id,
        this.name,
        this.phone,
        this.image,
        this.googleImage,
        this.code,
        this.points,
        this.notifications,
        this.token,
    });

    factory UserDataModel.fromJson(Map<String, dynamic> json) => UserDataModel(
        id: json["id"],
        name: json["name"],
        phone: json["phone"],
        image: json["image"],
        googleImage: json["google_image"],
        code: json["code"],
        points: json["points"],
        notifications: json["notifications"],
        token: json["token"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "phone": phone,
        "image": image,
        "google_image": googleImage,
        "code": code,
        "points": points,
        "notifications": notifications,
        "token": token,
    };
}
