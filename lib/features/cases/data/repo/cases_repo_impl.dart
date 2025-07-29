import 'package:dartz/dartz.dart';
import 'package:travel_club/features/cases/data/model/book_case_model.dart';
import 'package:travel_club/features/cases/data/model/suitcase_details_model.dart';

import '../../../../core/api/base_api_consumer.dart';
import '../../../../core/api/end_points.dart';
import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../model/get_suitcase.dart';

class CasesRepoImpl {
  final BaseApiConsumer dio;
  CasesRepoImpl(this.dio);
  Future<Either<Failure, GetSuitCaseModel>> getSuitCases() async {
    try {
      var response = await dio.get(
        EndPoints.getSuitcasesUrl,

      );
      return Right(GetSuitCaseModel.fromJson(response));
    } on ServerException {
      return Left(ServerFailure());
    }
  }
  Future<Either<Failure, GetSuitCaseDetailsModel>> getSuitcasesDetails(String id) async {
    try {
      var response = await dio.get(
        "${EndPoints.getSuitcasesDetailsUrl}/$id",
      );
      return Right(GetSuitCaseDetailsModel.fromJson(response));
    } on ServerException {
      return Left(ServerFailure());
    }
  }
  Future<Either<Failure, BookSuitCaseDetailsModel>> bookSuitcases({required String id, required int count})async {
    try {
      var response = await dio.post(
        EndPoints.addSuitcaseReservationUrl,
        body: {
          "suitcase_trip_date_id": id,
          "guests" : count
        },
      );
      return Right(BookSuitCaseDetailsModel.fromJson(response));
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
