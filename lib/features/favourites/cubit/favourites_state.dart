abstract class FavouritesState {}

class FavouritesInitial extends FavouritesState {}
class LoadingReservationFavourite extends FavouritesState {}
class ErrorReservationFavourite extends FavouritesState {}
class LoadedReservationFavourite extends FavouritesState {}
class LoadedFavourite extends FavouritesState {}
class IndexChanged extends FavouritesState {}
class ChangeFavourite extends FavouritesState {}
