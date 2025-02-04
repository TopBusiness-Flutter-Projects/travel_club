import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_club/core/exports.dart';
import '../../home/data/models/home_model.dart';
import '../../residence/data/models/lodges_model.dart';
import '../../transportation/data/models/get_companies_model.dart';
import '../data/repo/favourites_repo_impl.dart';
import 'favourites_state.dart';

class FavouritesCubit extends Cubit<FavouritesState> {
  FavouritesCubit(this.api) : super(FavouritesInitial());
  FavouritesRepoImpl api;
  int selectedIndex=0;
  int selectedModuleId = 1;
  ModuleModel? selectedModule;
  List<String>categories=[
    AppTranslations.accommodation,
    AppTranslations.transportation,
    AppTranslations.food,
    AppTranslations.entertainment
  ];
  // void changeContainer(int index){
  //   selectedIndex=index;
  //   emit(IndexChanged());
  // }
  GetLodgesModel residenceFavouriteModel =
  GetLodgesModel();
  GetCompaniesModel transportationFavouriteModel = GetCompaniesModel();


getFavourite() async {
    emit(LoadingReservationFavourite());
    final res = await api.getFavourite(moduleId: selectedModuleId,);
    res.fold((l) {
      emit(ErrorReservationFavourite());
    }, (r) {
      if (selectedModuleId == 1) {
        residenceFavouriteModel = r;
      }
      if (selectedModuleId == 2) {
        transportationFavouriteModel = r;
      }
      emit(LoadedReservationFavourite());
    });
  }
  void changeModule(int moduleId) {
    selectedModuleId = moduleId;
    getFavourite();
    emit(IndexChanged());
  }



}
