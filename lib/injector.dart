import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:travel_club/core/api/base_api_consumer.dart';
import 'package:travel_club/core/api/dio_consumer.dart';
import 'package:travel_club/features/accommodation/cubit/details_accomendation_cubit.dart';
import 'package:travel_club/features/accommodation/data/repo/details_accomendation_repo_impl.dart';
import 'package:travel_club/features/auth/cubit/cubit.dart';
import 'package:travel_club/features/auth/data/login_repo_impl.dart';
import 'package:travel_club/features/favourites/cubit/favourites_cubit.dart';
import 'package:travel_club/features/favourites/data/repo/favourites_repo_impl.dart';
import 'package:travel_club/features/home/cubit/home_cubit.dart';
import 'package:travel_club/features/home/data/repo/home_repo_impl.dart';
import 'package:travel_club/features/main_screen/cubit/cubit.dart';
import 'package:travel_club/features/main_screen/data/repo/main_repo_impl.dart';
import 'package:travel_club/features/my_account/cubit/account_cubit.dart';
import 'package:travel_club/features/my_account/data/repo/account_repo_impl.dart';
import 'package:travel_club/features/my_bookings/cubit/my_bookings_cubit.dart';
import 'package:travel_club/features/my_bookings/data/repo/my_bookings_repo_impl.dart';
import 'package:travel_club/features/on_boarding/cubit/onboarding_cubit.dart';
import 'package:travel_club/features/other_services/cubit/other_services_cubit.dart';
import 'package:travel_club/features/other_services/data/repo/other_services_repo_impl.dart';
import 'package:travel_club/features/splash/cubit/cubit.dart';
import 'package:travel_club/features/transportation/cubit/transportation_cubit.dart';
import 'package:travel_club/features/transportation/data/repo/transportation_repo_impl.dart';
import 'core/api/app_interceptors.dart';

final serviceLocator = GetIt.instance;

Future<void> setup() async {
  //! Features

  ///////////////////////// Blocs ////////////////////////

  serviceLocator.registerFactory(() => SplashCubit());
  serviceLocator.registerFactory(() => OnboardingCubit());
  serviceLocator.registerFactory(
    () => MainCubit(serviceLocator()),
  );
  serviceLocator.registerFactory(
    () => LoginCubit(serviceLocator()),
  );
  serviceLocator.registerFactory(
    () => HomeCubit(serviceLocator()),
  );
  serviceLocator.registerFactory(
    () => FavouritesCubit(serviceLocator()),
  );
  serviceLocator.registerFactory(
    () => MyBookingsCubit(serviceLocator()),
  );
  serviceLocator.registerFactory(
    () => AccountCubit(serviceLocator()),
  );
  serviceLocator.registerFactory(
    () => DetailsAccomendationCubit(serviceLocator()),
  );
  serviceLocator.registerFactory(
    () => OtherServicesCubit(serviceLocator()),
  );
  serviceLocator.registerFactory(
    () => TransportationCubit(serviceLocator()),
  );
//!-------------------------Declare Repo---------------------------
  serviceLocator.registerLazySingleton(() => LoginRepoImpl(serviceLocator()));
  serviceLocator.registerLazySingleton(() => MainRepoImpl(serviceLocator()));
  serviceLocator.registerLazySingleton(() => HomeRepoImpl(serviceLocator()));
  serviceLocator.registerLazySingleton(
      () => DetailsAccomendationRepoImpl(serviceLocator()));
  serviceLocator
      .registerLazySingleton(() => FavouritesRepoImpl(serviceLocator()));
  serviceLocator
      .registerLazySingleton(() => MyBookingsRepoImpl(serviceLocator()));
  serviceLocator.registerLazySingleton(() => AccountRepoImpl(serviceLocator()));
  serviceLocator
      .registerLazySingleton(() => OtherServicesRepoImpl(serviceLocator()));
  serviceLocator
      .registerLazySingleton(() => TransportationRepoImpl(serviceLocator()));

//!-------------------------Declare Interceptors---------------------------

  serviceLocator.registerLazySingleton<BaseApiConsumer>(
      () => DioConsumer(client: serviceLocator()));
  serviceLocator.registerLazySingleton(() => AppInterceptors());

  ////////////////////////// SharedPref ////////////////////////
  final sharedPreferences = await SharedPreferences.getInstance();
  serviceLocator.registerLazySingleton(() => sharedPreferences);
  // Dio
  serviceLocator.registerLazySingleton(
    () => Dio(
      BaseOptions(
        contentType: "application/x-www-form-urlencoded",
        headers: {
          "Accept": "application/json",
          'Content-Type': 'application/x-www-form-urlencoded',
        },
      ),
    ),
  );
  // serviceLocator.registerLazySingleton(
  //       () => LogInterceptor(
  //     request: false,
  //     requestBody: false,
  //     requestHeader: false,
  //     responseBody: false,
  //     responseHeader: false,
  //     error: false,
  //   ),
  // );
}
