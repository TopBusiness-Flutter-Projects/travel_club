part of 'food_cubit.dart';

@immutable
sealed class FoodState {}

final class FoodInitial extends FoodState {}
final class ChangeIndexFood extends FoodState {}
final class ChangeFavourite extends FoodState {}
final class ChangeCount extends FoodState {}
final class DateChangedState extends FoodState {}
