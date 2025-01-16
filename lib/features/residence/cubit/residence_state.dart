part of 'residence_cubit.dart';

@immutable
abstract class ResidenceState {}

final class ResidenceInitial extends ResidenceState {}

final class ChangeIndex extends ResidenceState {}

final class SetMarkersState extends ResidenceState {}

final class MinusLoaded extends ResidenceState {}

final class PlusLoaded extends ResidenceState {}

final class IsAddedChange extends ResidenceState {}

final class ChangeChoice extends ResidenceState {}

final class ChangePrivacy extends ResidenceState {}

//places
final class PlacesLoaded extends ResidenceState {}

final class PlacesLoading extends ResidenceState {}

final class PlacesError extends ResidenceState {}

//facilities
final class FacilitiesLoaded extends ResidenceState {}

final class FacilitiesLoading extends ResidenceState {}

final class FacilitiesError extends ResidenceState {}

//lodges
final class LoadgesLoaded extends ResidenceState {}

final class LoadgesLoading extends ResidenceState {}

final class LoadgesError extends ResidenceState {}

final class SetSelectedFilter extends ResidenceState {}

//get  lodges details
final class LodgesDetailsLoaded extends ResidenceState {}

final class LodgesDetailsLoading extends ResidenceState {}

final class LodgesDetailsError extends ResidenceState {}

//stars filter
final class ChangeSelcetedStars extends ResidenceState {}

// loadges rooms
final class LodgesRoomLoaded extends ResidenceState {}

final class LodgesRoomLoading extends ResidenceState {}

final class LodgesRoomError extends ResidenceState {}
