import 'dart:async';
import 'dart:developer';

import 'package:app_links/app_links.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:travel_club/features/custom_upload_image/cubit/upload_image_cubit.dart';
import 'package:travel_club/features/favourites/cubit/favourites_cubit.dart';
import 'package:travel_club/features/home/cubit/home_cubit.dart';
import 'package:travel_club/features/location/cubit/location_cubit.dart';
import 'package:travel_club/features/main_screen/cubit/cubit.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:travel_club/features/my_account/cubit/account_cubit.dart';
import 'package:travel_club/features/my_bookings/cubit/my_bookings_cubit.dart';
import 'package:travel_club/features/notification/screens/notification_screen.dart';
import 'package:travel_club/features/on_boarding/cubit/onboarding_cubit.dart';
import 'package:travel_club/features/payment/cubit/payment_cubit.dart';
import 'package:travel_club/features/residence/cubit/residence_cubit.dart';
import 'package:travel_club/features/transportation/cubit/transportation_cubit.dart';
import 'package:travel_club/notification_service.dart';
import 'check_mian.dart';
import 'config/routes/app_routes.dart';
import 'config/themes/app_theme.dart';
import 'core/utils/app_strings.dart';
import 'package:travel_club/injector.dart' as injector;
import 'features/auth/cubit/cubit.dart';
import 'features/entertainment/cubit/entertainment_cubit.dart';
import 'features/entertainment/screens/details_of_entertainment/screens/details_entertainment.dart';
import 'features/food/cubit/food_cubit.dart';
import 'features/food/screens/details_of_food/screens/details_food_screen.dart';
import 'features/main_screen/screens/main_screen.dart';
import 'features/notification/cubit/notification_cubit.dart';
import 'features/other_services/cubit/other_services_cubit.dart';
import 'features/residence/view/screens/lodge_details.dart';
import 'features/residence/view/screens/lodges_screen.dart';
import 'features/splash/cubit/cubit.dart';
import 'features/splash/screens/splash_screen.dart';
class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
   StreamSubscription<Uri>? _linkSubscription;

  @override
  void initState() {
    super.initState();

    //  initDeepLinks();
  }

  @override
  void dispose() {
    _linkSubscription?.cancel();

    super.dispose();
  }

  Future<void> initDeepLinks() async {
    // Handle links
    _linkSubscription = AppLinks().uriLinkStream.listen((uri) {
      log('onAppLink: $uri');
      log('queryParams: ${uri.queryParametersAll}');
      log('queryParams: ${uri.queryParameters}');
      log('queryParams: ${uri.query}');
      log('queryParams: ${uri.pathSegments}');
      log('queryParams: ${uri.pathSegments.length}');
     // openAppLink(uri);
    });
  }

  void openAppLink(Uri uri) {
     log('openAppLink: ${uri.path}');
  
  // Extract the path from the URI and push the appropriate route
  final route = uri.path; // Get the full path (e.g., /deeplink/book/11)
  
 
  }


  //  StreamSubscription<Uri>? _linkSubscription;
  @override
  Widget build(BuildContext context) {
    NotificationService notificationService = NotificationService();
    // print(text);
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (_) => injector.serviceLocator<SplashCubit>(),
          ),
          BlocProvider(
            create: (_) => injector.serviceLocator<ResidenceCubit>(),
          ),
          BlocProvider(
            create: (_) => injector.serviceLocator<LoginCubit>(),
          ),

          BlocProvider(
            create: (_) => injector.serviceLocator<MainCubit>(),
          ),
          BlocProvider(
            create: (_) => injector.serviceLocator<NotificationCubit>(),
          ),
          BlocProvider(
            create: (_) => injector.serviceLocator<OnboardingCubit>(),
          ),
          BlocProvider(
            create: (_) => injector.serviceLocator<AccountCubit>(),
          ),
          BlocProvider(
            create: (_) => injector.serviceLocator<UploadImageCubit>(),
          ),
          BlocProvider(
            create: (_) => injector.serviceLocator<HomeCubit>(),
          ),
          BlocProvider(
            create: (_) => injector.serviceLocator<FavouritesCubit>(),
          ),
          BlocProvider(
            create: (_) => injector.serviceLocator<MyReservationsCubit>(),
          ),
          BlocProvider(
            create: (_) => injector.serviceLocator<OtherServicesCubit>(),
          ),
          BlocProvider(
            create: (_) => injector.serviceLocator<TransportationCubit>(),
          ),
          BlocProvider(
            create: (_) => injector.serviceLocator<LocationCubit>(),
          ),
          BlocProvider(
            create: (_) => injector.serviceLocator<EntertainmentCubit>(),
          ),
          BlocProvider(
            create: (_) => injector.serviceLocator<FoodCubit>(),
          ),
          BlocProvider(
            create: (_) => injector.serviceLocator<UploadImageCubit>(),
          ),
          BlocProvider(
            create: (_) => injector.serviceLocator<PaymentCubit>(),
          ),
        ],
        child: GetMaterialApp(
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          navigatorKey:notificationService. navigatorKey,
          locale: context.locale,
          theme: appTheme(),
          themeMode: ThemeMode.light,
          darkTheme: ThemeData.light(),
          debugShowCheckedModeBanner: false,
          title: AppStrings.appName,
              home:
             initialMessageRcieved != null ?
          ///  widget.newsDetailsModel == null?
             initialMessageRcieved?.data['reference_table'] == 'places'?
            // InitialRouteDecider( referenceTable: 'room_reservations',)
             LodgesScreen(
               arguments:  LodgesScreenArguments(
                 placeId:int.tryParse(initialMessageRcieved?.data['reference_id']) ??0,
                 title: initialMessageRcieved?.data['reference_name']),
             )

                 :
             initialMessageRcieved?.data['reference_table'] == 'lodges'?
             LodgeDetailsScreen(args: LodgeDetailsArguments(
               isDeeplink: true,
                 lodgeId: initialMessageRcieved?.data['reference_id'])):

             initialMessageRcieved?.data['reference_table'] == 'companies'?
             DetailsEntertainment(args:
             EntertainmentDetailsArgs(
               isDeeplink: true,
               id:  initialMessageRcieved?.data['reference_id']?? "0",
             )):
             initialMessageRcieved?.data['reference_table'] == 'organizations'?
             DetailsEntertainment(
                 args: EntertainmentDetailsArgs(
                   isDeeplink: true,
               id:  initialMessageRcieved?.data['reference_id']?? 0,
             )):
             initialMessageRcieved?.data['reference_table'] == "offers"||initialMessageRcieved?.data['reference_table'] == "suitcases"?
                 MainScreen():
             initialMessageRcieved?.data['reference_table'] == 'restaurants'?
             DetailsFood(args:

             DetailsFoodArgs(
               isDeeplink: true,
                 id: initialMessageRcieved?.data['reference_id'])
    ):
             initialMessageRcieved?.data['reference_table'] == 'room_reservations'?
             InitialRouteDecider( referenceTable: 'room_reservations',)
             :  initialMessageRcieved?.data['reference_table'] == 'bus_reservations'?
             InitialRouteDecider( referenceTable: 'bus_reservations',)
             :  initialMessageRcieved?.data['reference_table'] == 'organization_reservations'?
             InitialRouteDecider( referenceTable: 'organization_reservations',):
             initialMessageRcieved?.data['reference_table'] == 'restaurant_reservations'?
             InitialRouteDecider( referenceTable: 'restaurant_reservations',)            :
             NotificationScreen():
             // NewsDetailsScreen(newsDetailsModel: widget.newsDetailsModel!):
               SplashScreen(),
          onGenerateRoute: AppRoutes.onGenerateRoute,
        ));
  }
}
