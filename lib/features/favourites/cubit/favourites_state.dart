abstract class FavouritesState {}

class FavouritesInitial extends FavouritesState {}
class LoadingReservationFavourite extends FavouritesState {}
class ErrorReservationFavourite extends FavouritesState {
 final bool oldFav;

 ErrorReservationFavourite({required this.oldFav});
}
class LoadedReservationFavourite extends FavouritesState {}
class ErrorGetReservationFavourite extends FavouritesState {}
class LoadedFavourite extends FavouritesState {}
class IndexChanged extends FavouritesState {}
class ChangeFavourite extends FavouritesState {}
