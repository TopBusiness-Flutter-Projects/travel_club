part of 'bugs_cubit.dart';

@immutable
sealed class BugsState {}

final class BugsInitial extends BugsState {}
final class NotificationLoadingState extends BugsState {}
final class NotificationLoadedState extends BugsState {}
final class NotificationErrorState extends BugsState {
  String error;
  NotificationErrorState({required this.error});
}final class SeenNotificationLoadingState extends BugsState {}
final class SeenNotificationLoadedState extends BugsState {}
final class SeenNotificationErrorState extends BugsState {
  String error;
  SeenNotificationErrorState({required this.error});
}
