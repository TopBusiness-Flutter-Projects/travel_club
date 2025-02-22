import 'package:dartz/dartz.dart';

import '../../../../core/api/base_api_consumer.dart';
import '../../../../core/api/end_points.dart';
import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../models/get_catogrey_model.dart';
import '../models/get_resturant_model.dart';

class FoodRepoImpl {
  final BaseApiConsumer dio;
  FoodRepoImpl(this.dio);

  Future<Either<Failure, GetCatogreyFoodModel>> getCatogrey() async {
    try {
      var response = await dio.get(
        EndPoints.getCatogreyUrl,
      );
      return Right(GetCatogreyFoodModel.fromJson(response));
    } on ServerException {
      return Left(ServerFailure());
    }
  }  Future<Either<Failure, GetResturant>> getRestuarnt({required String id}) async {
    try {
      var response = await dio.get(
        EndPoints.getRestuartUrl+'${id}',
      );

      return Right(GetResturant.fromJson(response));
    } on ServerException {
      return Left(ServerFailure());
    }
  }

}
