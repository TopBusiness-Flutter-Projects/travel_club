import 'package:flutter/material.dart';
import 'package:travel_club/features/auth/view/screens/new_pass_screen.dart';
import 'package:travel_club/features/home/screens/best_bags_screen.dart';
import 'package:travel_club/features/home/screens/new_offers_screen.dart';
import 'package:travel_club/features/main_screen/screens/main_screen.dart';
import 'package:travel_club/features/my_account/screens/about_us.dart';
import 'package:travel_club/features/my_account/screens/contact_us.dart';
import 'package:travel_club/features/on_boarding/screen/onboarding_screen.dart';
import 'package:travel_club/features/other_services/screens/other_services_screen.dart';
import 'package:travel_club/features/other_services/screens/single_service_details.dart';
import 'package:travel_club/features/search/screens/search_screen.dart';
import 'package:travel_club/features/splash/screens/splash_screen.dart';
import 'package:travel_club/features/transportation/screens/booking_details_screen.dart';
import 'package:travel_club/features/transportation/screens/search_result_screen%20.dart';
import 'package:travel_club/features/transportation/screens/transportation_map_screen.dart';
import 'package:travel_club/features/transportation/screens/transportation_menu_screen.dart';
import 'package:travel_club/features/transportation/screens/trip_details_first_screen%20copy.dart';
import 'package:travel_club/features/transportation/screens/trip_details_second_screen.dart';
import '../../core/utils/app_strings.dart';
import 'package:page_transition/page_transition.dart';
import '../../features/accommodation/view/booking_accommodation/screens/best_choosen.dart';
import '../../features/accommodation/view/booking_accommodation/screens/booking_accommodation_screen.dart';
import '../../features/accommodation/view/booking_accommodation/screens/done_payment.dart';
import '../../features/accommodation/view/booking_accommodation/screens/payment_process_screen.dart';
import '../../features/accommodation/view/booking_accommodation/screens/second_booking_accommodation_screen.dart';
import '../../features/accommodation/view/screens/accomendation_screen.dart';
import '../../features/accommodation/view/screens/details_accomendation old.dart';
import '../../features/accommodation/view/screens/hotels_screen.dart';
import '../../features/auth/view/screens/apply_screen.dart';
import '../../features/auth/view/screens/forget_pass_screen.dart';
import '../../features/auth/view/screens/login_screen.dart';
import '../../features/auth/view/screens/otp_screen.dart';
import '../../features/auth/view/screens/sign_up_screen.dart';
import '../../features/entertainment/screens/details_of_entertainment/screens/book_table.dart';
import '../../features/entertainment/screens/details_of_entertainment/screens/details_entertainment.dart';
import '../../features/entertainment/screens/entertainment_companies.dart';
import '../../features/entertainment/screens/entertainment_screen.dart';
import '../../features/food/screens/details_of_food/screens/book_table_screen.dart';
import '../../features/food/screens/details_of_food/screens/details_food_screen.dart';
import '../../features/food/screens/food_screen.dart';
import '../../features/my_account/screens/change_lang.dart';
import '../../features/my_bookings/view/entertainment_booking/screens/details_booking_food_screen.dart';
import '../../features/my_bookings/view/transportation_booking/screens/details_transportaion.dart';
import '../../features/notification/screens/notification_screen.dart';
import '../../features/my_account/screens/privacy_screen.dart';
import '../../features/my_account/screens/profile_info.dart';
import '../../features/my_bookings/view/accommodation_booking/screens/details_booking_screen.dart';
import '../../features/my_bookings/view/food_booking/screens/details_booking_food_screen.dart';
import '../../features/other_services/screens/sub_services.dart';
import '../../features/search/screens/search_body.dart';

class Routes {
  static const String initialRoute = '/';
  static const String loginRoute = '/login';
  static const String mainRoute = '/main';
  static const String newPass = '/newPass';
  static const String signUp = '/signUp';
  static const String forgetPass = '/forgetPass';
  static const String otpScreen = '/otpScreen';
  static const String apply = '/apply';
  static const String donePayment = '/donePayment';
  static const String payment = '/payment';
  static const String contact = '/contact';
  static const String bestChoosenScreen = '/bestChoosenScreen';
  static const String aboutUs = '/aboutUs';
  static const String changeLanguage = '/changeLanguage';
  static const String profileInfo = '/profileInfo';
  static const String privacyRoute = '/privacyRoute';
  static const String hotelsScreen = '/hotelsScreen';
  static const String notificationScreen = '/notification';
  static const String detailsBooking = '/detailsBooking';
  static const String compainiesEntertainment = '/compainiesEntertainment';
  static const String entertainmentScreen = '/entertainmentScreen';
  static const String bookingAccomodation = '/bookingAccomodation';
  static const String accomendation = '/accomendation';
  static const String foodScreen = '/foodScreen';
  static const String detailsBookingFood = '/detailsBookingFood';
  static const String detailsEntertainment = '/detailsEntertainment';
  static const String detailsAccomendation = '/detailsAccomendation';
  static const String onboardingPageScreenRoute = '/onboardingPageScreenRoute';
  static const String otherServicesRoute = '/otherServicesRoute';
  static const String transportationRoute = '/transportationRoute';
  static const String subServicesRoute = '/subServicesRoute';
  static const String detailsOtherServices = '/detailsOtherServices';
  static const String secondBookingAccommodation =
      '/secondBookingAccommodation';
  static const String detailsFoodRoute = '/detailsFoodRoute';
  static const String bookTable = '/bookTable';
  static const String bookTableEntermaint = '/bookTableEntermaint';
  static const String transportationMenuRoute = '/transportationMenuRoute';
  static const String transportationBookingDetailsRoute =
      '/transportationBookingDetailsRoute';
  static const String transportationSearchResultRoute =
      '/transportationSearchResultRoute';
  static const String tripDetailsfirstRoute = '/tripDetailsfirstRoute';
  static const String tripDetailsSecondRoute = '/tripDetailsSecondRoute';
  static const String offers = '/offers';
  static const String bags = '/bags';
  static const String searchScreen = '/searchScreen';
  static const String detailsBookingEntertainment = '/detailsBookingEntertainment';
  static const String detailsbookingTransportation =
      '/detailsbookingTransportation';
}

class AppRoutes {
  static String route = '';
  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.initialRoute:
        return MaterialPageRoute(
          builder: (context) => const SplashScreen(),
        );
      case Routes.onboardingPageScreenRoute:
        return PageTransition(
          child: const OnBoardinScreen(),
          type: PageTransitionType.fade,
          alignment: Alignment.center,
          duration: const Duration(milliseconds: 200),
        );   case Routes.searchScreen:
        return PageTransition(
          child: const SearchScreen(),
          type: PageTransitionType.fade,
          alignment: Alignment.center,
          duration: const Duration(milliseconds: 200),
        );
      case Routes.detailsBookingEntertainment:
        return PageTransition(
          child: const DetailsBookingEntertainment(),
          type: PageTransitionType.fade,
          alignment: Alignment.center,
          duration: const Duration(milliseconds: 200),
        );
      case Routes.bookTableEntermaint:
        return PageTransition(
          child: const BookTableEntermaint(),
          type: PageTransitionType.fade,
          alignment: Alignment.center,
          duration: const Duration(milliseconds: 200),
        );
      case Routes.bestChoosenScreen:
        return PageTransition(
          child: const BestChoosenScreen(),
          type: PageTransitionType.fade,
          alignment: Alignment.center,
          duration: const Duration(milliseconds: 200),
        );
      case Routes.detailsbookingTransportation:
        return PageTransition(
          child: const DetailsBookingTransportaion(),
          type: PageTransitionType.fade,
          alignment: Alignment.center,
          duration: const Duration(milliseconds: 200),
        );
      case Routes.detailsFoodRoute:
        return PageTransition(
          child: const DetailsFood(),
          type: PageTransitionType.fade,
          alignment: Alignment.center,
          duration: const Duration(milliseconds: 200),
        );
      case Routes.subServicesRoute:
        return PageTransition(
          child: const SubServicesScreen(),
          type: PageTransitionType.fade,
          alignment: Alignment.center,
          duration: const Duration(milliseconds: 200),
        );
      case Routes.detailsOtherServices:
        return PageTransition(
          child: const ServiceDetailsScreen(),
          type: PageTransitionType.fade,
          alignment: Alignment.center,
          duration: const Duration(milliseconds: 200),
        );
      case Routes.bookTable:
        return PageTransition(
          child: const BookTableScreen(),
          type: PageTransitionType.fade,
          alignment: Alignment.center,
          duration: const Duration(milliseconds: 200),
        );
      case Routes.foodScreen:
        return PageTransition(
          child: const FoodScreen(),
          type: PageTransitionType.fade,
          alignment: Alignment.center,
          duration: const Duration(milliseconds: 200),
        );
      case Routes.detailsEntertainment:
        return PageTransition(
          child: const DetailsEntertainment(),
          type: PageTransitionType.fade,
          alignment: Alignment.center,
          duration: const Duration(milliseconds: 200),
        );
      case Routes.compainiesEntertainment:
        return PageTransition(
          child: const EntertainmentCompanies(),
          type: PageTransitionType.fade,
          alignment: Alignment.center,
          duration: const Duration(milliseconds: 200),
        );
      case Routes.entertainmentScreen:
        return PageTransition(
          child: const EntertainmentScreen(),
          type: PageTransitionType.fade,
          alignment: Alignment.center,
          duration: const Duration(milliseconds: 200),
        );
      case Routes.notificationScreen:
        return PageTransition(
          child: const NotificationScreen(),
          type: PageTransitionType.fade,
          alignment: Alignment.center,
          duration: const Duration(milliseconds: 200),
        );
      case Routes.privacyRoute:
        return PageTransition(
          child: const PrivacyScreen(),
          type: PageTransitionType.fade,
          alignment: Alignment.center,
          duration: const Duration(milliseconds: 200),
        );
      case Routes.detailsAccomendation:
        return PageTransition(
          child: const DetailsAccommendation(),
          type: PageTransitionType.fade,
          alignment: Alignment.center,
          duration: const Duration(milliseconds: 200),
        );
      case Routes.aboutUs:
        return PageTransition(
          child: const AboutUs(),
          type: PageTransitionType.fade,
          alignment: Alignment.center,
          duration: const Duration(milliseconds: 200),
        );
      case Routes.contact:
        return PageTransition(
          child: const ContactUs(),
          type: PageTransitionType.fade,
          alignment: Alignment.center,
          duration: const Duration(milliseconds: 200),
        );
      case Routes.profileInfo:
        return PageTransition(
          child: const ProfileInfo(),
          type: PageTransitionType.fade,
          alignment: Alignment.center,
          duration: const Duration(milliseconds: 200),
        );
      case Routes.changeLanguage:
        return PageTransition(
          child: const ChangeLang(),
          type: PageTransitionType.fade,
          alignment: Alignment.center,
          duration: const Duration(milliseconds: 200),
        );
      case Routes.detailsBooking:
        return PageTransition(
          child: const DetailsBooking(),
          type: PageTransitionType.fade,
          alignment: Alignment.center,
          duration: const Duration(milliseconds: 200),
        );
      case Routes.donePayment:
        bool isFood = settings.arguments as bool;
        return PageTransition(
          child: DonePaymentScreen(
            isFood: isFood,
          ),
          type: PageTransitionType.fade,
          alignment: Alignment.center,
          duration: const Duration(milliseconds: 200),
        );
      case Routes.detailsBookingFood:
        return PageTransition(
          child: const DetailsBookingFood(),
          type: PageTransitionType.fade,
          alignment: Alignment.center,
          duration: const Duration(milliseconds: 200),
        );

      case Routes.apply:
        return PageTransition(
          child: const ApplyScreen(),
          type: PageTransitionType.fade,
          alignment: Alignment.center,
          duration: const Duration(milliseconds: 200),
        );
      case Routes.hotelsScreen:
        return PageTransition(
          child: const HotelsScreen(),
          type: PageTransitionType.fade,
          alignment: Alignment.center,
          duration: const Duration(milliseconds: 200),
        );

      case Routes.accomendation:
        return PageTransition(
          child: const AccomendationScreen(),
          type: PageTransitionType.fade,
          alignment: Alignment.center,
          duration: const Duration(milliseconds: 200),
        );
      case Routes.bookingAccomodation:
        return PageTransition(
          child: const AccommodationBooking(),
          type: PageTransitionType.fade,
          alignment: Alignment.center,
          duration: const Duration(milliseconds: 200),
        );
      case Routes.forgetPass:
        return PageTransition(
          child: const ForgetPasswordScreen(),
          type: PageTransitionType.fade,
          alignment: Alignment.center,
          duration: const Duration(milliseconds: 200),
        );

      case Routes.otpScreen:
        final bool isPass =
            settings.arguments as bool; // Expect an int index here
        return PageTransition(
          child: OtpScreen(
            isPasss: isPass,
          ),
          type: PageTransitionType.fade,
          alignment: Alignment.center,
          duration: const Duration(milliseconds: 200),
        );
      case Routes.signUp:
        return PageTransition(
          child: const SignUpScreen(),
          type: PageTransitionType.fade,
          alignment: Alignment.center,
          duration: const Duration(milliseconds: 200),
        );
      case Routes.newPass:
        return PageTransition(
          child: const NewPasswordScreen(),
          type: PageTransitionType.fade,
          alignment: Alignment.center,
          duration: const Duration(milliseconds: 200),
        );
      case Routes.loginRoute:
        return PageTransition(
          child: const LoginScreen(),
          type: PageTransitionType.fade,
          alignment: Alignment.center,
          duration: const Duration(milliseconds: 200),
        );

      case Routes.mainRoute:
        // final int index =
        // settings.arguments as int; // Expect an int
        return PageTransition(
          child: MainScreen(),
          type: PageTransitionType.fade,
          alignment: Alignment.center,
          duration: const Duration(milliseconds: 200),
        );
      case Routes.otherServicesRoute:
        return PageTransition(
          child: const OtherServicesScreen(),
          type: PageTransitionType.fade,
          alignment: Alignment.center,
          duration: const Duration(milliseconds: 200),
        );
      case Routes.transportationRoute:
        return PageTransition(
          child: const TransportationMapScreen(),
          type: PageTransitionType.fade,
          alignment: Alignment.center,
          duration: const Duration(milliseconds: 200),
        );

      case Routes.transportationMenuRoute:
        return PageTransition(
          child: const TransportationMenuScreen(),
          type: PageTransitionType.fade,
          alignment: Alignment.center,
          duration: const Duration(milliseconds: 200),
        );

      case Routes.secondBookingAccommodation:
        return PageTransition(
          child: const SecondAccommodationBooking(),
          type: PageTransitionType.fade,
          alignment: Alignment.center,
          duration: const Duration(milliseconds: 200),
        );

      case Routes.transportationBookingDetailsRoute:
        return PageTransition(
          child: const TransportationBookingDetailsScreen(),
          type: PageTransitionType.fade,
          alignment: Alignment.center,
          duration: const Duration(milliseconds: 200),
        );
      case Routes.payment:
        return PageTransition(
          child: PaymentProcessScreen(),
          type: PageTransitionType.fade,
          alignment: Alignment.center,
          duration: const Duration(milliseconds: 200),
        );

      case Routes.transportationSearchResultRoute:
        return PageTransition(
          child: const TransportationSearchResultScreen(),
          type: PageTransitionType.fade,
          alignment: Alignment.center,
          duration: const Duration(milliseconds: 200),
        );
      case Routes.tripDetailsfirstRoute:
        return PageTransition(
          child: const TripDetailsFirstScreen(),
          type: PageTransitionType.fade,
          alignment: Alignment.center,
          duration: const Duration(milliseconds: 200),
        );
      case Routes.tripDetailsSecondRoute:
        return PageTransition(
          child: const TripDetailsSecondScreen(),
          type: PageTransitionType.fade,
          alignment: Alignment.center,
          duration: const Duration(milliseconds: 200),
        );
      case Routes.offers:
        return PageTransition(
          child: const NewOffersScreen(),
          type: PageTransitionType.fade,
          alignment: Alignment.center,
          duration: const Duration(milliseconds: 200),
        );
      case Routes.bags:
        return PageTransition(
          child: const BestBagsScreen(),
          type: PageTransitionType.fade,
          alignment: Alignment.center,
          duration: const Duration(milliseconds: 200),
        );

      // case Routes.resultOfLessonExam:
      //   ResponseOfApplyLessonExmamData model =
      //       settings.arguments as ResponseOfApplyLessonExmamData;
      //   return PageTransition(
      //     child: ResultExamLessonScreen(model: model),
      //     type: PageTransitionType.fade,
      //     alignment: Alignment.center,
      //     duration: const Duration(milliseconds: 800),
      //   );

      default:
        return undefinedRoute();
    }
  }

  static Route<dynamic> undefinedRoute() {
    return MaterialPageRoute(
      builder: (context) => const Scaffold(
        body: Center(
          child: Text(AppStrings.noRouteFound),
        ),
      ),
    );
  }
}
  // case Routes.detailsRoute:
      //   final service = settings.arguments as ServicesModel;
      //   return MaterialPageRoute(
      //     // Extract the service model argument from the settings arguments map
      //
      //     builder: (context) => Details(service: service),
      //   );
      //