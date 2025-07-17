
class GetSettingModel {
  String? msg;
  Data? data;
  int? status;

  GetSettingModel({
    this.msg,
    this.data,
    this.status,
  });

  factory GetSettingModel.fromJson(Map<String, dynamic> json) => GetSettingModel(
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
  dynamic aboutUs;
  dynamic termsAndConditions;
  dynamic privacy;
  String? pointValue;
  String? androidAppVersion;
  String? iosAppVersion;
  String? developmentMode;
  String? appMentainance;

  Data({
    this.aboutUs,
    this.termsAndConditions,
    this.privacy,
    this.pointValue,
    this.androidAppVersion,
    this.iosAppVersion,
    this.developmentMode,
    this.appMentainance,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    aboutUs: json["about_us"],
    termsAndConditions: json["terms_and_conditions"],
    privacy: json["privacy"],
    pointValue: json["point_value"],
    androidAppVersion: json["android_app_version"],
    iosAppVersion: json["ios_app_version"],
    developmentMode: json["development_mode"],
    appMentainance: json["app_mentainance"],
  );

  Map<String, dynamic> toJson() => {
    "about_us": aboutUs,
    "terms_and_conditions": termsAndConditions,
    "privacy": privacy,
    "point_value": pointValue,
    "android_app_version": androidAppVersion,
    "ios_app_version": iosAppVersion,
    "development_mode": developmentMode,
    "app_mentainance": appMentainance,
  };
}
