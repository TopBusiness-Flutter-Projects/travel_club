// To parse this JSON data, do
//
//     final placesModel = placesModelFromJson(jsonString);

import 'dart:convert';

PlacesModel placesModelFromJson(String str) => PlacesModel.fromJson(json.decode(str));

String placesModelToJson(PlacesModel data) => json.encode(data.toJson());

class PlacesModel {
    String? msg;
    Data? data;
    int? status;

    PlacesModel({
        this.msg,
        this.data,
        this.status,
    });

    factory PlacesModel.fromJson(Map<String, dynamic> json) => PlacesModel(
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
    List<PlaceModel>? places;
    List<Lodge>? lodges;

    Data({
        this.places,
        this.lodges,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        places: json["places"] == null ? [] : List<PlaceModel>.from(json["places"]!.map((x) => PlaceModel.fromJson(x))),
        lodges: json["lodges"] == null ? [] : List<Lodge>.from(json["lodges"]!.map((x) => Lodge.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "places": places == null ? [] : List<dynamic>.from(places!.map((x) => x.toJson())),
        "lodges": lodges == null ? [] : List<dynamic>.from(lodges!.map((x) => x.toJson())),
    };
}

class Lodge {
    int? id;
    String? name;
    double? latitude;
    double? longitude;
    int? placeId;
    String? media;
    int? rate;
    int? users;
    bool? isFav;

    Lodge({
        this.id,
        this.name,
        this.latitude,
        this.longitude,
        this.placeId,
        this.media,
        this.rate,
        this.users,
        this.isFav,
    });

    factory Lodge.fromJson(Map<String, dynamic> json) => Lodge(
        id: json["id"],
        name: json["name"],
        latitude: json["latitude"]?.toDouble(),
        longitude: json["longitude"]?.toDouble(),
        placeId: json["place_id"],
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
        "place_id": placeId,
        "media": media,
        "rate": rate,
        "users": users,
        "is_fav": isFav,
    };
}

class PlaceModel {
    int? moduleId;
    int? moduleType;
    int? id;
    String? name;
    String? image;

    PlaceModel({
        this.moduleId,
        this.moduleType,
        this.id,
        this.name,
        this.image,
    });

    factory PlaceModel.fromJson(Map<String, dynamic> json) => PlaceModel(
        moduleId: json["module_id"],
        moduleType: json["module_type"],
        id: json["id"],
        name: json["name"],
        image: json["image"],
    );

    Map<String, dynamic> toJson() => {
        "module_id": moduleId,
        "module_type": moduleType,
        "id": id,
        "name": name,
        "image": image,
    };
}
