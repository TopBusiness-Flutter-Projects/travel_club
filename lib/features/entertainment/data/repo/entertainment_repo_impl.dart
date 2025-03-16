import 'package:dartz/dartz.dart';

import '../../../../core/api/base_api_consumer.dart';
import '../../../../core/api/end_points.dart';
import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../model/get_orginization_model.dart';
import '../model/get_ways_model.dart';

class EntertainmentRepoImpl {
  final BaseApiConsumer dio;
  EntertainmentRepoImpl(this.dio);
  Future<Either<Failure, GetWaysModel>> GetWays(
      ) async {
    try {
      var response = await dio.get(
        EndPoints.getWays,
        queryParameters: {
          // "restaurant_id": restaurantId,
        },
      );
      return Right(GetWaysModel.fromJson(response));
    } on ServerException {
      return Left(ServerFailure());
    }
  } Future<Either<Failure, GetOrganizationsModel>> getOrganizations(
  {required String id} ) async {
    try {
      var response = await dio.get(
        EndPoints.getOrganizations,
        queryParameters: {
           "way_id":id ,
        },
      );
      return Right(GetOrganizationsModel.fromJson(response));
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}