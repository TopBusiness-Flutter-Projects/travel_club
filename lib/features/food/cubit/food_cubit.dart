import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../data/repo/food_repo_impl.dart';

part 'food_state.dart';

class FoodCubit extends Cubit<FoodState> {
  FoodCubit(this.api) : super(FoodInitial());
  FoodRepoImpl? api;
  int selectedIndex = 0;
  int selectedIndexFavourite = 0;
 bool? isFavoriteTrue=false;
  void changeIndex(int index) {
    selectedIndex = index;
    emit(ChangeIndex());
  }
 // void changeFavourite() {
 //    isFavoriteTrue = !(isFavoriteTrue ?? false);
 //    emit(ChangeFavourite());
 //  }
  void changeFavourite(int index) {
    if(index==selectedIndexFavourite) {
      isFavoriteTrue = !(isFavoriteTrue ?? false);
      emit(ChangeFavourite());
    }
      // emit(ChangeFavourite());
     }
  bool isServiceSelected = false;
  void changeIndexService(bool index) {
    isServiceSelected = index;
    emit(ChangeIndex());
  }
  final List<String> imageUrls = [
    'https://th.bing.com/th/id/OIP.FtudhIBH-HYhxMpS4TU-sAHaE8?rs=1&pid=ImgDetMain', // Replace with your image URLs
    'https://th.bing.com/th/id/OIP.FtudhIBH-HYhxMpS4TU-sAHaE8?rs=1&pid=ImgDetMain', // Replace with your image URLs
    'https://th.bing.com/th/id/OIP.FtudhIBH-HYhxMpS4TU-sAHaE8?rs=1&pid=ImgDetMain', // Replace with your image URLs
  ];
  int currentIndex = 0;
  int selectedIndexMenue = 0; // Default selected index is the first button

//
  void changeIndexMenue(int index) {
    selectedIndexMenue = index;
    emit(ChangeIndex());
  }

}
