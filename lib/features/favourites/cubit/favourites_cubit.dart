import 'package:travel_club/core/exports.dart';
import 'package:travel_club/features/residence/cubit/residence_cubit.dart';
import 'package:travel_club/features/transportation/cubit/transportation_cubit.dart';
import '../../food/data/models/get_resturant_model.dart';
import '../../home/data/models/home_model.dart';
import '../../payment/cubit/payment_cubit.dart';
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
  GetLodgesModel residenceFavouriteModel = GetLodgesModel();
  GetCompaniesModel transportationFavouriteModel = GetCompaniesModel();
  GetRestaurantModel getRestaurantModel=GetRestaurantModel();


getFavourite() async {
    emit(LoadingReservationFavourite());
    final res = await api.getFavourite(moduleId: selectedModuleId,);
    res.fold((l) {
      emit(ErrorGetReservationFavourite());
    }, (r) {
      if (selectedModuleId == 1) {
        residenceFavouriteModel = r;
      }
      if (selectedModuleId == 2) {
        transportationFavouriteModel = r;
      }if (selectedModuleId == 3) {
        getRestaurantModel = r;
      }
      emit(LoadedReservationFavourite());
    });
  }
  void changeModule(int moduleId) {
    selectedModuleId = moduleId;
    getFavourite();
    emit(IndexChanged());
  }

addAndRemoveFav({required   BuildContext context,required String id,required bool isFav ,required int selectedModuleIdd,bool favScreen=false})async{
  emit(LoadingReservationFavourite());
  updateFavouritesInModels(context, isFav: isFav, id: id, selectedModuleIdd: selectedModuleIdd);
  final res = await api.postFav(moduleId: context.read<PaymentCubit>().currentModuleId.toString(), id: id,);
  res.fold((l) {

    emit(ErrorReservationFavourite(oldFav: isFav));
    },
          (r) {
            if(favScreen)
            getFavourite();

            emit(LoadedReservationFavourite());
  });
    }
// changeFavourite({required bool isFav}) {
//     isFav = !isFav;
//   //  isFavourite=isFav;
//     emit(ChangeFavourite());
//   }
updateFavouritesInModels(BuildContext context,{required bool isFav,required String id, required int selectedModuleIdd})async{
  if(selectedModuleIdd==1){

if (context.read<ResidenceCubit>().placesModel.data != null) {


    for(int i=0;i<context.read<ResidenceCubit>().placesModel.data!.lodges!.length;i++){
      if(context.read<ResidenceCubit>().placesModel.data!.lodges![i].id.toString()==id){
        context.read<ResidenceCubit>().placesModel.data!.lodges![i].isFav=isFav;
      }
    } }
    if (context.read<ResidenceCubit>().lodgesModel.data != null) {

    for(int i=0;i<context.read<ResidenceCubit>().lodgesModel.data!.length;i++){
      if(context.read<ResidenceCubit>().lodgesModel.data![i].id.toString()==id){
        context.read<ResidenceCubit>().lodgesModel.data![i].isFav=isFav;
      }
    }}
for(int i=0;i<residenceFavouriteModel.data!.length;i++){
  if(residenceFavouriteModel.data![i].id.toString()==id){
    residenceFavouriteModel.data![i].isFav=isFav;
  }
}
  }
  if(selectedModuleIdd==2){

if(context.read<TransportationCubit>().getCompaniesModel.data != null) {
  for(int i=0;i<context.read<TransportationCubit>().getCompaniesModel.data!.length;i++){
    if(context.read<TransportationCubit>().getCompaniesModel.data![i].id.toString()==id){
      context.read<TransportationCubit>().getCompaniesModel.data![i].isFavorite=isFav;
    }
  }

}
  for(int i=0;i<transportationFavouriteModel.data!.length;i++){
      if(transportationFavouriteModel.data![i].id.toString()==id){
        transportationFavouriteModel.data![i].isFavorite=isFav;
      }
    }
  }
  emit(LoadingReservationFavourite());
}
}
