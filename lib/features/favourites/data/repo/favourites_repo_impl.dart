import 'package:dartz/dartz.dart';

import '../../../../core/api/base_api_consumer.dart';
import '../../../../core/api/end_points.dart';
import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../../../residence/data/models/lodges_model.dart';
import '../../../transportation/data/models/get_companies_model.dart';

class FavouritesRepoImpl {
  final BaseApiConsumer dio;
  FavouritesRepoImpl(this.dio);
  Future<Either<Failure, dynamic>> getFavourite(
      {required int moduleId}) async {
    try {
      var response =
      await dio.get(EndPoints.getMyFavouritesUrl, queryParameters: {
        "module_id": moduleId,
      });
      return moduleId == 1 // residence
          ? Right(GetLodgesModel.fromJson(response))
          : moduleId == 2 // transportation
          ? Right(GetCompaniesModel.fromJson(response))
          : Right(response);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
