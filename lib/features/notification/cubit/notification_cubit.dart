import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:meta/meta.dart';

import '../../../core/error/failures.dart';
import '../../../core/exports.dart';
import '../../../core/utils/appwidget.dart';
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
  //
  seenNotification(BuildContext context,{required String id}) async {
   // AppWidget.createProgressDialog(context, AppTranslations.loading);
    emit(SeenNotificationLoadingState());
    final res = await api.seenNotification(id:id);
    res.fold((l) {
      if (l is ServerFailure) {
       // Navigator.pop(context);
        errorGetBar(AppTranslations.error);
        emit(SeenNotificationErrorState(error: "server_error_occurred".tr()));
      } else {
        Navigator.pop(context);
        errorGetBar(AppTranslations.error);
        emit(SeenNotificationErrorState(error:"unKnown_error_occurred".tr()));      }
    }, (r) {
     // Navigator.pop(context);
      if (r.status == 200 || r.status == 201) {
       // if(r.)
     //   getNotification();
        successGetBar(r.msg);
      } else if (r.status == 401 || r.status == 407 || r.status == 403) {
        errorGetBar(r.msg ?? AppTranslations.error);
      }
      emit(SeenNotificationLoadedState());
    }
    );
  }
}

