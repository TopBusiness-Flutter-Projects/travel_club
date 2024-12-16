import 'package:flutter/material.dart';
import 'package:travel_club/features/accommodation/view/screens/details_accomendation.dart';
import 'package:travel_club/features/auth/view/screens/new_pass_screen.dart';
import 'package:travel_club/features/main_screen/screens/main_screen.dart';
import 'package:travel_club/features/on_boarding/screen/onboarding_screen.dart';
import 'package:travel_club/features/other_services/screens/other_services_screen.dart';
import 'package:travel_club/features/splash/screens/splash_screen.dart';
import 'package:travel_club/features/transportation/screens/booking_details_screen.dart';
import 'package:travel_club/features/transportation/screens/transportation_map_screen.dart';
import 'package:travel_club/features/transportation/screens/transportation_menu_screen.dart';
import '../../core/utils/app_strings.dart';
import 'package:page_transition/page_transition.dart';
import '../../features/accommodation/view/screens/accomendation_screen.dart';
import '../../features/accommodation/view/screens/hotels_screen.dart';
import '../../features/auth/view/screens/apply_screen.dart';
import '../../features/auth/view/screens/forget_pass_screen.dart';
import '../../features/auth/view/screens/login_screen.dart';
import '../../features/auth/view/screens/otp_screen.dart';
import '../../features/auth/view/screens/sign_up_screen.dart';
import '../../features/booking/screens/booking_screen.dart';

class Routes {
  static const String initialRoute = '/';
  static const String loginRoute = '/login';
  static const String mainRoute = '/main';
  static const String newPass = '/newPass';
  static const String signUp = '/signUp';
  static const String forgetPass = '/forgetPass';
  static const String otpScreen = '/otpScreen';
  static const String apply = '/apply';
  static const String hotelsScreen = '/hotelsScreen';
  static const String bookingAccomodation = '/bookingAccomodation';
  static const String accomendation = '/accomendation';
  static const String detailsAccomendation = '/detailsAccomendation';
  static const String onboardingPageScreenRoute = '/onboardingPageScreenRoute';
  static const String otherServicesRoute = '/otherServicesRoute';
  static const String transportationRoute = '/transportationRoute';
  static const String transportationMenuRoute = '/transportationMenuRoute';
  static const String transportationBookingDetailsRoute = '/transportationBookingDetailsRoute';
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
        );
      case Routes.detailsAccomendation:
        return PageTransition(
          child: const DetailsAccommendation(),
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
        );    case Routes.hotelsScreen:
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
     
      case Routes.transportationBookingDetailsRoute:
        return PageTransition(
          child: const TransportationBookingDetailsScreen(),
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