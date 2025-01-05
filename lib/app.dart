import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:travel_club/features/favourites/cubit/favourites_cubit.dart';
import 'package:travel_club/features/home/cubit/home_cubit.dart';
import 'package:travel_club/features/location/cubit/location_cubit.dart';
import 'package:travel_club/features/main_screen/cubit/cubit.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:travel_club/features/my_account/cubit/account_cubit.dart';
import 'package:travel_club/features/my_bookings/cubit/my_bookings_cubit.dart';
import 'package:travel_club/features/on_boarding/cubit/onboarding_cubit.dart';
import 'package:travel_club/features/transportation/cubit/transportation_cubit.dart';
import 'config/routes/app_routes.dart';
import 'config/themes/app_theme.dart';
import 'core/utils/app_strings.dart';
import 'package:travel_club/injector.dart' as injector;
import 'features/accommodation/cubit/accomendation_cubit.dart';
import 'features/auth/cubit/cubit.dart';
import 'features/entertainment/cubit/entertainment_cubit.dart';
import 'features/food/cubit/food_cubit.dart';
import 'features/notification/cubit/notification_cubit.dart';
import 'features/other_services/cubit/other_services_cubit.dart';
import 'features/search/cubit/search_cubit.dart';
import 'features/splash/cubit/cubit.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // print(text);

    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (_) => injector.serviceLocator<SplashCubit>(),
          ),  BlocProvider(
            create: (_) => injector.serviceLocator<AccomendationCubit>(),
          ),
          BlocProvider(
            create: (_) => injector.serviceLocator<LoginCubit>(),
          ),
          BlocProvider(
            create: (_) => injector.serviceLocator<SearchCubit>(),
          ),
          BlocProvider(
            create: (_) => injector.serviceLocator<MainCubit>(),
          ),  BlocProvider(
            create: (_) => injector.serviceLocator<NotificationCubit>(),
          ),
          BlocProvider(
            create: (_) => injector.serviceLocator<OnboardingCubit>(),
          ),
          BlocProvider(
            create: (_) => injector.serviceLocator<AccountCubit>(),
          ),
          BlocProvider(
            create: (_) => injector.serviceLocator<HomeCubit>(),
          ),
          BlocProvider(
            create: (_) => injector.serviceLocator<FavouritesCubit>(),
          ),
          BlocProvider(
            create: (_) => injector.serviceLocator<MyBookingsCubit>(),
          ),    BlocProvider(
            create: (_) => injector.serviceLocator<OtherServicesCubit>(),
          ),
          BlocProvider(
            create: (_) => injector.serviceLocator<TransportationCubit>(),
          ),
          BlocProvider(
            create: (_) => injector.serviceLocator<LocationCubit>(),
          ),   BlocProvider(
            create: (_) => injector.serviceLocator<EntertainmentCubit>(),
          ), BlocProvider(
            create: (_) => injector.serviceLocator<FoodCubit>(),
          ),
        ],
        child: GetMaterialApp(
          localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
          theme: appTheme(),
          themeMode: ThemeMode.light,
          darkTheme: ThemeData.light(),
          // standard dark theme
          debugShowCheckedModeBanner: false,
          title: AppStrings.appName,
          onGenerateRoute: AppRoutes.onGenerateRoute,
        )
    );
  }
}
