import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_club/core/exports.dart';
import 'package:travel_club/features/home/data/models/home_model.dart';
import '../data/repo/home_repo_impl.dart';
import 'home_state.dart';
class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this.api) : super(HomeInitial());
  HomeRepoImpl api;
  GetHomeModel?homeModel;
  getHomeData() async {
    emit(LoadingHomeData());
    final res = await api.getHome();
    res.fold((l) {
      emit(ErrorGetHomeData());
    }, (r) {
       homeModel = r;
      // getUserData();
      emit(SucessGetHomeData());
    });
  }

}
