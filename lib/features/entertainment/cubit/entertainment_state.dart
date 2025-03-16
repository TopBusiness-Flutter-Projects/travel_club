part of 'entertainment_cubit.dart';

@immutable
sealed class EntertainmentState {}

final class EntertainmentInitial extends EntertainmentState {}
final class ChangeIndex extends EntertainmentState {}
final class DateChangedState extends EntertainmentState {}
final class LoadingGetWays extends EntertainmentState {}
final class ErrorGetWays extends EntertainmentState {}
final class LoadedGtWays extends EntertainmentState {}
final class LoadingOrganizers extends EntertainmentState {}
final class ErrorOrganizers extends EntertainmentState {}
final class LoadedOrganizers extends EntertainmentState {}
