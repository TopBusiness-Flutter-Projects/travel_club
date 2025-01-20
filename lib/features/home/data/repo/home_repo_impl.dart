import 'package:dartz/dartz.dart';
import '../../../../core/api/base_api_consumer.dart';
import '../../../../core/api/end_points.dart';
import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/preferences/preferences.dart';
import '../../../auth/data/models/login_model.dart';
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

  Future<Either<Failure, LoginModel>> checkCopoune({
    required String amount,
    required String code,
    required int moduleId,
  }) async {
    try {
      var response = await dio.post(
        EndPoints.checkCouponUrl,
        body: {
          'code': code,
          'module_id': moduleId,
          'amount': amount,
        },
      );

      return Right(LoginModel.fromJson(response));
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
