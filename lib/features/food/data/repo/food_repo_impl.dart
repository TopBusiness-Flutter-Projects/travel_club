import 'package:dartz/dartz.dart';
import 'package:travel_club/features/food/data/models/get_menu_meals_model.dart';

import '../../../../core/api/base_api_consumer.dart';
import '../../../../core/api/end_points.dart';
import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../models/get_catogrey_model.dart';
import '../models/get_restaurant_details_model.dart';
import '../models/get_resturant_model.dart';

class FoodRepoImpl {
  final BaseApiConsumer dio;
  FoodRepoImpl(this.dio);
  Future<Either<Failure, GetCategoryFoodModel>> getMenuCategory() async {
    try {
      var response = await dio.get(
        EndPoints.getMenuCategoryRestaurantsUrl,
      );
      return Right(GetCategoryFoodModel.fromJson(response));
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  Future<Either<Failure, GetMenuMealsModel>> getMenuMeals({
    required String menuId,
  }) async {
    try {
      var response = await dio.get(
        EndPoints.getRestaurantMenuUrl,
        queryParameters: {
          "restaurant_menu_category_id": menuId,
          "restaurant_id": "1",
        },
      );
      return Right(GetMenuMealsModel.fromJson(response));
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  Future<Either<Failure, GetCategoryFoodModel>> getCatogrey() async {
    try {
      var response = await dio.get(
        EndPoints.getCategoryUrl,
      );
      return Right(GetCategoryFoodModel.fromJson(response));
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  Future<Either<Failure, GetRestaurantModel>> getRestuarnt(
      {required String id}) async {
    try {
      var response = await dio.get(EndPoints.getRestaurantUrl,
          queryParameters: {if (id != "0") "restaurant_category_id=": id});

      return Right(GetRestaurantModel.fromJson(response));
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  Future<Either<Failure, GetRestaurantDetailsModel>> getRestaurantDetails(
      {required String id}) async {
    try {
      var response = await dio.get(
        EndPoints.getRestaurantDetails + id,
      );
      return Right(GetRestaurantDetailsModel.fromJson(response));
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
