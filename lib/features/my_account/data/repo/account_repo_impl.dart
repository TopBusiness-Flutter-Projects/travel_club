import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:travel_club/features/auth/data/models/default_model.dart';
import 'package:travel_club/features/auth/data/models/login_model.dart';
import 'package:travel_club/features/my_account/data/model/get_payment_types.dart';

import '../../../../core/api/base_api_consumer.dart';
import '../../../../core/api/end_points.dart';
import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../model/get_points_history.dart';
import '../model/get_setting_model.dart';

class AccountRepoImpl {
  final BaseApiConsumer dio;
  AccountRepoImpl(this.dio);
  Future<Either<Failure, LoginModel>> getUserData() async {
    try {
      var response = await dio.get(
        EndPoints.userDataUrl,
        
      );
      return Right(LoginModel.fromJson(response));
    } on ServerException {
      return Left(ServerFailure());
    }
  }
  Future<Either<Failure, GetPointsHistoryModel>> getMyPointHistory() async {
    try {
      var response = await dio.get(
        EndPoints.getMyPointHistoryUrl,
        
      );
      return Right(GetPointsHistoryModel.fromJson(response));
    } on ServerException {
      return Left(ServerFailure());
    }
  }
  Future<Either<Failure, GetPaymentMethodsModel>> getPaymentMethods() async {
    try {
      var response = await dio.get(
        EndPoints.getPaymentMethodsUrl,
        
      );
      return Right(GetPaymentMethodsModel.fromJson(response));
    } on ServerException {
      return Left(ServerFailure());
    }
  }
    Future<Either<Failure, DefaultPostModel>> addWhitelistPoints( {required String number ,required String points , required String paymentMethodId} ) async {
    try {
      var response = await dio.post(
        EndPoints.addWhitelistPoints,
        body: {
          'points' : points,
          'number' : number,
          'payment_method_id' :  paymentMethodId
        },
        formDataIsEnabled: true

        
      );
      return Right(DefaultPostModel.fromJson(response));
    } on ServerException {
      return Left(ServerFailure());
    }
  }
  Future<Either<Failure, LoginModel>> updateUserData( {required String name , String? imagePath} ) async {
    try {
      var response = await dio.post(
        EndPoints.updateUserDataUrl,
        body: {
          'name' : name,
        if (imagePath != null)  'image' :  await MultipartFile.fromFile(imagePath)
        },
        formDataIsEnabled: true

        
      );
      return Right(LoginModel.fromJson(response));
    } on ServerException {
      return Left(ServerFailure());
    }
  }
  Future<Either<Failure, DefaultPostModel>> updatepassword( {required String currentPassword , required String newPassword} ) async {
    try {
      var response = await dio.post(
        EndPoints.updatePasswordUrl,
        body: {
          'current_password' : currentPassword,
          'new_password' :  newPassword
        },
        formDataIsEnabled: true

        
      );
      return Right(DefaultPostModel.fromJson(response));
    } on ServerException {
      return Left(ServerFailure());
    }
  }
//contact
  Future<Either<Failure, DefaultPostModel>> contactUs( {required String subject ,required String message,required String moduleId} ) async {
    try {
      var response = await dio.post(
          EndPoints.contactUs,
          body: {
            'subject' : subject,
            'module_id' : moduleId,
            'message' : message,
          },

      );
      return Right(DefaultPostModel.fromJson(response));
    } on ServerException {
      return Left(ServerFailure());
    }
  }
//get setting
  Future<Either<Failure, GetSettingModel>> getSetting() async {
    try {
      var response = await dio.get(
        EndPoints.setting,

      );
      return Right(GetSettingModel.fromJson(response));
    } on ServerException {
      return Left(ServerFailure());
    }
  }

}
