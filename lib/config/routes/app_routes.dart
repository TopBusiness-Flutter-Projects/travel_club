import 'package:flutter/material.dart';
import 'package:travel_club/features/auth/view/screens/new_pass_screen.dart';
import 'package:travel_club/features/main_screen/screens/main_screen.dart';
import 'package:travel_club/features/on_boarding/screen/onboarding_screen.dart';
import 'package:travel_club/features/splash/screens/splash_screen.dart';
import '../../core/utils/app_strings.dart';
import 'package:page_transition/page_transition.dart';
import '../../features/auth/view/screens/login_screen.dart';
import '../../features/auth/view/screens/sign_up_screen.dart';

class Routes {
  static const String initialRoute = '/';
  static const String loginRoute = '/login';
  static const String mainRoute = '/main';
  static const String newPass = '/newPass';
  static const String signUp = '/signUp';
  static const String onboardingPageScreenRoute = '/onboardingPageScreenRoute';
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
        case Routes.signUp:
        return PageTransition(
          child:   SignUpScreen(),
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
      //
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