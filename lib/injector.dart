import 'package:dio/dio.dart';

import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'core/api/app_interceptors.dart';
import 'core/api/base_api_consumer.dart';
import 'core/api/dio_consumer.dart';
import 'features/login/cubit/cubit.dart';
import 'features/login/data/login_repo_impl.dart';
import 'features/main_screen/cubit/cubit.dart';
import 'features/main_screen/data/repo/main_repo.dart';
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
  // serviceLocator.registerFactory(() => OnboardingCubit(serviceLocator()));
  // serviceLocator.registerFactory(() => HomeCubit(serviceLocator()));
  // serviceLocator.registerFactory(() => PaymentCubit(serviceLocator()));
  // serviceLocator.registerFactory(() => DetailsCubit(serviceLocator()));
  // serviceLocator.registerFactory(() => ChatCubit(serviceLocator()));
  // serviceLocator.registerFactory(() => EventCubit(serviceLocator()));
  // serviceLocator.registerFactory(() => ProfileCubit(serviceLocator()));
  // serviceLocator.registerFactory(() => PlacedetailsCubit(serviceLocator()));
  // serviceLocator.registerFactory(() => MyTripCubit(serviceLocator()));
  // serviceLocator.registerFactory(() => ChooseRoomCubit(serviceLocator()));
  // serviceLocator.registerFactory(() => FavouriteCubit(serviceLocator()));
  // serviceLocator.registerFactory(() => EditCubit(serviceLocator()));
  // serviceLocator.registerFactory(() => SearchHomeCubit(serviceLocator()));
  // serviceLocator.registerFactory(() => NotificationCubit(serviceLocator()));
  // serviceLocator.registerFactory(() => SettingCubit(serviceLocator()));
  // serviceLocator.registerFactory(() => VisaCardCubit(serviceLocator()));
  // serviceLocator.registerFactory(() => SupportCubit(serviceLocator()));
  // serviceLocator.registerFactory(() => AuthCubit(serviceLocator()));

  ///////////////////////////////////////////////////////////////////////////////

  //! External
  // Shared Preferences
  final sharedPreferences = await SharedPreferences.getInstance();
  serviceLocator.registerLazySingleton(() => sharedPreferences);

  // serviceLocator.registerLazySingleton(() => ServiceApi(serviceLocator()));
  serviceLocator.registerLazySingleton(() => LoginRepoImpl(serviceLocator()));
  serviceLocator.registerLazySingleton(() => MainRepoImpl(serviceLocator()));
  // serviceLocator.registerLazySingleton(() => ServiceApiOnBoarding(serviceLocator()));
  // serviceLocator.registerLazySingleton(() => RepoImplForAuth(serviceLocator()));
  // serviceLocator.registerLazySingleton(() => HomeRepoImpl(serviceLocator()));
  // serviceLocator.registerLazySingleton(() => PlaceDetailRpoImpl(serviceLocator()));
  // serviceLocator.registerLazySingleton(() => DetailsHotelRepoImpl(serviceLocator()));

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
  serviceLocator.registerLazySingleton(
        () => LogInterceptor(
      request: true,
      requestBody: true,
      requestHeader: true,
      responseBody: true,
      responseHeader: true,
      error: true,
    ),
  );
}
