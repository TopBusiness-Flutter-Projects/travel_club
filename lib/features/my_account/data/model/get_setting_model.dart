
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
  List<App>? apps;

  Data({
    this.aboutUs,
    this.termsAndConditions,
    this.privacy,
    this.pointValue,
    this.androidAppVersion,
    this.iosAppVersion,
    this.developmentMode,
    this.appMentainance,
    this.apps,
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
    apps: json["apps"] == null ? [] : List<App>.from(json["apps"]!.map((x) => App.fromJson(x))),

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
    "apps": apps == null ? [] : List<dynamic>.from(apps!.map((x) => x.toJson())),

  };
}

class App {
  int? id;
  String? name;
  String? androidUrl;
  String? iosUrl;
  String? icon;

  App({
    this.id,
    this.name,
    this.androidUrl,
    this.iosUrl,
    this.icon,
  });

  factory App.fromJson(Map<String, dynamic> json) => App(
    id: json["id"],
    name: json["name"],
    androidUrl: json["android_url"],
    iosUrl: json["ios_url"],
    icon: json["icon"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "android_url": androidUrl,
    "ios_url": iosUrl,
    "icon": icon,
  };
}