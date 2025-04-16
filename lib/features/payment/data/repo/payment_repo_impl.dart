import 'package:dartz/dartz.dart';
import 'package:travel_club/features/auth/data/models/default_model.dart';
import 'package:travel_club/features/payment/data/models/check_payment_status_model.dart';
import 'package:travel_club/features/payment/data/models/get_payment_url_model.dart';

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
        moduleId == 1
            ? EndPoints.checkCouponUrl
            : moduleId == 2
                ? EndPoints.checkCouponTransportationUrl
                : moduleId == 3
                    ? EndPoints.checkCouponRestaurantUrl
                    : moduleId == 4
                        ? EndPoints.checkEntertainmentCouponUrl
                        : "",
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

  Future<Either<Failure, GetPaymentUrlModel>> getPaymentUrl({
    required int reservationId,
    required String code,
    required int moduleId,
  }) async {
    try {
      var response = await dio.post(
        moduleId == 1
            ? EndPoints.continueToPayUrl
            : moduleId == 2
                ? EndPoints.continueToPayTransportationUrl
                : moduleId == 3
                    ? EndPoints.continueToPayRestaurantUrl
                    : moduleId == 4
                        ? EndPoints.continueToPayEntertainmentUrl
                        : "",
        body: {
          if (code.isNotEmpty) 'code': code,
          if (code.isNotEmpty) 'module_id': moduleId,
          'reservation_id': reservationId,
        },
      );
      return Right(GetPaymentUrlModel.fromJson(response));
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  Future<Either<Failure, DefaultPostModel>> payWithPoints({
    required int reservationId,
    required String code,
    required int moduleId,
  }) async {
    try {
      var response = await dio.post(
        EndPoints.continueToPayUsingPointsUrl,
        body: {
          if (code.isNotEmpty) 'code': code,
          'module_id': moduleId.toString(),
          'reservation_id': reservationId.toString(),
        },
      );
      return Right(DefaultPostModel.fromJson(response));
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  Future<Either<Failure, CheckPaymentStatusModel>> checkPaymentStatus({
    required int reservationId,
    required String code,
    required int moduleId,
  }) async {
    try {
      var response = await dio.post(
        moduleId == 1
            ? EndPoints.checkPaymentUrl
            : moduleId == 2
                ? EndPoints.checkPaymentTransportationUrl
                : moduleId == 3
                    ? EndPoints.checkPaymentRestaurantUrl
                    : moduleId == 4
                        ? EndPoints.checkPaymentEntertainmentUrl
                        : "",
        body: {
          if (code.isNotEmpty) 'code': code,
          if (code.isNotEmpty) 'module_id': moduleId,
          'reservation_id': reservationId,
        },
      );

      return Right(CheckPaymentStatusModel.fromJson(response));
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
