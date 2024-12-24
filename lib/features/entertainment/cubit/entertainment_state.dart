part of 'entertainment_cubit.dart';

@immutable
sealed class EntertainmentState {}

final class EntertainmentInitial extends EntertainmentState {}
final class ChangeIndex extends EntertainmentState {}
