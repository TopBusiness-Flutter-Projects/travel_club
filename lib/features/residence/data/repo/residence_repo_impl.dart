
import 'package:dartz/dartz.dart';
import '../../../../core/api/base_api_consumer.dart';
import '../../../../core/api/end_points.dart';
import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../models/addRoomReservation_model.dart';
import '../models/facilities_model.dart';
import '../models/lodge_details_model.dart';
import '../models/lodges_model.dart';
import '../models/rooms_model.dart';
import '../models/places_model.dart';

class ResidenceRepoImpl {
  final BaseApiConsumer dio;
  ResidenceRepoImpl(this.dio);
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
  Future<Either<Failure, GetLodgesModel>> getLodges(
      {required int placeId,
      double? lat,
      double? long,
      String? filter,
      required List<int> stars,
      required List<int> facilities
      }) async {
    try {
      var response = await dio.get(
        EndPoints.getLodgesUrl,
        queryParameters: {
          "place_id": placeId,
          if (lat != null) "lat": lat,
          if (long != null) "long": long,
          if (filter != null) "filter": filter,
          for (int i = 0; i < stars.length; i++) "stars[$i]": stars[i],
          for (int i = 0; i < facilities.length; i++)
            "facility_id[$i]": facilities[i],
        },
      );
      return Right(GetLodgesModel.fromJson(response));
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  //get details lodges
  Future<Either<Failure, GetLodgeDetailModel>> getDetailsLodges(
      {required int lodgeId})
  async {
    try {
      var response = await dio.get(
        EndPoints.getLodgesDetailsUrl,
        queryParameters: {
          "lodge_id": lodgeId,
        },
      );
      return Right(GetLodgeDetailModel.fromJson(response));
    } on ServerException {
      return Left(ServerFailure());
    }
  }

//get LodgesRooms
  Future<Either<Failure, GetLodgesRooms>> getRoomsLodges(
      {required int lodgeId,
      required String fromDay,
      required String toDay,
      required int guest}) async {
    try {
      var response = await dio.get(
        EndPoints.getLodgesRoomsUrl,
        queryParameters: {
          "lodge_id": lodgeId,
          "fromDay": fromDay,
          "toDay": toDay,
          "guest": guest
        },
      );
      return Right(GetLodgesRooms.fromJson(response));
    } on ServerException {
      return Left(ServerFailure());
    }
  }
  //addRoomReservation

  Future<Either<Failure, AddRoomReservationModel>> addRoomReservation({
    required String fromDay,
    required String toDay,
    required int guest,
    required List<int> rooms,

  }) async {
    try {
      var response = await dio.post(
        EndPoints.addRoomReservation,
        body: {
          'from':fromDay,// fromDay,
          'to':toDay, //toDay,
          "guest":guest,//guest,
          "room_ids":rooms ,
          // for (int i = 0; i < rooms.length; i++)
          //   "room_ids[$i]": rooms[i],
        },
      );
      print( "dddddddddddddddd ${response.toString()}");
      return Right(AddRoomReservationModel.fromJson(response));
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
