import 'package:dartz/dartz.dart';
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
  Future<Either<Failure, LoginModel>> updateUserData( ) async {
    try {
      var response = await dio.post(
        EndPoints.updateUserDataUrl,
        
      );
      return Right(LoginModel.fromJson(response));
    } on ServerException {
      return Left(ServerFailure());
    }
  }

}
