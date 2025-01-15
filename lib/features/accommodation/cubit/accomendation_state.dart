part of 'accomendation_cubit.dart';

@immutable
abstract class AccomendationState {}

final class DetailsAccomendationPngInitial extends AccomendationState {}

final class ChangeIndex extends AccomendationState {}

final class SetMarkersState extends AccomendationState {}
final class MinusLoaded extends AccomendationState {}
final class PlusLoaded extends AccomendationState {}
final class IsAddedChange extends AccomendationState {}
final class ChangeChoice extends AccomendationState {}
final class ChangePrivacy extends AccomendationState {}
//places
final class PlacesLoaded extends AccomendationState {}
final class PlacesLoading extends AccomendationState {}
final class PlacesError extends AccomendationState {}
//facilities
final class FacilitiesLoaded extends AccomendationState {}
final class FacilitiesLoading extends AccomendationState {}
final class FacilitiesError extends AccomendationState {}
//lodges
final class LoadgesLoaded extends AccomendationState {}
final class LoadgesLoading extends AccomendationState {}
final class LoadgesError extends AccomendationState {}

final class SetSelectedFilter extends AccomendationState {}
//get  lodges details
final class LodgesDetailsLoaded extends AccomendationState {}
final class LodgesDetailsLoading extends AccomendationState {}
final class LodgesDetailsError extends AccomendationState {}
//stars filter
final class ChangeSelcetedStars extends AccomendationState {}
// loadges rooms
final class LodgesRoomLoaded extends AccomendationState {}
final class LodgesRoomLoading extends AccomendationState {}
final class LodgesRoomError extends AccomendationState {}

