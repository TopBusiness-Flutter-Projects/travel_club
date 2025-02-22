part of 'food_cubit.dart';

@immutable
sealed class FoodState {}

final class FoodInitial extends FoodState {}
final class ChangeIndexFood extends FoodState {}
final class ChangeFavourite extends FoodState {}
final class ChangeCount extends FoodState {}
final class DateChangedState extends FoodState {}
final class LoadingGetCatogery extends FoodState {}
final class ErrorGetCatogery extends FoodState {}
final class LoadedGetCatogery extends FoodState {}
final class LoadingGetFood extends FoodState {}
final class LoadedGetFood extends FoodState {}
final class ErrorGetFood extends FoodState {}
