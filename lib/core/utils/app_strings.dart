import 'package:travel_club/core/preferences/preferences.dart';

export 'package:flutter_screenutil/flutter_screenutil.dart';



class AppStrings {
  static const String appName = 'Traverl Club';
  static const String fontFamily = 'Arab';
  // static const String fontFamily = 'NotoSansArabic';
  static const String noRouteFound = 'No Route Found';
  static const String contentType = 'Content-Type';
  static const String applicationJson = 'application/json';
  static const String testImageUrl =
      'https://www.infogrepper.com/wp-content/uploads/2022/10/image-url-for-testing.png';
  static const String locale = 'locale';
  static const String englishCode = 'en';
  static const String arabicCode = 'ar';
  static const String inviteLink = 'https://travelclub.page.link/invite';
  static const String lodgeShareLink = 'https://travel.topbusiness.ebharbook.com/deeplink/lodge?id=';
  static const String transportationShareLink = 'https://travel.topbusiness.ebharbook.com/deeplink/transportation?id=';

  // static const String googleApiKey = '';
}

class AppConst {
  // static bool isLogged = prefs.getBool("ISLOGGED") ?? false;
    static bool get isLogged  =>  prefs.getBool("ISLOGGED") ?? false;
}
