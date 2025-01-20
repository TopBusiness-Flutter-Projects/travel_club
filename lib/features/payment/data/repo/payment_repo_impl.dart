import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:travel_club/features/auth/data/models/default_model.dart';
import 'package:travel_club/features/auth/data/models/login_model.dart';

import '../../../../core/api/base_api_consumer.dart';
import '../../../../core/api/end_points.dart';
import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';

class PaymentRepoImpl {
  final BaseApiConsumer dio;
  PaymentRepoImpl(this.dio);
   Future<Either<Failure, LoginModel>> checkCopoune({
    required String amount,
    required String code,
    required int moduleId,
  }) async {
    try {
      var response = await dio.post(
        EndPoints.checkCouponUrl,
        body: {
          'code': code,
          'module_id': moduleId,
          'amount': amount,
        },
      );

      return Right(LoginModel.fromJson(response));
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
