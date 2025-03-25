import 'package:dartz/dartz.dart';

import '../../../../core/api/base_api_consumer.dart';
import '../../../../core/api/end_points.dart';
import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../models/get_others_model.dart';
import '../models/get_single_service_model.dart';
import '../models/sub_services_model.dart';

class OtherServicesRepoImpl {
  final BaseApiConsumer dio;
  OtherServicesRepoImpl(this.dio);
  Future<Either<Failure, GetOthersModel>> getOthers() async {
    try {
      var response = await dio.get(
        EndPoints.otherServicesUrl,
      );
      return Right(GetOthersModel.fromJson(response));
    } on ServerException {
      return Left(ServerFailure());
    }
  } Future<Either<Failure, GetSubServicesModel>> getSubServices({required String id}) async {
    try {
      var response = await dio.get(
        EndPoints.otherServicesUrl,
        queryParameters: {  "service_id": id},
      );
      return Right(GetSubServicesModel.fromJson(response));
    } on ServerException {
      return Left(ServerFailure());
    }
  }Future<Either<Failure, GetSingleServiceMoedl>> getSubSingleServices({required String id}) async {
    try {
      var response = await dio.get(
        EndPoints.otherServicesUrl+"/$id",
      );
      return Right(GetSingleServiceMoedl.fromJson(response));
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
