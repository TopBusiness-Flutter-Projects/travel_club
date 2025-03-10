// To parse this JSON data, do
//
//     final getRestaurantDetailsModel = getRestaurantDetailsModelFromJson(jsonString);

import 'dart:convert';

GetRestaurantDetailsModel getRestaurantDetailsModelFromJson(String str) => GetRestaurantDetailsModel.fromJson(json.decode(str));

String getRestaurantDetailsModelToJson(GetRestaurantDetailsModel data) => json.encode(data.toJson());

class GetRestaurantDetailsModel {
  String? msg;
  Data? data;
  int? status;
  GetRestaurantDetailsModel({
    this.msg,
    this.data,
    this.status,
  });
  factory GetRestaurantDetailsModel.fromJson(Map<String, dynamic> json) => GetRestaurantDetailsModel(
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
  int? id;
  String? name;
  double? latitude;
  double? longitude;
  int? hasMenu;
  int? isOpen;
  String? about;
  String? rule;
  Category? category;
  List<Rate>? rates;
  List<Time>? times;
  String? media;
  int? rate;
  int? users;
  bool? isFav;

  Data({
    this.id,
    this.name,
    this.latitude,
    this.longitude,
    this.hasMenu,
    this.isOpen,
    this.rule,
    this.about,
    this.category,
    this.rates,
    this.times,
    this.media,
    this.rate,
    this.users,
    this.isFav,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"],
    name: json["name"],
    latitude: json["latitude"]?.toDouble(),
    longitude: json["longitude"]?.toDouble(),
    hasMenu: json["has_menu"],
    isOpen: json["is_open"],
    rule: json["rule"],
    about: json["about"],
    category: json["category"] == null ? null : Category.fromJson(json["category"]),
    rates: json["rates"] == null ? [] : List<Rate>.from(json["rates"]!.map((x) => Rate.fromJson(x))),
    times: json["times"] == null ? [] : List<Time>.from(json["times"]!.map((x) => Time.fromJson(x))),
    media: json["media"],
    rate: json["rate"],
    users: json["users"],
    isFav: json["is_fav"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "latitude": latitude,
    "longitude": longitude,
    "has_menu": hasMenu,
    "is_open": isOpen,
    "rule": rule,
    "about": about,
    "category": category?.toJson(),
    "rates": rates == null ? [] : List<dynamic>.from(rates!.map((x) => x.toJson())),
    "times": times == null ? [] : List<dynamic>.from(times!.map((x) => x.toJson())),
    "media": media,
    "rate": rate,
    "users": users,
    "is_fav": isFav,
  };
}

class Category {
  int? id;
  String? name;

  Category({
    this.id,
    this.name,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
    id: json["id"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
  };
}

class Rate {
  int? id;
  String? name;
  String? image;
  String? comment;
  int? average;

  Rate({
    this.id,
    this.name,
    this.image,
    this.comment,
    this.average,
  });

  factory Rate.fromJson(Map<String, dynamic> json) => Rate(
    id: json["id"],
    name: json["name"],
    image: json["image"],
    comment: json["comment"],
    average: json["average"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "image": image,
    "comment": comment,
    "average": average,
  };
}

class Time {
  int? id;
  String? day;
  String? fromDay;
  String? toDay;
  String? from;
  String? to;

  Time({
    this.id,
    this.day,
    this.fromDay,
    this.toDay,
    this.from,
    this.to,
  });

  factory Time.fromJson(Map<String, dynamic> json) => Time(
    id: json["id"],
    day: json["day"],
    fromDay: json["fromDay"],
    toDay: json["toDay"],
    from: json["from"],
    to: json["to"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "day": day,
    "fromDay": fromDay,
    "toDay": toDay,
    "from": from,
    "to": to,
  };
}
