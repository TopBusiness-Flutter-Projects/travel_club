import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:travel_club/core/api/end_points.dart';
import 'package:travel_club/core/error/failures.dart';
import 'package:travel_club/core/preferences/preferences.dart';

import '../../../../core/api/base_api_consumer.dart';
import '../../../core/error/exceptions.dart';
import 'models/default_model.dart';
import 'models/login_model.dart';

class LoginRepoImpl {
  final BaseApiConsumer api;
  LoginRepoImpl(this.api);
  // LOGIN

  Future<Either<Failure, LoginModel>> login({
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
          'device_token': notificationToken ?? "device_token",
          'password': password,
          'phone': phone,
        },
      );

      return Right(LoginModel.fromJson(response));
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  // register
  Future<Either<Failure, LoginModel>> register(
      {required String password,
      required bool isCheckOtp,
      required String passwordConfirmation,
      required String phone,
      String? otp,
      required String name}) async {
    String? notificationToken =
        await Preferences.instance.getNotificationToken();
    String deviceType = Platform.isAndroid ? 'android' : 'ios';
    try {
      var response = await api.post(
        isCheckOtp ? EndPoints.checkOtpUrl : EndPoints.registerUrl,
        body: {
          'device_type': deviceType,
          'device_token': notificationToken ?? "device_token",
          'password': password,
          'password_confirmation': passwordConfirmation,
          'phone': phone,
          'name': name,
          if (otp != null) "otp": otp
        },
      );
      return Right(LoginModel.fromJson(response));
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  Future<Either<Failure, DefaultPostModel>> forgetPassword({
    required String phone,
  }) async {
    try {
      var response = await api.post(
        EndPoints.forgetPasswordUrl,
        body: {
          'phone': phone,
        },
      );
      return Right(DefaultPostModel.fromJson(response));
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  Future<Either<Failure, LoginModel>> resetPassword({
    required String password,
    required String passwordConfirmation,
    required String phone,
  }) async {
    String? notificationToken =
        await Preferences.instance.getNotificationToken();
    String deviceType = Platform.isAndroid ? 'android' : 'ios';
    try {
      var response = await api.post(
        EndPoints.resetPasswordUrl,
        body: {
          'device_type': deviceType,
          'device_token': notificationToken ?? "device_token",
          'password': password,
          'password_confirmation': passwordConfirmation,
          'phone': phone,
        },
      );
      return Right(LoginModel.fromJson(response));
    } on ServerException {
      return Left(ServerFailure());
    }
  }
  Future<Either<Failure, DefaultPostModel>> validateOtp({
 
    required String phone,
    required String otp,
  }) async {

    try {
      var response = await api.post(
        EndPoints.validateOtpUrl,
        body: {
          
          'phone': phone,
          'otp'  :otp 
        },
      );
      return Right(DefaultPostModel.fromJson(response));
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  Future<Either<Failure, DefaultPostModel>> logout() async {
    String? notificationToken =
        await Preferences.instance.getNotificationToken();
    try {
      var response = await api.post(
        EndPoints.logoutUrl,
        body: {
          'device_token': notificationToken ?? "device_token",
        },
      );

      return Right(DefaultPostModel.fromJson(response));
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
