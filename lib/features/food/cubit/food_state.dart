part of 'food_cubit.dart';

@immutable
sealed class FoodState {}

final class FoodInitial extends FoodState {}
final class ChangeIndex extends FoodState {}
final class ChangeFavourite extends FoodState {}
