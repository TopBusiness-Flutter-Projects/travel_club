import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:travel_club/features/favourites/cubit/favourites_cubit.dart';
import 'package:travel_club/features/favourites/data/repo/favourites_repo_impl.dart';
import 'package:travel_club/features/home/cubit/home_cubit.dart';
import 'package:travel_club/features/home/data/repo/home_repo_impl.dart';
import 'package:travel_club/features/my_account/cubit/account_cubit.dart';
import 'package:travel_club/features/my_account/data/repo/account_repo_impl.dart';
import 'package:travel_club/features/my_bookings/cubit/my_bookings_cubit.dart';
import 'package:travel_club/features/my_bookings/data/repo/my_bookings_repo_impl.dart';
import 'package:travel_club/features/on_boarding/cubit/onboarding_cubit.dart';
import 'core/api/app_interceptors.dart';
import 'core/api/base_api_consumer.dart';
import 'core/api/dio_consumer.dart';
import 'features/auth/cubit/cubit.dart';
import 'features/auth/data/login_repo_impl.dart';
import 'features/main_screen/cubit/cubit.dart';
import 'features/main_screen/data/repo/main_repo_impl.dart';
import 'features/splash/cubit/cubit.dart';

// import 'features/downloads_videos/cubit/downloads_videos_cubit.dart';

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
//!-------------------------Declare Repo---------------------------
  serviceLocator.registerLazySingleton(() => LoginRepoImpl(serviceLocator()));
  serviceLocator.registerLazySingleton(() => MainRepoImpl(serviceLocator()));
  serviceLocator.registerLazySingleton(() => HomeRepoImpl(serviceLocator()));
  serviceLocator
      .registerLazySingleton(() => FavouritesRepoImpl(serviceLocator()));
  serviceLocator
      .registerLazySingleton(() => MyBookingsRepoImpl(serviceLocator()));
  serviceLocator.registerLazySingleton(() => AccountRepoImpl(serviceLocator()));

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
