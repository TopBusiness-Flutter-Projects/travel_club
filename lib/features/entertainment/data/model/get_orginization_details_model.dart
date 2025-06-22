// To parse this JSON data, do
//
//     final getOrganizationDetails = getOrganizationDetailsFromJson(jsonString);

import 'dart:convert';

GetOrganizationDetails getOrganizationDetailsFromJson(String str) =>
    GetOrganizationDetails.fromJson(json.decode(str));

String getOrganizationDetailsToJson(GetOrganizationDetails data) =>
    json.encode(data.toJson());

class GetOrganizationDetails {
  String? msg;
  Data? data;
  int? status;

  GetOrganizationDetails({
    this.msg,
    this.data,
    this.status,
  });

  factory GetOrganizationDetails.fromJson(Map<String, dynamic> json) =>
      GetOrganizationDetails(
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
  String? logo;
  String? about;
  dynamic rule;
  int? rate;
  int? users;
  bool? isFav;
  String? latitude;
  String? longitude;
  List<WayServiceCategoryModel>? wayServicesCategory;
  List<Media>? media;
  List<Hour>? hours;

  Data({
    this.id,
    this.name,
    this.logo,
    this.about,
    this.rule,
    this.rate,
    this.users,
    this.isFav,
    this.latitude,
    this.longitude,
    this.wayServicesCategory,
    this.media,
    this.hours,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        name: json["name"],
        logo: json["logo"],
        about: json["about"],
        rule: json["rule"],
        rate: json["rate"],
        users: json["users"],
        isFav: json["is_fav"],
        latitude: json["latitude"],
        longitude: json["longitude"],
        wayServicesCategory: json["wayServiceCategory"] == null
            ? []
            : List<WayServiceCategoryModel>.from(
                json["way_services"]!.map((x) => WayServiceCategoryModel.fromJson(x))),
        media: json["media"] == null
            ? []
            : List<Media>.from(json["media"]!.map((x) => Media.fromJson(x))),
        hours: json["hours"] == null
            ? []
            : List<Hour>.from(json["hours"]!.map((x) => Hour.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "logo": logo,
        "about": about,
        "rule": rule,
        "rate": rate,
        "users": users,
        "is_fav": isFav,
        "latitude": latitude,
        "longitude": longitude,
        "wayServiceCategory": wayServicesCategory == null
            ? []
            : List<dynamic>.from(wayServicesCategory!.map((x) => x.toJson())),
        "media": media == null
            ? []
            : List<dynamic>.from(media!.map((x) => x.toJson())),
        "hours": hours == null
            ? []
            : List<dynamic>.from(hours!.map((x) => x.toJson())),
      };
}

class Hour {
  int? id;
  String? fromDay;
  String? toDay;
  String? from;
  String? to;

  Hour({
    this.id,
    this.fromDay,
    this.toDay,
    this.from,
    this.to,
  });

  factory Hour.fromJson(Map<String, dynamic> json) => Hour(
        id: json["id"],
        fromDay: json["fromDay"],
        toDay: json["toDay"],
        from: json["from"],
        to: json["to"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "fromDay": fromDay,
        "toDay": toDay,
        "from": from,
        "to": to,
      };
}

class Media {
  int? id;
  String? image;

  Media({
    this.id,
    this.image,
  });

  factory Media.fromJson(Map<String, dynamic> json) => Media(
        id: json["id"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "image": image,
      };
}

class WayService {
  int? id;
  String? name;
  String? price;


  WayService({
    this.id,
    this.name,
    this.price,
  });

  factory WayService.fromJson(Map<String, dynamic> json) => WayService(
        id: json["id"],
        name: json["name"],
        price: json["price"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "price": price,
      };
}
class WayServiceCategoryModel {
  int? id;
  String? name;
    List<WayService>? wayService;


  WayServiceCategoryModel({
    this.id,
    this.name,
           this.wayService,
});

   factory WayServiceCategoryModel.fromJson(Map<String, dynamic> json) => WayServiceCategoryModel(
        id: json["id"],
        name: json["name"],
        wayService: json["way_service"] == null ? [] : List<WayService>.from(json["way_service"]!.map((x) => WayService.fromJson(x))),
    );

   Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "way_service": wayService == null ? [] : List<dynamic>.from(wayService!.map((x) => x.toJson())),
    };

}
/*
"wayServiceCategory": [
            {
                "id": 1,
                "name": "Iliana Blevins",
                "way_service": [
                    {
                        "id": 1,
                        "name": "Banana",
                        "price": "100"
                    },
                    {
                        "id": 3,
                        "name": "Dalton Hess",
                        "price": "696"
                    }
                ]
            },
            {
                "id": 2,
                "name": "صAlexander Richardson",
                "way_service": [
                    {
                        "id": 2,
                        "name": "duck",
                        "price": "1200"
                    }
                ]
            }
        ],
*/