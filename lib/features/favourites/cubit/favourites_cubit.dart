import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_club/core/exports.dart';
import '../data/repo/favourites_repo_impl.dart';
import 'favourites_state.dart';

class FavouritesCubit extends Cubit<FavouritesState> {
  FavouritesCubit(this.api) : super(FavouritesInitial());
  FavouritesRepoImpl api;
  int selectedIndex=0;
  List<String>categories=[
    AppTranslations.accommodation,
    AppTranslations.transportation,
    AppTranslations.food
  ];
  void changeContainer(int index){
    selectedIndex=index;
    emit(IndexChanged());
  }
}
