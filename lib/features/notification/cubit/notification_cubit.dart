import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:meta/meta.dart';

import '../../../core/error/failures.dart';
import '../data/model/get_notification.dart';
import '../data/repo/notification_repo_impl.dart';

part 'notification_state.dart';

class NotificationCubit extends Cubit<NotificationState> {
  NotificationCubit(this.api) : super(NotificationInitial());
  NotificationRepoImpl api;
  GetNotificationsModel getNotificationModel = GetNotificationsModel();
  getNotification() async {
    //getSettingModel = GetMenuMealsModel();
    emit(NotificationLoadingState());
    final res =
    await api.getNotification();
    res.fold((l) {
      if (l is ServerFailure) {
        emit(NotificationErrorState(error:"server_error_occurred".tr()));
      } else {
        emit(NotificationErrorState(error:"unKnown_error_occurred".tr()));
      }
    }, (r) {
      getNotificationModel = r;

      emit(NotificationLoadedState());
    });
  }
}

