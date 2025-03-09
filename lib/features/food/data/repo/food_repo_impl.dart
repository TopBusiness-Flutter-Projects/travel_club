import 'package:dartz/dartz.dart';
import 'package:travel_club/features/auth/data/models/default_model.dart';
import 'package:travel_club/features/food/data/models/get_menu_meals_model.dart';

import '../../../../core/api/base_api_consumer.dart';
import '../../../../core/api/end_points.dart';
import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../../../residence/data/models/addRoomReservation_model.dart';
import '../models/get_catogrey_model.dart';
import '../models/get_restaurant_details_model.dart';
import '../models/get_resturant_model.dart';

class FoodRepoImpl {
  final BaseApiConsumer dio;
  FoodRepoImpl(this.dio);
  Future<Either<Failure, GetCategoryFoodModel>> getMenuCategory(
      {required String restaurantId}) async {
    try {
      var response = await dio.get(
        EndPoints.getMenuCategoryRestaurantsUrl,
        queryParameters: {
          "restaurant_id": restaurantId,
        },
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
          queryParameters: {if (id != "0") "restaurant_category_id": id});

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
  Future<Either<Failure, DefaultPostModel>> addRestaurantReservation({
    required String restaurant_id,
    required String user_name,
    required String date,
    required String user_phone,
    required String client_count,
    required List<int?> restaurant_menu_ids,
    required List<int> counts,
  }) async {
    try {
      var response = await dio.post(
        EndPoints.addRestaurantReservation,
        body: {
          "restaurant_id":restaurant_id,
          "user_name":user_name,
          "client_count":client_count,
          "user_phone":user_phone,
          "date":date,
          if(restaurant_menu_ids.isNotEmpty)
            for (int i = 0; i < restaurant_menu_ids.length; i++)
            "restaurant_menu_ids[$i]": restaurant_menu_ids[i],
          if(counts.isNotEmpty)
            for (int i = 0; i < counts.length; i++)
            "counts[$i]": counts[i],
        },
      );
      print("dddddddddddddddd ${response.toString()}");
      return Right(DefaultPostModel.fromJson(response));
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}

