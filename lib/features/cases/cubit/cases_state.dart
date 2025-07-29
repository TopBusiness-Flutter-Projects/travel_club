part of 'cases_cubit.dart';

@immutable
sealed class CasesState {}

final class CasesInitial extends CasesState {}
final class NotificationLoadingState extends CasesState {}
final class NotificationLoadedState extends CasesState {}
final class NotificationErrorState extends CasesState {
  String error;
  NotificationErrorState({required this.error});
}final class SeenNotificationLoadingState extends CasesState {}
final class SeenNotificationLoadedState extends CasesState {}
final class StartsDateState extends CasesState {}
final class SeenNotificationErrorState extends CasesState {
  String error;
  SeenNotificationErrorState({required this.error});
}
