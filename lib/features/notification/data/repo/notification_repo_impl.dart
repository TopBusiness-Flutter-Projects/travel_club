import 'package:dartz/dartz.dart';

import '../../../../core/api/base_api_consumer.dart';
import '../../../../core/api/end_points.dart';
import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../model/get_notification.dart';

class NotificationRepoImpl {
  final BaseApiConsumer dio;
  NotificationRepoImpl(this.dio);
  Future<Either<Failure, GetNotificationsModel>> getNotification() async {
    try {
      var response = await dio.get(
        EndPoints.notificationUrl,

      );
      return Right(GetNotificationsModel.fromJson(response));
    } on ServerException {
      return Left(ServerFailure());
    }
  }

}
