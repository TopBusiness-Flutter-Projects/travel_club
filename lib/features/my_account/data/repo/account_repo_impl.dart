import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:travel_club/features/auth/data/models/default_model.dart';
import 'package:travel_club/features/auth/data/models/login_model.dart';

import '../../../../core/api/base_api_consumer.dart';
import '../../../../core/api/end_points.dart';
import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';

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

}
