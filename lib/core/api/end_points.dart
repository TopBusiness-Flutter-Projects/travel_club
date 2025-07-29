import 'package:flutter/foundation.dart';

class EndPoints {
 static const String baseUrl =
    !kReleaseMode ?
     'https://trvlgate.com/api/v1/'
    :'http://192.168.1.18:8001/api/v1/'
    ; // production
  //////////////////////////////////////////////////////
  //////////////////    Auth   /////////////////////////
  //////////////////////////////////////////////////////
  static const String loginUrl = '${baseUrl}login';
  static const String loginGoogleUrl = '${baseUrl}login/google';
  static const String loginAppleUrl = '${baseUrl}login/apple';
  static const String registerUrl = '${baseUrl}register';
  static const String checkOtpUrl = '${baseUrl}checkOtp';
  static const String logoutUrl = '${baseUrl}logout';
  static const String deleteAccountUrl = '${baseUrl}delete-account';
  static const String settingUrl = '${baseUrl}get-setting';
  static const String forgetPasswordUrl = '${baseUrl}forgetPassword';
  static const String resetPasswordUrl = '${baseUrl}resetPassword';
  static const String checkLoyaltyPointsUrl = '${baseUrl}checkLoyaltyPoints';
  static const String validateOtpUrl = '${baseUrl}validateOtp';
  static const String userDataUrl = '${baseUrl}userDate';
  static const String getMyPointHistoryUrl = '${baseUrl}getMyPointHistory';
  static const String updateUserDataUrl = '${baseUrl}updateProfile';
  static const String updatePasswordUrl = '${baseUrl}updatePassword';
  static const String addOrRemoveFavUrl = '${baseUrl}addOrDeleteToFav';
  ////////////////////////////////////////////////////////////
  //////////////////      Home       /////////////////////////
  ////////////////////////////////////////////////////////////
  static const String homeUrl = '${baseUrl}home';
  ////////////////////////////////////////////////////////////
  //////////////////    Residence    /////////////////////////
  ////////////////////////////////////////////////////////////
  static const String placesUrl = '${baseUrl}getPlaces';
  static const String getFacilitiesUrl = '${baseUrl}getFacilities';
  static const String getLodgesUrl = '${baseUrl}getLodges';
  static const String getLodgesDetailsUrl = '${baseUrl}getLodgeDetail';
  static const String getLodgesRoomsUrl = '${baseUrl}getLodgesRooms';
  static const String getCheckRoomsIdUrl =
      '${baseUrl}checkDuplicateRecommendedRooms';
  static const String addRoomReservationurl = '${baseUrl}addRoomReservation';
  ////////////////////////////////////////////////////////////
  ////////////////// Transportations /////////////////////////
  ////////////////////////////////////////////////////////////
  static const String getCompaniesUrl = '${baseUrl}getCompanies';
  static const String getCompanyStationUrl = '${baseUrl}getCompanyStation';
  static const String getAvailableBusesUrl = '${baseUrl}getAvailableBuses';
  static const String addBusReservationUrl = '${baseUrl}addBusReservation';

  ////////////////////////////////////////////////////////////
  //////////////////    Reservation    ////////////////////////
  ////////////////////////////////////////////////////////////
  static const String checkCouponUrl = '${baseUrl}checkCoupon';
  static const String continueToPayUrl = '${baseUrl}continueToPay';
  static const String checkPaymentUrl = '${baseUrl}checkPayment';
  static const String getMyReservationUrl = '${baseUrl}getMyReservation';
  static const String getMyReservationDetailsUrl =
      '${baseUrl}getMyReservationDetails';
  static const String cancelReservationurl = '${baseUrl}cancelReservation';
  static const String addRate = '${baseUrl}AddRate';
  static const String getCategoryUrl = '${baseUrl}getCategoryRestaurants';
  static const String getMenuCategoryRestaurantsUrl =
      '${baseUrl}getMenuCategoryRestaurants';
  static const String getRestaurantMenuUrl = '${baseUrl}getRestaurantMenu';
  static const String getRestaurantUrl = '${baseUrl}getRestaurants';
  static const String getRestaurantDetails = '${baseUrl}getRestaurantDetails/';
  static const String checkCouponTransportationUrl =
      '${baseUrl}checkTransportationCoupon';
  static const String checkCouponRestaurantUrl =
      '${baseUrl}checkRestaurantCoupon';
  static const String checkEntertainmentCouponUrl =
      '${baseUrl}checkEntertainmentCoupon';
  static const String continueToPayTransportationUrl =
      '${baseUrl}continueToPayTransportation';
  static const String continueToPayRestaurantUrl =
      '${baseUrl}continueToPayRestaurant';
  static const String continueToPayEntertainmentUrl =
      '${baseUrl}continueToPayEntertainment';
  static const String checkPaymentTransportationUrl =
      '${baseUrl}checkPaymentTransportation';
  static const String checkPaymentRestaurantUrl =
      '${baseUrl}checkPaymentRestaurant';
  static const String checkPaymentEntertainmentUrl =
      '${baseUrl}checkPaymentEntertainment';
  static const String getMyFavouritesUrl = '${baseUrl}getMyFavs';
  static const String homeFilterUrl = '${baseUrl}homeFilter';
////////////////////////////////////////////////////////////
//////////////////    restaurant    ////////////////////////
////////////////////////////////////////////////////////////
  static const String addRestaurantReservation =
      '${baseUrl}addRestaurantReservation';
////////////////////////////////////////////////////////////
//////////////////    entertainment    ////////////////////////
////////////////////////////////////////////////////////////
  static const String getWays = '${baseUrl}getWays';
  static const String getOrganizations = '${baseUrl}getOrganizations';
  static const String getOrganizationsDetails =
      '${baseUrl}getOrganizationDetails';
  static const String addEntertainmentReservation =
      '${baseUrl}addEntertainmentReservation';
////////////////////////////////////////////////////////////
//////////////////    others    ////////////////////////////
////////////////////////////////////////////////////////////
  static const String otherServicesUrl = '${baseUrl}getServices';
  static const String getSubServices = '${baseUrl}getSubServices';
  static const String getSingleSubServices = '${baseUrl}getSubServicesDetails';
  static const String contactUs = '${baseUrl}contact-us';
  static const String setting = '${baseUrl}get-settings';
  static const String notificationUrl = '${baseUrl}get-notifications';
  static const String seenNotificationUrl = '${baseUrl}seen-notification';
  static const String continueToPayUsingPointsUrl = '${baseUrl}continueToPayUsingPoints';
  static const String getPaymentMethodsUrl = '${baseUrl}get-payment-methods';
  static const String addWhitelistPoints = '${baseUrl}add-whitelist-points';

//static const String getMyFavouritesUrl = '${baseUrl}getMyFavs';
  // static const String getMyReservationUrl = '${baseUrl}getMyReservation';
//   static const String getMyReservationDetailsUrl =
//       '${baseUrl}getMyReservationDetails';
// static const String cancelReservationurl = '${baseUrl}cancelReservation';
}
