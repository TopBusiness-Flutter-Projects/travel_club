import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../data/repo/notification_repo_impl.dart';

part 'notification_state.dart';

class NotificationCubit extends Cubit<NotificationState> {
  NotificationCubit(this.api) : super(NotificationInitial());
  NotificationRepoImpl api;

}
