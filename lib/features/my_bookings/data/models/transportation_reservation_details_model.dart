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
  String? fromDepartureTime;
  String? fromReturnTime;
  dynamic totalPrice;
  dynamic vat;
  dynamic totalPriceAfterVat;
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
    this.fromDepartureTime,
    this.fromReturnTime,
    this.totalPrice,
    this.vat,
    this.totalPriceAfterVat,
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
        fromDepartureTime: json["from_departure_time"],
        fromReturnTime: json["from_return_time"],
        totalPrice: json["total_price"],
        vat: json["vat"],
        totalPriceAfterVat: json["total_price_after_vat"],
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
        "bus": bus,
        "chairs": chairs,
        "from_departure_time": fromDepartureTime,
        "from_return_time": fromReturnTime,
        "total_price": totalPrice,
        "vat": vat,
        "total_price_after_vat": totalPriceAfterVat,
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
