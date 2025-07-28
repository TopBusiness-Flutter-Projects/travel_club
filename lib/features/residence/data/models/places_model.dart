// To parse this JSON data, do
//
//     final placesModel = placesModelFromJson(jsonString);

import 'dart:convert';

import 'lodges_model.dart';

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
    List<LodgeModel>? lodges;

    Data({
        this.places,
        this.lodges,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        places: json["places"] == null ? [] : List<PlaceModel>.from(json["places"]!.map((x) => PlaceModel.fromJson(x))),
        lodges: json["lodges"] == null ? [] : List<LodgeModel>.from(json["lodges"]!.map((x) => LodgeModel.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "places": places == null ? [] : List<dynamic>.from(places!.map((x) => x.toJson())),
        "lodges": lodges == null ? [] : List<dynamic>.from(lodges!.map((x) => x.toJson())),
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
        moduleId:json["module_id"],
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
