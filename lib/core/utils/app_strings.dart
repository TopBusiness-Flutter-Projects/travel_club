
import 'package:shared_preferences/shared_preferences.dart';

export 'package:flutter_screenutil/flutter_screenutil.dart';
late SharedPreferences prefs;
class AppStrings {  
  static const String appName = 'Traverl Club';
  static const String fontFamily = 'NotoSansArabic';
  static const String noRouteFound = 'No Route Found';
  static const String contentType = 'Content-Type';
  static const String applicationJson = 'application/json';
  static const String testImageUrl = 'https://www.infogrepper.com/wp-content/uploads/2022/10/image-url-for-testing.png';
 static const String locale = 'locale';
   static const String englishCode = 'en';
  static const String arabicCode = 'ar';
  // static const String googleApiKey = '';
 static bool isLogged =prefs.getBool("ISLOGGED")?? false;
}

