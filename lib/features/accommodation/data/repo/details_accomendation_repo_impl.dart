
import 'package:dartz/dartz.dart';
import 'package:travel_club/features/accommodation/data/models/facilities_model.dart';

import '../../../../core/api/base_api_consumer.dart';
import '../../../../core/api/end_points.dart';
import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../models/getlodge_details.dart';
import '../models/getlodges_model.dart';
import '../models/places_model.dart';

class DetailsAccomendationRepoImpl {
  final BaseApiConsumer dio;
  DetailsAccomendationRepoImpl(this.dio);
  //get places
  Future<Either<Failure, PlacesModel>> getPlaces() async {
    try {
      var response = await dio.get(
        EndPoints.placesUrl,
        // options: Options(
        //   headers: {'Authorization': "Bearer ${user.data?.token ?? ''}"},
        // ),
      );
      return Right(PlacesModel.fromJson(response));
    } on ServerException {
      return Left(ServerFailure());
    }
  }
  //get Facilities
  Future<Either<Failure, FacilitiesModel>> getFacilities() async {
    try {
      var response = await dio.get(
        EndPoints.getFacilitiesUrl,
        // options: Options(
        //   headers: {'Authorization': "Bearer ${user.data?.token ?? ''}"},
        // ),
      );
      return Right(FacilitiesModel.fromJson(response));
    } on ServerException {
      return Left(ServerFailure());
    }
  }
//get Lodges
  Future<Either<Failure, GetLodgesModel>> getLodges({required int ?placeId,required double ?lat,required double ?long,required String ?filter}) async {
    try {
      var response = await dio.get(
        EndPoints.getLodgesUrl,
        queryParameters: {
          "place_id":placeId,
          if (lat != null )"lat":lat,
          if (long != null) "long":long,
          if (filter != null)"filter":filter
        },
        // options: Options(
        //   headers: {'Authorization': "Bearer ${user.data?.token ?? ''}"},
        // ),
      );
      return Right(GetLodgesModel.fromJson(response));
    } on ServerException {
      return Left(ServerFailure());
    }
  }
  //get details lodges
  Future<Either<Failure, GetLodgeDetail>> getDetailsLodges({required int ?lodgeId}) async {
    try {
      var response = await dio.get(
        EndPoints.getLodgesDetailsUrl,
        queryParameters: {
          "lodge_id":"3",
        },
        // options: Options(
        //   headers: {'Authorization': "Bearer ${user.data?.token ?? ''}"},
        // ),
      );
      return Right(GetLodgeDetail.fromJson(response));
    } on ServerException {
      return Left(ServerFailure());
    }
  }


}
