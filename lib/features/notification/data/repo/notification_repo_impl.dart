import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:travel_club/features/auth/data/models/default_model.dart';

import '../../../../core/api/base_api_consumer.dart';
import '../../../../core/api/end_points.dart';
import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/preferences/preferences.dart';
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
  Future<Either<Failure, DefaultPostModel>> seenNotification({
    required String id,
  }) async {
    try {
      var response = await dio.post(
        EndPoints.seenNotificationUrl,
        body: {
         "notification_id":id
        },
      );
      return Right(DefaultPostModel.fromJson(response));
    } on ServerException {
      return Left(ServerFailure());
    }
  }

}
