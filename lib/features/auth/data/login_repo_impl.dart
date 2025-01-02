
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:travel_club/core/api/end_points.dart';
import 'package:travel_club/core/error/failures.dart';
import 'package:travel_club/core/preferences/preferences.dart';

import '../../../../core/api/base_api_consumer.dart';
import '../../../core/error/exceptions.dart';
import 'login_model.dart';

class LoginRepoImpl {
  final BaseApiConsumer api;
  LoginRepoImpl(this.api);
  // LOGIN

  Future<Either<Failure, LoginModel>> login(
      {
      required String password,
      required String phone,
     }) async {
    String? notificationToken =
        await Preferences.instance.getNotificationToken();
      String deviceType = Platform.isAndroid ? 'android' : 'ios';
    try {
      var response = await api.post(
        EndPoints.loginUrl,
      
        body: {
          'device_type': deviceType,
          'device_token': notificationToken??"device_token",
          'password': password,
          'phone': phone,
        },
      );

      return Right(LoginModel.fromJson(response));
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
