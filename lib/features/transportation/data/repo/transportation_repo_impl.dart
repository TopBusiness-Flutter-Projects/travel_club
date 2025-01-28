import 'package:travel_club/core/exports.dart';
import 'package:travel_club/features/transportation/data/models/get_companies_model.dart';
import 'package:travel_club/features/transportation/data/models/get_companyStations_model.dart';

class TransportationRepoImpl {
  final BaseApiConsumer dio;
  TransportationRepoImpl(this.dio);
  Future<Either<Failure, GetCompaniesModel>> getCompanies(
      {required String lat, required String long}) async {
    try {
      var response = await dio.get(
        EndPoints.getCompaniesUrl,
        queryParameters: {
          "lat": lat,
          "long": long,
        },
      );
      return Right(GetCompaniesModel.fromJson(response));
    } on ServerException {
      return Left(ServerFailure());
    }
  }


  Future<Either<Failure, GetCompanyStationModel>> getCompanyStations(
      {required String lat,
      required String long,
      required int companyId}) async {
    try {
      var response = await dio.get(
        EndPoints.getCompanyStationUrl,
        queryParameters: {
          "lat": lat,
          "long": long,
          "company_id": companyId,
        },
      );
      return Right(GetCompanyStationModel.fromJson(response));
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
