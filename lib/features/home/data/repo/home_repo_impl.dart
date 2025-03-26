import 'package:dartz/dartz.dart';
import '../../../../core/api/base_api_consumer.dart';
import '../../../../core/api/end_points.dart';
import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/preferences/preferences.dart';
import '../../../auth/data/models/login_model.dart';
import '../../../entertainment/data/model/get_ways_model.dart';
import '../../../other_services/data/models/get_others_model.dart';
import '../../../residence/data/models/lodges_model.dart';
import '../../../transportation/data/models/get_companies_model.dart';
import '../models/home_filter_model.dart';
import '../models/home_model.dart';

class HomeRepoImpl {
  final BaseApiConsumer dio;
  HomeRepoImpl(this.dio);
  Future<Either<Failure, GetHomeModel>> getHome() async {
    LoginModel user = await Preferences.instance.getUserModel();
    try {
      var response = await dio.get(
        EndPoints.homeUrl,
      );
      return Right(GetHomeModel.fromJson(response));
    } on ServerException {
      return Left(ServerFailure());
    }
  }
  Future<Either<Failure, dynamic>> getHomeFilter({required String catId,required String searchText}) async {
    try {
      var response = await dio.get(
        EndPoints.homeFilterUrl,
        queryParameters: {
          'module_id':catId,
          'search':searchText,
        },
      );
      return  catId.toString() == "1" // residence
          ? Right(GetLodgesModel.fromJson(response))
          : catId.toString() == "2" // transportation
          ? Right(GetCompaniesModel.fromJson(response)):catId.toString() == "4"? Right(GetWaysModel.fromJson(response))
          :catId.toString() == "5"? Right(GetOthersModel.fromJson(response)): Right(response);
    } on ServerException {
      return Left(ServerFailure());
    }
  }


}
