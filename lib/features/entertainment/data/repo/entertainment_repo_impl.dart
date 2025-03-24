import 'package:dartz/dartz.dart';
import 'package:travel_club/features/entertainment/data/model/add_reservation_model.dart';

import '../../../../core/api/base_api_consumer.dart';
import '../../../../core/api/end_points.dart';
import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../model/get_orginization_details_model.dart';
import '../model/get_orginization_model.dart';
import '../model/get_ways_model.dart';

class EntertainmentRepoImpl {
  final BaseApiConsumer dio;
  EntertainmentRepoImpl(this.dio);
  Future<Either<Failure, GetWaysModel>> GetWays() async {
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
  }

  Future<Either<Failure, GetOrganizationsModel>> getOrganizations(
      {required String id}) async {
    try {
      var response = await dio.get(
        EndPoints.getOrganizations,
        queryParameters: {
          "way_id": id,
        },
      );
      return Right(GetOrganizationsModel.fromJson(response));
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  Future<Either<Failure, GetOrganizationDetails>> getOrganizationsDetails(
      {required String id}) async {
    try {
      var response = await dio.get(
        EndPoints.getOrganizationsDetails + "/" + id,
      );
      return Right(GetOrganizationDetails.fromJson(response));
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  Future<Either<Failure, AddEntertainmentReservationModel>>
      addEntertainmentReservation({
    required String serviceId,
    required String userName,
    required String date,
    required String userPhone,
    required String clientCount,
  }) async {
    try {
      var response = await dio.post(
        EndPoints.addEntertainmentReservation,
        body: {
          "way_service_id": serviceId,
          "user_name": userName,
          "client_count": clientCount,
          "user_phone": userPhone,
          "date": date,
        },
      );
      return Right(AddEntertainmentReservationModel.fromJson(response));
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
