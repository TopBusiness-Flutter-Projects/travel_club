import 'package:dartz/dartz.dart';
import 'package:travel_club/core/api/end_points.dart';
import 'package:travel_club/core/error/exceptions.dart';
import 'package:travel_club/core/error/failures.dart';
import 'package:travel_club/features/my_bookings/data/models/cancel_reservation.dart';

import '../../../../core/api/base_api_consumer.dart';
import '../models/residence_reservation_details_model.dart';
import '../models/residence_reservation_model.dart';

class MyReservationsRepoImpl {
  final BaseApiConsumer dio;
  MyReservationsRepoImpl(this.dio);
  Future<Either<Failure, GetMyResidenceReservationModel>>
      getMyResidenceReservation() async {
    try {
      var response =
          await dio.get(EndPoints.getMyReservationUrl, queryParameters: {
        "module_id": 1,
      });
      return Right(GetMyResidenceReservationModel.fromJson(response));
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  //cancel reservation
  Future<Either<Failure, CancelReservationModel>> cancelReservation(
      {required int moduleId, required int reservationId}) async {
    try {
      var response =
          await dio.post(EndPoints.cancelReservationurl, queryParameters: {
        "module_id": moduleId,
        "reservation_id": reservationId,
      });
      return Right(CancelReservationModel.fromJson(response));
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  Future<Either<Failure, dynamic>> getResidenceReservationDetails(
      {required int reservationId, required int moduleId}) async {
    try {
      var response =
          await dio.get(EndPoints.getMyReservationDetailsUrl, queryParameters: {
        "module_id": moduleId,
        "reservation_id": reservationId,
      });

      return moduleId == 1
          ? Right(GetResidenceReservationDetailsModel.fromJson(response))
          : Right(response);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
