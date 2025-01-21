import 'package:dartz/dartz.dart';

import '../../../../core/api/base_api_consumer.dart';
import '../../../../core/api/end_points.dart';
import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../models/check_copoune_model.dart';

class PaymentRepoImpl {
  final BaseApiConsumer dio;
  PaymentRepoImpl(this.dio);
   Future<Either<Failure, CheckCopouneModel>> checkCopoune({
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

      return Right(CheckCopouneModel.fromJson(response));
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
