import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_club/core/exports.dart';
import 'package:travel_club/features/home/data/models/home_model.dart';
import '../data/repo/home_repo_impl.dart';
import 'home_state.dart';
class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this.api) : super(HomeInitial());
  HomeRepoImpl api;
  int moduleslenth = 2;
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

 
}
