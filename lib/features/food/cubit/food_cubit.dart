import 'package:easy_localization/easy_localization.dart';
import 'package:travel_club/core/exports.dart';

import '../data/models/get_catogrey_model.dart';
import '../data/models/get_restaurant_details_model.dart';
import '../data/models/get_resturant_model.dart';
import '../data/repo/food_repo_impl.dart';

part 'food_state.dart';

class FoodCubit extends Cubit<FoodState> {
  FoodCubit(this.api) : super(FoodInitial());
  FoodRepoImpl? api;
  CatogreyDataFood selectedIndex = CatogreyDataFood(id: 0, name: "all_foods".tr());
  int selectedIndexFavourite = 0;
  bool? isFavoriteTrue = false;
  void changeIndex(  CatogreyDataFood categoryDataFood) {
    selectedIndex = categoryDataFood;
    getRestaurant();
    emit(ChangeIndexFood());
  }

  // void changeFavourite() {
  //    isFavoriteTrue = !(isFavoriteTrue ?? false);
  //    emit(ChangeFavourite());
  //  }
  void changeFavourite(int index) {
    if (index == selectedIndexFavourite) {
      isFavoriteTrue = !(isFavoriteTrue ?? false);
      emit(ChangeFavourite());
    }
    // emit(ChangeFavourite());
  }

  bool isServiceSelected = false;
  void changeIndexService(bool index) {
    isServiceSelected = index;
    emit(ChangeIndexFood());
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
    emit(ChangeIndexFood());
  }

  int itemsQty = 0;

  void addOrRemoveMenuCart(bool isAdd) {
   
   if (isAdd) {
      itemsQty++;
    } else {
      if (itemsQty > 0) {
        itemsQty--;
      }
    }
    emit(ChangeCount());
  } // Change the count of items


  String singleDate = DateFormat('yyyy-MM-dd', 'en').format(DateTime.now());
  DateTime selectedDate = DateTime.now();
 void onSelectedDateSingle({required BuildContext context}) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(9999),
    );

    if (picked != null) {
      selectedDate = picked;

      updateDateStrings();
      emit(DateChangedState());
    }
  }
  void updateDateStrings() {
   
    singleDate = DateFormat('yyyy-MM-dd', 'en')
        .format(selectedDate); // تاريخ اليوم كقيمة افتراضية
  }
//get catogrey
  GetCategoryFoodModel categoryModel = GetCategoryFoodModel();
  getCategoryData() async {
    emit(LoadingGetCatogery());
    final res = await api?.getCatogrey();
    res?.fold((l) {
      emit(ErrorGetCatogery());
    }, (r) {
      List<CatogreyDataFood> list = r.data ?? [];
    //  list = list.reversed.toList();

      //list.add(CatogreyDataFood(id: 0, name: "All".tr()));
      list.insert(0,CatogreyDataFood(id: 0, name: "all_foods".tr()));
   //  list = list.reversed.toList();
      categoryModel.data = list;
      getRestaurant();
      emit(LoadedGetCatogery());
    });
  }

//get food
//   String ?catogreyId;
  GetRestaurantModel? getRestaurantModel ;
  getRestaurant() async {
    getRestaurantModel = null;
    emit(LoadingGetFood());
    final res = await api?.getRestuarnt(id: selectedIndex.id .toString());
    res?.fold((l) {

      emit(ErrorGetFood());
    }, (r) {
      if(r.status==404){

        emit(ErrorGetCatogery());
      }
      getRestaurantModel = r;
      emit(LoadedGetFood());
    });
  }
  GetRestaurantDetailsModel? getRestaurantDetailsModel ;
  getRestaurantDetails({String ?id}) async {
    // getRestaurantDetailsModel = null;
    emit(LoadingGetFoodDetails());
    final res = await api?.getRestaurantDetails(id: id .toString());
    res?.fold((l) {
      emit(ErrorGetFoodDetails());
    }, (r) {
      if(r.status==404){
        emit(ErrorGetFoodDetails());
      }
      getRestaurantDetailsModel = r;
      emit(LoadedGetFoodDetails());
    }
    );
  }
}
