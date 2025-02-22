import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_club/core/exports.dart';
import 'package:travel_club/features/home/data/models/home_model.dart';
import '../../residence/data/models/lodges_model.dart';
import '../../transportation/data/models/get_companies_model.dart';
import '../data/models/home_filter_model.dart';
import '../data/repo/home_repo_impl.dart';
import 'home_state.dart';
class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this.api) : super(HomeInitial());
  HomeRepoImpl api;
  int moduleslenth = 2;
  TextEditingController searchController = TextEditingController();

  GetHomeModel homeModel = GetHomeModel();
  getHomeData() async {
    emit(LoadingHomeData());
    final res = await api.getHome();
    res.fold((l) {
      emit(ErrorGetHomeData());
    }, (r) {
      homeModel = r;
      // homeModel.data!.modules = homeModel.data!.modules!.sublist(0, moduleslenth);
      emit(SucessGetHomeData());
    });
  }
  GetHomeFilter homeFilterModel = GetHomeFilter();
  GetLodgesModel residenceFavouriteModel = GetLodgesModel();
  GetCompaniesModel transportationFavouriteModel = GetCompaniesModel();
  getHomeFilterData({String ?text,BuildContext ?context}) async {
    print("selectedIndex $selectedIndex");
  int selectedId= selectedIndex+1;
    print("selectedIndex $selectedIndex");
    print("selectedId $selectedId");

    emit(LoadingHomeFilterDataState());
    final res = await api.getHomeFilter(catId:selectedId.toString()??"0" , searchText: searchController.text??"");
    res.fold((l) {
      emit(ErrorHomeFilterDataState());
    }, (r) {
      if (selectedId.toString() == "1") {
        print("selecte1");
        residenceFavouriteModel = r;
      }
      else if (selectedId.toString() == "2") {
        transportationFavouriteModel = r;
      }else{
        homeFilterModel = r;
      }
     // homeFilterModel = r;
      emit(SucessHomeFilterDataState());
    });
  }
  int selectedIndex=0;
  void changeContainer(int index){
    print("index $index");
    selectedIndex=index;
    emit(IndexChanged());
  }

  onChangeSearch(String? value, BuildContext context) {
    getHomeFilterData( context:  context);
  }
 
}
