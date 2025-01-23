import 'package:dartz/dartz.dart';
import 'package:travel_club/core/api/end_points.dart';
import 'package:travel_club/core/error/exceptions.dart';
import 'package:travel_club/core/error/failures.dart';

import '../../../../core/api/base_api_consumer.dart';
import '../models/residence_reservation_model.dart';

class MyReservationsRepoImpl {
  final BaseApiConsumer dio;
  MyReservationsRepoImpl(this.dio);
  Future<Either<Failure, GetMyResidenceReservationModel>>
      getMyResidenceReservation() async {
    try {
      var response = await dio.get(
        EndPoints.getMyReservationUrl,
      );
      return Right(GetMyResidenceReservationModel.fromJson(response));
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
