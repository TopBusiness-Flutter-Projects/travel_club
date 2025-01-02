import 'dart:convert';


import 'package:shared_preferences/shared_preferences.dart';
import 'package:travel_club/core/utils/app_strings.dart';
import 'package:travel_club/features/auth/data/login_model.dart';


class Preferences {
  static final Preferences instance = Preferences._internal();

  Preferences._internal();

  factory Preferences() => instance;


  // Future<void> setFirstInstall() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   prefs.setString('onBoarding', 'Done');
  // }

  // Future<String?> getFirstInstall() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   String? jsonData = prefs.getString('onBoarding');
  //   return jsonData;
  // }

  Future<void> setUser(LoginModel loginModel) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString(
        'user', jsonEncode(LoginModel.fromJson(loginModel.toJson())));
    print(await getUserModel());
  }
 Future<void> clearShared()async{
   SharedPreferences preferences = await SharedPreferences.getInstance();
   preferences.clear();
 }
  Future<LoginModel> getUserModel() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String? jsonData = preferences.getString('user');
    LoginModel userModel;
    if (jsonData != null) {
      userModel = LoginModel.fromJson(jsonDecode(jsonData));
    } else {
      userModel = LoginModel();
    }
    return userModel;
  }

  Future<String> getSavedLang() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString(AppStrings.locale) ?? 'ar';
  }

  Future<void> savedLang(String local) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString(AppStrings.locale, local);
  }
   // Notification token
  Future<String?> getNotificationToken() async{
      SharedPreferences preferences = await SharedPreferences.getInstance();
      return  preferences.getString('notificationToken');
  }

  Future<dynamic> setNotificationToken({required String value}) async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return   preferences.setString('notificationToken', value);
  }
}
