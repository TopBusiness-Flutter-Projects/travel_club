import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:travel_club/features/auth/view/screens/new_pass_screen.dart';
import 'package:travel_club/features/entertainment/data/model/get_orginization_details_model.dart';
import 'package:travel_club/features/home/screens/best_bags_screen.dart';
import 'package:travel_club/features/home/screens/new_offers_screen.dart';
import 'package:travel_club/features/main_screen/screens/main_screen.dart';
import 'package:travel_club/features/my_account/screens/about_us.dart';
import 'package:travel_club/features/my_account/screens/contact_us.dart';
import 'package:travel_club/features/my_account/screens/points.dart';
import 'package:travel_club/features/my_account/screens/promo_code.dart';
import 'package:travel_club/features/my_account/screens/update_password.dart';
import 'package:travel_club/features/my_bookings/data/models/transportation_reservation_model.dart';
import 'package:travel_club/features/on_boarding/screen/onboarding_screen.dart';
import 'package:travel_club/features/other_services/screens/other_services_screen.dart';
import 'package:travel_club/features/other_services/screens/single_service_details.dart';
import 'package:travel_club/features/payment/data/models/check_payment_status_model.dart';
import 'package:travel_club/features/residence/view/residence_booking/screens/best_choosen.dart';
import 'package:travel_club/features/residence/view/residence_booking/screens/residence_booking_screen.dart';
import 'package:travel_club/features/payment/screens/done_payment.dart';
import 'package:travel_club/features/residence/view/residence_booking/screens/payment_process_screen.dart';
import 'package:travel_club/features/residence/view/residence_booking/screens/second_residence_booking_screen.dart';
import 'package:travel_club/features/residence/view/screens/lodges_screen.dart';
import 'package:travel_club/features/residence/view/screens/lodge_details.dart';
import 'package:travel_club/features/residence/view/screens/residence_screen.dart';
import 'package:travel_club/features/home/screens/search_screen.dart';
import 'package:travel_club/features/splash/screens/splash_screen.dart';
import 'package:travel_club/features/transportation/data/models/get_available_busis_model.dart';
import 'package:travel_club/features/transportation/data/models/get_companies_model.dart';
import 'package:travel_club/features/transportation/screens/booking_details_screen.dart';
import 'package:travel_club/features/transportation/screens/search_result_screen%20.dart';
import 'package:travel_club/features/transportation/screens/transportation_map_screen.dart';
import 'package:travel_club/features/transportation/screens/transportation_menu_screen.dart';
import 'package:travel_club/features/transportation/screens/trip_details_first_screen.dart';
import 'package:travel_club/features/transportation/screens/trip_details_second_screen.dart';
import '../../core/utils/app_strings.dart';
import 'package:page_transition/page_transition.dart';

import '../../features/auth/view/screens/apply_screen.dart';
import '../../features/auth/view/screens/forget_pass_screen.dart';
import '../../features/auth/view/screens/login_screen.dart';
import '../../features/auth/view/screens/otp_screen.dart';
import '../../features/auth/view/screens/sign_up_screen.dart';
import '../../features/entertainment/data/model/get_orginization_model.dart';
import '../../features/entertainment/screens/details_of_entertainment/screens/book_table.dart';
import '../../features/entertainment/screens/details_of_entertainment/screens/details_entertainment.dart';
import '../../features/entertainment/screens/details_of_entertainment/screens/second_book_table.dart';
import '../../features/entertainment/screens/entertainment_companies.dart';
import '../../features/entertainment/screens/entertainment_screen.dart';
import '../../features/food/screens/details_of_food/screens/book_table_screen.dart';
import '../../features/food/screens/details_of_food/screens/details_food_screen.dart';
import '../../features/food/screens/details_of_food/screens/second_book_table_screen.dart';
import '../../features/food/screens/food_screen.dart';
import '../../features/my_account/screens/change_lang.dart';
import '../../features/my_bookings/data/models/get_entertainment_reservation_model.dart';
import '../../features/my_bookings/view/entertainment_booking/screens/details_booking_entertainment_screen.dart';
import '../../features/my_bookings/view/transportation_booking/screens/details_screen.dart';
import '../../features/notification/screens/notification_screen.dart';
import '../../features/my_account/screens/privacy_screen.dart';
import '../../features/my_account/screens/profile_info.dart';
import '../../features/my_bookings/view/residence_booking/screens/details_screen.dart';
import '../../features/my_bookings/view/food_booking/screens/details_booking_food_screen.dart';
import '../../features/other_services/data/models/sub_services_model.dart';
import '../../features/other_services/screens/sub_services.dart';

class Routes {
  static const String initialRoute = '/';
  static const String loginRoute = '/login';
  static const String mainRoute = '/main';
  static const String newPass = '/newPass';
  static const String signUp = '/signUp';
  static const String forgetPass = '/forgetPass';
  static const String otpScreen = '/otpScreen';
  static const String apply = '/apply';
  static const String doneBooking = '/donePayment';
  static const String payment = '/payment';
  static const String contact = '/contact';
  static const String bestChoosenScreen = '/bestChoosenScreen';
  static const String aboutUs = '/aboutUs';
  static const String changeLanguage = '/changeLanguage';
  static const String profileInfo = '/profileInfo';
  static const String privacyRoute = '/privacyRoute';
  static const String hotelsScreen = '/hotelsScreen';
  static const String notificationScreen = '/notification';
  static const String detailsReservationResidence = '/detailsBooking';
  static const String compainiesEntertainment = '/compainiesEntertainment';
  static const String entertainmentScreen = '/entertainmentScreen';
  static const String bookingResidenceRoute = '/bookingResidenceRoute';
  static const String residenceRoute = '/residenceRoute';
  static const String foodScreen = '/foodScreen';
  static const String detailsBookingFood = '/detailsBookingFood';
  static const String detailsEntertainment = '/detailsEntertainment';
  static const String lodgeDetailsRoute = '/lodgeDetails';
  static const String onboardingPageScreenRoute = '/onboardingPageScreenRoute';
  static const String otherServicesRoute = '/otherServicesRoute';
  static const String transportationRoute = '/transportationRoute';
  static const String subServicesRoute = '/subServicesRoute';
  static const String detailsOtherServices = '/detailsOtherServices';
  static const String secondBookingResidence = '/secondBookingResidence';
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
  static const String detailsBookingEntertainment =
      '/detailsBookingEntertainment';
  static const String detailsbookingTransportation =
      '/detailsbookingTransportation';
  static const String pointsRoute = '/pointsRoute';
  static const String secondBookingFood = '/secondBookingFood';
  static const String promoCodeRoute = '/promocodeRoute';
  static const String updatePassword = '/updatePassword';
  static const String secondBookTableEntertainment =
      '/secondBookTableEntertainment';
 
  static const String lodgeDeepLink = '/lodge';
  static const String foodDeepLink = '/restaurant';
  static const String transportationDeepLink = '/transportation';
  static const String otherServiceDeepLink = '/otherservice';
  static const String entertainmentDeepLink = '/entertainment';
}

class AppRoutes {
  // static String route = '';
  static Route onGenerateRoute(RouteSettings settings) {
  String route = settings.name ?? '';
  String idLink = '0';
 log('the route is: $route');
final uri = Uri.parse(route);
log('the link is: $uri');

// Check for query parameters first
if (uri.queryParameters.containsKey('id')) {
  idLink = uri.queryParameters['id'] ?? '0';
  log('Found ID in query params: $idLink');
}

// Get path for route matching
String path = uri.path;

// If path contains "deeplink", extract the actual route
if (path.contains('/deeplink/')) {
  // Extract the part after "/deeplink/"
  path = path.split('/deeplink/').last;
  path = '/$path'; // Add leading slash
}

log('Route for matching: $path, ID: $idLink');

switch (path) {
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
        );
      case Routes.secondBookingFood:
        return PageTransition(
          child: const SecondBookTableScreen(),
          type: PageTransitionType.fade,
          alignment: Alignment.center,
          duration: const Duration(milliseconds: 200),
        );
      case Routes.secondBookTableEntertainment:
        WayService wayService = settings.arguments as WayService;
        return PageTransition(
          child: SecondBookTableEntermaint(
            wayService: wayService,
          ),
          type: PageTransitionType.fade,
          alignment: Alignment.center,
          duration: const Duration(milliseconds: 200),
        );
      case Routes.searchScreen:
        return PageTransition(
          child: const SearchScreen(),
          type: PageTransitionType.fade,
          alignment: Alignment.center,
          duration: const Duration(milliseconds: 200),
        );
      case Routes.detailsBookingEntertainment:
        ReservationEntertainment reservationEntertainment =
            settings.arguments as ReservationEntertainment;
        return PageTransition(
          child: DetailsBookingEntertainment(
              entertainmentModel: reservationEntertainment),
          type: PageTransitionType.fade,
          alignment: Alignment.center,
          duration: const Duration(milliseconds: 200),
        );
      case Routes.bookTableEntermaint:
        WayService wayService = settings.arguments as WayService;
        return PageTransition(
          child: BookTableEntermaint(
            wayService: wayService,
          ),
          type: PageTransitionType.fade,
          alignment: Alignment.center,
          duration: const Duration(milliseconds: 200),
        );
      case Routes.bestChoosenScreen:
        return PageTransition(
          child: const BestChosenScreen(),
          type: PageTransitionType.fade,
          alignment: Alignment.center,
          duration: const Duration(milliseconds: 200),
        );
      case Routes.detailsbookingTransportation:
        TransportationReservation transportationReservation =
            settings.arguments as TransportationReservation;
        return PageTransition(
          child: DetailsBookingTransportaion(
            transportationReservation: transportationReservation,
          ),
          type: PageTransitionType.fade,
          alignment: Alignment.center,
          duration: const Duration(milliseconds: 200),
        );
      case Routes.detailsFoodRoute:
        DetailsFoodArgs args = settings.arguments as DetailsFoodArgs;
        return PageTransition(
          child: DetailsFood(args: args),
          type: PageTransitionType.fade,
          alignment: Alignment.center,
          duration: const Duration(milliseconds: 200),
        );
      case Routes.subServicesRoute:
        String id = settings.arguments as String;
        return PageTransition(
          child: SubServicesScreen(
            id: id,
          ),
          type: PageTransitionType.fade,
          alignment: Alignment.center,
          duration: const Duration(milliseconds: 200),
        );
      case Routes.detailsOtherServices:
        ServicesDetailsArguments args =
            settings.arguments as ServicesDetailsArguments;
        return PageTransition(
          child: ServiceDetailsScreen(args: args),
          type: PageTransitionType.fade,
          alignment: Alignment.center,
          duration: const Duration(milliseconds: 200),
        );
      case Routes.bookTable:
        String id = settings.arguments as String;
        return PageTransition(
          child: BookTableScreen(id: id),
          type: PageTransitionType.fade,
          alignment: Alignment.center,
          duration: const Duration(milliseconds: 200),
        );
      case Routes.foodScreen:
      return MaterialPageRoute(
    builder: (_) => FoodScreen(), 
  );
        // return PageTransition(
        //   child: const FoodScreen(),
        //   type: PageTransitionType.fade,
        //   alignment: Alignment.center,
        //   duration: const Duration(milliseconds: 200),
        // );
      case Routes.detailsEntertainment:
        EntertainmentDetailsArgs args =
            settings.arguments as EntertainmentDetailsArgs;

        return PageTransition(
          child: DetailsEntertainment(args: args),
          type: PageTransitionType.fade,
          alignment: Alignment.center,
          duration: const Duration(milliseconds: 200),
        );

      case Routes.compainiesEntertainment:
        String id = settings.arguments as String;

        return PageTransition(
          child: EntertainmentCompanies(id: id),
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
      case Routes.lodgeDetailsRoute:
        LodgeDetailsArguments args =
            settings.arguments as LodgeDetailsArguments;
        return PageTransition(
          child: LodgeDetailsScreen(args: args),
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
      case Routes.detailsReservationResidence:
        ResidenceDetailsBookingArguments args =
            settings.arguments as ResidenceDetailsBookingArguments;
        return PageTransition(
          child: ResidenceRessrvationDetails(
            arguments: args,
          ),
          type: PageTransitionType.fade,
          alignment: Alignment.center,
          duration: const Duration(milliseconds: 200),
        );

      case Routes.doneBooking:
        PaymentModel paymentModel = settings.arguments as PaymentModel;
        return PageTransition(
          child: DonePaymentScreen(
            paymentModel: paymentModel,
          ),
          type: PageTransitionType.fade,
          alignment: Alignment.center,
          duration: const Duration(milliseconds: 200),
        );
      case Routes.detailsBookingFood:
        FoodDetailsBookingArguments args =
            settings.arguments as FoodDetailsBookingArguments;
        return PageTransition(
          child: DetailsBookingFood(
            arguments: args,
          ),
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
        LodgesScreenArguments arguments =
            settings.arguments as LodgesScreenArguments;

        return PageTransition(
          child: LodgesScreen(
            arguments: arguments,
          ),
          type: PageTransitionType.fade,
          alignment: Alignment.center,
          duration: const Duration(milliseconds: 200),
        );

      case Routes.residenceRoute:
        return PageTransition(
          child: const ResidenceScreen(),
          type: PageTransitionType.fade,
          alignment: Alignment.center,
          duration: const Duration(milliseconds: 200),
        );
      case Routes.bookingResidenceRoute:
        int lodgeId = settings.arguments as int;
        return PageTransition(
          
          child: ResidenceBooking(lodgeId: lodgeId),
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
            isForget: isPass,
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
          child: const MainScreen(),
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

      case Routes.secondBookingResidence:
        return PageTransition(
          child: const SecondResidenceBooking(),
          type: PageTransitionType.fade,
          alignment: Alignment.center,
          duration: const Duration(milliseconds: 200),
        );

      case Routes.transportationBookingDetailsRoute:
        CompanyModel company = settings.arguments as CompanyModel;
        return PageTransition(
          child: TransportationBookingDetailsScreen(
            companyModel: company,
          ),
          type: PageTransitionType.fade,
          alignment: Alignment.center,
          duration: const Duration(milliseconds: 200),
        );
      case Routes.payment:
        return PageTransition(
          child: const PaymentProcessScreen(),
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
        BusCompanyModel busCompanyModel = settings.arguments as BusCompanyModel;
        return PageTransition(
          child: TripDetailsFirstScreen(
            busCompanyModel: busCompanyModel,
          ),
          type: PageTransitionType.fade,
          alignment: Alignment.center,
          duration: const Duration(milliseconds: 200),
        );
      case Routes.tripDetailsSecondRoute:
        BusCompanyModel busCompanyModel = settings.arguments as BusCompanyModel;

        return PageTransition(
          child: TripDetailsSecondScreen(
            busCompanyModel: busCompanyModel,
          ),
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
      case Routes.pointsRoute:
        return PageTransition(
          child: const PointsScreen(),
          type: PageTransitionType.fade,
          alignment: Alignment.center,
          duration: const Duration(milliseconds: 200),
        );
      case Routes.updatePassword:
        return PageTransition(
          child: const UpdatePassword(),
          type: PageTransitionType.fade,
          alignment: Alignment.center,
          duration: const Duration(milliseconds: 200),
        );
      case Routes.promoCodeRoute:
        String code = settings.arguments as String;
        return PageTransition(
          child: PromoCodeScreen(
            code: code,
          ),
          type: PageTransitionType.fade,
          alignment: Alignment.center,
          duration: const Duration(milliseconds: 200),
        );
  case Routes.lodgeDeepLink:       
        return PageTransition(
          child: LodgeDetailsScreen(args: LodgeDetailsArguments(
            isDeeplink: true,
            lodgeId: int.tryParse(idLink ) ?? 0,
          )),
          type: PageTransitionType.fade,
          alignment: Alignment.center,
          duration: const Duration(milliseconds: 200),
        );      
case Routes.foodDeepLink:       
        return PageTransition(
          child: DetailsFood(args: DetailsFoodArgs(
            isDeeplink: true,
            id: idLink,
            
          )),
          type: PageTransitionType.fade,
          alignment: Alignment.center,
          duration: const Duration(milliseconds: 200),
        );
      case Routes.otherServiceDeepLink:       
        return PageTransition(
          child: ServiceDetailsScreen(args: ServicesDetailsArguments(
            isDeeplink: true,
            id: idLink   ,
          )),
          type: PageTransitionType.fade,
          alignment: Alignment.center,
          duration: const Duration(milliseconds: 200),
        );
      case Routes.entertainmentDeepLink:       
        return PageTransition(
          child: DetailsEntertainment(args: EntertainmentDetailsArgs(
            isDeeplink: true,
            id: idLink ,
          )),
          type: PageTransitionType.fade,
          alignment: Alignment.center,
          duration: const Duration(milliseconds: 200),
        );
      
      default:
return MaterialPageRoute(
         builder: (context) => const SplashScreen(),
       );
// return undefinedRoute( route ?? '');
    }
  }

  static Route<dynamic> undefinedRoute(String routeName) {
    return MaterialPageRoute(
      builder: (context) =>  Scaffold(
        body: Center(
          child: Text('No route defined for $routeName'),
        //  child: Text(AppStrings.noRouteFound),
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