import 'package:dartz/dartz.dart';
import 'package:travel_club/features/auth/data/models/default_model.dart';

import '../../../../core/api/base_api_consumer.dart';
import '../../../../core/api/end_points.dart';
import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../../../food/data/models/get_resturant_model.dart';
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
          : Right(GetRestaurantModel.fromJson(response));
    } on ServerException {
      return Left(ServerFailure());
    }
  }
  //post
  Future<Either<Failure, DefaultPostModel>> postFav({
    required String moduleId,
    required String id,
  }) async {

    try {
      var response = await dio.post(
        EndPoints.addOrRemoveFavUrl,
        body: {
          'id': id,
          'module_id':moduleId,
        },
      );
      return Right(DefaultPostModel.fromJson(response));
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
