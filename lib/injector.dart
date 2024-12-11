import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
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

  // serviceLocator.registerFactory(
  //   () => LoginCubit(serviceLocator()),
  // );
  serviceLocator.registerFactory(
        () => MainCubit(serviceLocator()),
  ); serviceLocator.registerFactory(
        () => LoginCubit(serviceLocator()),
  );

  final sharedPreferences = await SharedPreferences.getInstance();
  serviceLocator.registerLazySingleton(() => sharedPreferences);

  // serviceLocator.registerLazySingleton(() => ServiceApi(serviceLocator()));
  serviceLocator.registerLazySingleton(() => LoginRepoImpl(serviceLocator()));
  serviceLocator.registerLazySingleton(() => MainRepoImpl(serviceLocator()));
  serviceLocator.registerLazySingleton(() => OnboardingCubit());

  serviceLocator.registerLazySingleton<BaseApiConsumer>(
          () => DioConsumer(client: serviceLocator()));
  serviceLocator.registerLazySingleton(() => AppInterceptors());

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
