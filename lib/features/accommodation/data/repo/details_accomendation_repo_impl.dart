
import 'package:dartz/dartz.dart';
import 'package:travel_club/features/accommodation/data/models/facilities_model.dart';
import 'package:travel_club/features/accommodation/data/models/getlodges_room.dart';

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
     
      );
      return Right(FacilitiesModel.fromJson(response));
    } on ServerException {
      return Left(ServerFailure());
    }
  }
//get Lodges
  Future<Either<Failure, GetLodgesModel>> getLodges({required int placeId,
     double ?lat,
     double ?long,
    String ?filter,
    required List<int> stars,
    required List<int> facilities

  }) async {

    try {
      var response = await dio.get(
        EndPoints.getLodgesUrl,
        queryParameters: {
          "place_id":placeId,
          if (lat != null )"lat":lat,
          if (long != null) "long":long,
          if (filter != null)"filter":filter,
          for (int i=0;i<stars.length;i++)  "stars[$i]":stars[i],
          for (int i=0;i<facilities.length;i++)  "facility_id[$i]":facilities[i],
        },
      
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
          "lodge_id":lodgeId,
        },
       
      );
      return Right(GetLodgeDetail.fromJson(response));
    } on ServerException {
      return Left(ServerFailure());
    }
  }
//get LodgesRooms
  Future<Either<Failure, GetLodgesRooms>> getRoomsLodges({required int ?lodgeId,required String ?fromDay,required String ?toDay,required int ?guest}) async {
    try {
      var response = await dio.get(
        EndPoints.getLodgesRoomsUrl,
        queryParameters: {
          "lodge_id":"2",
          "fromDay":fromDay,
          "toDay":toDay,
          "guest":guest
        },
      );
      return Right(GetLodgesRooms.fromJson(response));
    } on ServerException {
      return Left(ServerFailure());
    }
  }


}
