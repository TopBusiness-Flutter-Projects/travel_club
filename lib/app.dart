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
import 'config/routes/app_routes.dart';
import 'config/themes/app_theme.dart';
import 'core/utils/app_strings.dart';
import 'package:travel_club/injector.dart' as injector;
import 'features/auth/cubit/cubit.dart';
import 'features/entertainment/cubit/entertainment_cubit.dart';
import 'features/food/cubit/food_cubit.dart';
import 'features/notification/cubit/notification_cubit.dart';
import 'features/other_services/cubit/other_services_cubit.dart';
import 'features/splash/cubit/cubit.dart';
import 'features/splash/screens/splash_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // print(text);
   NotificationService notificationService = NotificationService();
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
          navigatorKey: notificationService.navigatorKey,
          locale: context.locale,
          theme: appTheme(),
          themeMode: ThemeMode.light,
          darkTheme: ThemeData.light(),
          debugShowCheckedModeBanner: false,
          title: AppStrings.appName,
              home:notificationService.isWithNotification ?
            // widget.newsDetailsModel == null?
              const NotificationScreen():
             // NewsDetailsScreen(newsDetailsModel: widget.newsDetailsModel!):
              const SplashScreen(),

          onGenerateRoute: AppRoutes.onGenerateRoute,
        ));
  }
}
