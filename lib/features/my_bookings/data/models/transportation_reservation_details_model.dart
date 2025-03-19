// To parse this JSON data, do
//
//     final geTransportationReservationDetailsModel = geTransportationReservationDetailsModelFromJson(jsonString);

import 'dart:convert';

GeTransportationReservationDetailsModel
    geTransportationReservationDetailsModelFromJson(String str) =>
        GeTransportationReservationDetailsModel.fromJson(json.decode(str));

String geTransportationReservationDetailsModelToJson(
        GeTransportationReservationDetailsModel data) =>
    json.encode(data.toJson());

class GeTransportationReservationDetailsModel {
  String? msg;
  Data? data;
  int? status;

  GeTransportationReservationDetailsModel({
    this.msg,
    this.data,
    this.status,
  });

  factory GeTransportationReservationDetailsModel.fromJson(
          Map<String, dynamic> json) =>
      GeTransportationReservationDetailsModel(
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
  String? fromDepartureCompanyStation;
  String? toReturnCompanyStation;
  String? fromReturnCompanyStation;
  String? toDepartureCompanyStation;
  String? departureDate;
  String? returnDate;
  String? bus;
  int? chairs;
  int? companyId;
  dynamic plateNumber;
  String? fromDepartureTime;
  String? fromReturnTime;
  dynamic fromDepartureTimePrice;
  dynamic fromReturnTimePrice;
  dynamic totalPrice;
  dynamic vat;
  dynamic rule;
  dynamic totalPriceAfterVat;
  dynamic canCancel;
    bool? isRated;

  int? returnGuests;
  int? departureGuests;
  List<ReservedChairsNumber>? departureReservedChairsNumber;
  List<ReservedChairsNumber>? returnReservedChairsNumber;

  Data({
    this.fromDepartureCompanyStation,
    this.toReturnCompanyStation,
    this.fromReturnCompanyStation,
    this.toDepartureCompanyStation,
    this.departureDate,
    this.returnDate,
    this.bus,
    this.chairs,
    this.companyId,
    this.plateNumber,
    this.fromDepartureTime,
    this.fromReturnTime,
    this.fromDepartureTimePrice,
    this.fromReturnTimePrice,
    this.totalPrice,    this.isRated,

    this.vat, this.rule,
    this.totalPriceAfterVat,
    this.returnGuests,
    this.departureGuests,
    this.canCancel,
    this.departureReservedChairsNumber,
    this.returnReservedChairsNumber,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        fromDepartureCompanyStation: json["from_departure_company_station"],
        toReturnCompanyStation: json["to_return_company_station"],
        fromReturnCompanyStation: json["from_return_company_station"],
        toDepartureCompanyStation: json["to_departure_company_station"],
        departureDate: json["departure_date"],
        returnDate: json["return_date"],
        bus: json["bus"],
        chairs: json["chairs"],
    companyId: json["company_id"],    isRated: json["is_rated"],

    rule: json["rule"],
        plateNumber: json["plate_number"],
        fromDepartureTime: json["from_departure_time"],
        fromReturnTime: json["from_return_time"],
        fromDepartureTimePrice: json["from_departure_time_price"],
        fromReturnTimePrice: json["from_return_time_price"],
        totalPrice: json["total_price"],
        vat: json["vat"],
        totalPriceAfterVat: json["total_price_after_vat"],
        canCancel: json["canCancel"],
        departureGuests: json["departure_guests"],
        returnGuests: json["return_guests"],
        departureReservedChairsNumber:
            json["departureReservedChairsNumber"] == null
                ? []
                : List<ReservedChairsNumber>.from(
                    json["departureReservedChairsNumber"]!
                        .map((x) => ReservedChairsNumber.fromJson(x))),
        returnReservedChairsNumber: json["returnReservedChairsNumber"] == null
            ? []
            : List<ReservedChairsNumber>.from(
                json["returnReservedChairsNumber"]!
                    .map((x) => ReservedChairsNumber.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "from_departure_company_station": fromDepartureCompanyStation,
        "to_return_company_station": toReturnCompanyStation,
        "from_return_company_station": fromReturnCompanyStation,
        "to_departure_company_station": toDepartureCompanyStation,
        "departure_date": departureDate,
        "return_date": returnDate,
        "bus": bus,    "is_rated": isRated,

        "chairs": chairs,
    "company_id":companyId,
    "rule": rule,
        "plate_number": plateNumber,
        "from_departure_time": fromDepartureTime,
        "from_return_time": fromReturnTime,
        "from_departure_time_price": fromDepartureTimePrice,
        "from_return_time_price": fromReturnTimePrice,
        "total_price": totalPrice,

        "vat": vat,
        "total_price_after_vat": totalPriceAfterVat,
        "canCancel": canCancel,
        "return_guests": returnGuests,
        "departure_guests": departureGuests,
        "departureReservedChairsNumber": departureReservedChairsNumber == null
            ? []
            : List<dynamic>.from(
                departureReservedChairsNumber!.map((x) => x.toJson())),
        "returnReservedChairsNumber": returnReservedChairsNumber == null
            ? []
            : List<dynamic>.from(
                returnReservedChairsNumber!.map((x) => x.toJson())),
      };
}

class ReservedChairsNumber {
  int? id;
  int? number;
  int? status;

  ReservedChairsNumber({
    this.id,
    this.number,
    this.status,
  });

  factory ReservedChairsNumber.fromJson(Map<String, dynamic> json) =>
      ReservedChairsNumber(
        id: json["id"],
        number: json["number"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "number": number,
        "status": status,
      };
}
