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

